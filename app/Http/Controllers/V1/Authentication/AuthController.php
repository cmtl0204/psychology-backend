<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Exceptions\ModelNotFound;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Authentications\ChangePasswordAuthRequest;
use App\Http\Requests\V1\Core\Authentications\GenerateTransactionalCodeAuthRequest;
use App\Http\Requests\V1\Core\Authentications\RequestPasswordResetRequest;
use App\Http\Requests\V1\Core\Authentications\ResetPasswordAuthRequest;
use App\Http\Requests\V1\Core\Authentications\UnlockAuthRequest;
use App\Http\Requests\V1\Core\Authentications\UserUnlockAuthRequest;
use App\Http\Requests\V1\Core\Authentications\LoginAuthRequest;
use App\Http\Requests\V1\Core\Authentications\VerifyTransactionalCodeAuthRequest;
use App\Http\Resources\V1\Core\Authentications\AuthResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Mail\Authentication\RequestPasswordResetMailable;
use App\Models\Authentication\TransactionalCode;
use App\Models\Authentication\PasswordReset;
use App\Models\Authentication\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
    public function __construct()
    {
    }

    public function login(LoginAuthRequest $request)
    {
        $user = User::firstWhere('username', $request->username);

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'No se encontró el registro',
                    'detail' => '',
                    'code' => '404',
                ]
            ], 404);
        }

        if (!Hash::check($request->password, $user->password)) {
            return $this->reducePasswordAttempts($user);
        }

        $this->resetMaxAttempts($user);

        return (new AuthResource($user))->additional([
            'token' => $user->createToken($request->getClientIp())->plainTextToken,
            'msg' => [
                'summary' => 'Acceso correcto',
                'detail' => 'Bienvenido',
                'code' => '200'
            ]
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'msg' => [
                'summary' => 'Su sesión ha sido cerrada correctamente',
                'detail' => '',
                'code' => '200'
            ]
        ], 200);
    }

    public function logoutAll(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json([
            'msg' => [
                'summary' => 'logoutAll',
                'detail' => '',
                'code' => '200'
            ]
        ], 200);
    }

    public function handleProviderCallback($driver)
    {
        $userSocialite = Socialite::driver($driver)->stateless()->user();
        $user = User::firstWhere('email', $userSocialite->getEmail());

        if ($user) {
            if ($userSocialite->user['verified_email']) {
                $user->markEmailAsVerified();
            }
            $token = $user->createToken($userSocialite->getEmail())->accessToken;
            $url = "http://frontend-ignug.test:4200/#/auth/login?username={$user->username}&token={$token}";
            return redirect()->to($url);
        }

        $url = "http://frontend-ignug.test:4200/#/auth/unregistered-user?email={$userSocialite->getEmail()}";
//            ."&given_name={$userSocialite->user['given_name']}" .
//            "&family_name={$userSocialite->user['family_name']}";

        return redirect()->to($url);
    }

    public function redirectToProvider($driver)
    {
        return Socialite::driver($driver)->redirect();
    }

    public function registerSocialiteUser(Request $request)
    {
        $user = new User();
        $user->username = $request->username;
        $user->name = $request->name;
        $user->lastname = $request->lastname;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->save();

        $token = $user->createToken($user->email)->accessToken;

        $detail = '';
        if (!$user->email_verified_at) {
            $detail = "Revise su correo para verificar su cuenta";
            Mail::to($user->email)
                ->send(new EmailVerifiedMailable(
                    'Verificación de Correo Electrónico',
                    json_encode(['user' => $user]),
                    null,
                    $request->input('system')
                ));
        }

        return response()->json([
            'data' => $token,
            'token' => $token,
            'msg' => [
                'summary' => 'Usuario registrado correctamente',
                'detail' => $detail,
                'code' => '201',
            ]], 201);
    }

    private function reducePasswordAttempts($user)
    {
        $user->max_attempts = $user->max_attempts - 1;
        $user->save();

        if ($user->max_attempts <= 0) {
            $user->max_attempts = 0;
            $user->save();

            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Oops! Su usuario ha sido bloqueado!',
                    'detail' => 'Demasiados intentos de inicio de sesión',
                    'code' => '429'
                ]], 429);
        }

        return response()->json([
            'data' => $user->attempts,
            'msg' => [
                'summary' => 'Contrasaña incorrecta',
                'detail' => "Oops! le quedan {$user->max_attempts} intentos",
                'code' => '401',
            ]], 401);
    }

    public function resetMaxAttempts($user)
    {
        $user->max_attempts = User::MAX_ATTEMPTS;
        $user->save();

        return response()->json([
            'data' => $user->attempts,
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '201',
            ]], 201);
    }

    public function changePassword(changePasswordAuthRequest $request)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrando',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $user->password = trim($request->input('password'));
        $user->password_changed = true;
        $user->save();

        if ($request->logoutAll == true) {
            $request->user()->tokens()->delete();
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Su contraseña fue cambiada',
                'detail' => '',
                'code' => '201'
            ]], 201);
    }

    public function requestPasswordReset(RequestPasswordResetRequest $request)
    {
        $user = User::where('username', $request->input('username'))
            ->orWhere('email', $request->input('username'))
            ->first();

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrando',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $token = Str::random(70);

        PasswordReset::create([
            'username' => $user->username,
            'token' => $token
        ]);

        Mail::to($user->email)
            ->send(new RequestPasswordResetMailable(
                'Notificación de restablecimiento de contraseña',
                json_encode(['user' => $user, 'token' => $token])
            ));

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Correo enviado',
                'detail' => $user->hiddenStringEmail($user->email),
                'code' => '201'
            ]], 201);
    }

    public function resetPassword(ResetPasswordAuthRequest $request)
    {
        $passworReset = PasswordReset::firstWhere('token', $request->token);

        if (!$passworReset) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token no fue encontrado',
                    'code' => '400'
                ]], 400);
        }

        if ($passworReset->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ya fue usado',
                    'code' => '403'
                ]], 403);
        }

        if ((new Carbon($passworReset->created_at))->addMinutes(User::DECAY_MINUTES_PASSWORD_FORGOT) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no valido',
                    'detail' => 'El token ha expirado',
                    'code' => '403'
                ]], 403);
        }

        $user = User::firstWhere('username', $passworReset->username);

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrado',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $user->password = trim($request->password);
        $user->max_attempts = 3;// esto es temporal
        $user->save();
        $passworReset->update(['used' => true]);
        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Su contraseña fue restablecida',
                'detail' => 'Regrese al Login',
                'code' => '201'
            ]], 201);
    }

    public function requestUserUnlock(UserUnlockAuthRequest $request)
    {
        $user = User::where('username', $request->input('username'))
            ->orWhere('email', $request->input('username'))
            ->first();

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrando',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $token = Str::random(70);

        PasswordReset::create([
            'username' => $user->username,
            'token' => $token
        ]);

//        Mail::to($user->email)
//            ->send(new UserUnlockMailable(
//                'Notificación de desbloqueo de usuario',
//                json_encode(['user' => $user, 'token' => $token]),
//                null,
//                $request->input('system')
//            ));

        return response()->json([
            'data' => $token,
            'msg' => [
                'summary' => 'Correo enviado',
                'detail' => $user->hiddenStringEmail($user->email),
                'code' => '201'
            ]], 201);
    }

    public function unlockUser(UnlockAuthRequest $request)
    {
        $passworReset = PasswordReset::firstWhere('token', $request->token);

        if (!$passworReset) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token no fue encontrado',
                    'code' => '400'
                ]], 400);
        }

        if ($passworReset->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ya fue usado',
                    'code' => '403'
                ]], 403);
        }

        if ((new Carbon($passworReset->created_at))->addMinutes(User::DECAY_MINUTES_PASSWORD_FORGOT) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no valido',
                    'detail' => 'El token ha expirado',
                    'code' => '403'
                ]], 403);
        }

        $user = User::firstWhere('username', $passworReset->username);

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrado',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $user->max_attempts = User::MAX_ATTEMPTS;
        $user->save();
        $passworReset->update(['used' => true]);

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Su usuario fue desbloqueado',
                'detail' => 'Regrese al Login',
                'code' => '201'
            ]], 201);
    }

    public function emailVerified($email)
    {
        $user = User::firstWhere('email', $email);

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrando',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

//        Mail::to($user->email)
//            ->send(new EmailVerifiedMailable(
//                'Verificación de Correo Electrónico',
//                json_encode(['user' => $user]),
//                null,
//                $request->input('system')
//            ));

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Correo enviado',
                'detail' => $user->hiddenStringEmail($user->email),
                'code' => '201'
            ]], 201);
    }

    public function markEmailAsVerified(User $user)
    {
        $user->markEmailAsVerified();

        return view('pages.authentication.verify-email')
            ->with(['user' => $user]);;
    }

    public function generateTransactionalCode(GenerateTransactionalCodeAuthRequest $request)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrando',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $token = mt_rand(100000, 999999);
        TransactionalCode::create([
            'username' => $user->username,
            'token' => $token
        ]);

//        Mail::to($user->email)
//            ->send(new EmailMailable(
//                'Información Código de Seguridad',
//                json_encode(['user' => $user])
//            ));

        return response()->json([
            'data' => $token,
            'msg' => [
                'summary' => 'Correo enviado',
                'detail' => $user->hiddenStringEmail($user->email),
                'code' => '201'
            ]], 201);
    }

    public function verifyTransactionalCode(VerifyTransactionalCodeAuthRequest $request)
    {
        $transactionalCode = TransactionalCode::firstWhere('token', $request->token);

        if (!$transactionalCode) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no encontrado',
                    'detail' => 'Intente de nuevo',
                    'code' => '400'
                ]], 400);
        }
        if ($transactionalCode->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no valido',
                    'detail' => 'El código ya fue usado',
                    'code' => '403'
                ]], 403);
        }
        if ((new Carbon($transactionalCode->created_at))->addMinutes(User::DECAY_MINUTES_TRANSACTIONAL_CODE) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'El código ha expirado',
                    'code' => '403'
                ]], 403);
        }
        $user = User::firstWhere('username', $transactionalCode->username);

        if (!$user) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrado',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $transactionalCode->update(['used' => true]);
        return response()->json([
            'data' => true,
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '201'
            ]], 201);
    }

    public function verifyUser($username)
    {
        $user = User::firstWhere('username', $username);

        if ($user) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'success',
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Nombre de usuario disponible',
                'detail' => '',
                'code' => '200'
            ]], 200);

    }

    public function verifyEmail($email)
    {
        $user = User::firstWhere('email', $email);

        if ($user) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'success',
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Correo electrónico disponible',
                'detail' => '',
                'code' => '200'
            ]], 200);
    }

    public function verifyPhone($phone)
    {
        $user = User::firstWhere('phone', $phone);

        if ($user) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'success',
                        'detail' => '',
                        'code' => '200'
                    ]
                ]);
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Teléfono disponible',
                'detail' => '',
                'code' => '200'
            ]], 200);
    }
}
