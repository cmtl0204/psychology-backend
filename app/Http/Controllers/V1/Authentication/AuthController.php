<?php

namespace App\Http\Controllers\V1\Authentication;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Authentications\ChangePasswordAuthRequest;
use App\Http\Requests\V1\Core\Authentications\GenerateTransactionalCodeAuthRequest;
use App\Http\Requests\V1\Core\Authentications\RequestPasswordResetRequest;
use App\Http\Requests\V1\Core\Authentications\ResetPasswordAuthRequest;
use App\Http\Requests\V1\Core\Authentications\UnlockAuthRequest;
use App\Http\Requests\V1\Core\Authentications\UserUnlockAuthRequest;
use App\Http\Requests\V1\Core\Authentications\LoginAuthRequest;
use App\Http\Requests\V1\Core\Authentications\VerifyTransactionalCodeAuthRequest;
use App\Http\Resources\V1\Authentication\AuthResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Mail\Authentication\RequestPasswordResetMailable;
use App\Mail\Authentication\TransactionalCodeMailable;
use App\Models\Authentication\TransactionalCode;
use App\Models\Authentication\PasswordReset;
use App\Models\Authentication\User;

class AuthController extends Controller
{
    public function __construct()
    {
    }

    public function login(LoginAuthRequest $request)
    {
        $user = $this->validateUser($request->input('username'));
        if (!isset($user->id)) {
            return $user;
        }

        if (!Hash::check($request->input('password'), $user->password)) {
            return $user->reducePasswordAttempts();
        }

        $user->resetMaxAttempts();

        return (new AuthResource($user))
            ->additional([
                'token' => $user->createToken($request->getClientIp())->plainTextToken,
                'msg' => [
                    'summary' => 'Acceso correcto',
                    'detail' => 'Bienvenido',
                    'code' => '200'
                ]
            ]);
    }

    public function logout()
    {
        auth()->user()->currentAccessToken()->delete();
        return response()->json([
            'msg' => [
                'summary' => 'Su sesión ha sido cerrada correctamente',
                'detail' => '',
                'code' => '200'
            ]
        ], 200);
    }

    public function logutAll()
    {
        auth()->user()->tokens()->delete();
        return response()->json([
            'msg' => [
                'summary' => 'logoutAll',
                'detail' => '',
                'code' => '200'
            ]
        ], 200);
    }

    public function handleProviderCallback($driver): \Illuminate\Http\RedirectResponse
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
        $user->username = $request->input('username');
        $user->name = $request->input('name');
        $user->lastname = $request->input('lastname');
        $user->email = $request->input('email');
        $user->password = $request->input('password');
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

    public function changePassword(changePasswordAuthRequest $request)
    {
        $user = $this->validateUser($request->user()->username);

        if (!isset($user->id)) {
            return $user;
        }

        if (!Hash::check($request->input('currentPassword'), $user->password)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'La contrseña actual no es válida',
                    'detail' => 'Intente de nuevo',
                    'code' => '403'
                ]], 403);
        }

        $user->password = $request->input('password');
        $user->password_changed = true;
        $user->save();

        if ($request->input('logoutAll') === true) {
            $user->tokens()->delete();
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
        $user = $this->validateUser($request->user()->username);

        if (!isset($user->id)) {
            return $user;
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
        $passwordReset = PasswordReset::firstWhere('token', $request->input('token'));

        if (!isset($passwordReset->token)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token no fue encontrado',
                    'code' => '400'
                ]], 400);
        }

        if ($passwordReset->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ya fue utilizado',
                    'code' => '403'
                ]], 403);
        }

        if ((new Carbon($passwordReset->created_at))->addMinutes(User::DECAY_MINUTES_PASSWORD_FORGOT) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ha expirado',
                    'code' => '403'
                ]], 403);
        }

        $user = User::firstWhere('username', $passwordReset->username);

        if (!isset($user->id)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Usuario no encontrado',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        $user->password = $request->input('password');
        $user->max_attempts = 3;// esto es temporal
        $user->save();

        $passwordReset->update(['used' => true]);

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
        $user = $this->validateUser($request->user()->username);

        if (!isset($user->id)) {
            return $user;
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
        $passwordReset = PasswordReset::firstWhere('token', $request->input('token'));

        if (!isset($passwordReset->token)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token no fue encontrado',
                    'code' => '404'
                ]], 404);
        }

        if ($passwordReset->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ya fue utilizado',
                    'code' => '403'
                ]], 403);
        }

        if ((new Carbon($passwordReset->created_at))->addMinutes(User::DECAY_MINUTES_PASSWORD_FORGOT) <= Carbon::now()) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Token no válido',
                    'detail' => 'El token ha expirado',
                    'code' => '403'
                ]], 403);
        }

        $user = User::firstWhere('username', $passwordReset->username);

        if (!isset($user->id)) {
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

        $passwordReset->update(['used' => true]);

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Su usuario fue desbloqueado',
                'detail' => 'Regrese al Login',
                'code' => '201'
            ]], 201);
    }

    // funcion pendiende de revisar
    public function markEmailAsVerified(User $user)
    {
        $user->markEmailAsVerified();

        return view('mails.authentication.mark-email-verified')
            ->with(['user' => $user]);;
    }

    public function generateTransactionalCode(GenerateTransactionalCodeAuthRequest $request)
    {
        $user = $this->validateUser($request->user()->username);

        if (!isset($user->id)) {
            return $user;
        }

        $token = mt_rand(100000, 999999);

        TransactionalCode::create([
            'username' => $user->username,
            'token' => $token
        ]);

        Mail::to($user->email)
            ->send(new TransactionalCodeMailable(
                'Información Código de Seguridad',
                json_encode(['user' => $user, 'token' => $token])
            ));

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
        $transactionalCode = TransactionalCode::firstWhere('token', $request->input('token'));

        if (!isset($transactionalCode->token)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'Intente de nuevo',
                    'code' => '400'
                ]], 400);
        }

        if ($transactionalCode->used) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Código no válido',
                    'detail' => 'El código ya fue utilizado',
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

        if (!isset($user->id)) {
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
            ]], 200);
    }

    public function validateUser($username)
    {
        $user = User::firstWhere('username', $username);

        if (isset($user->id)) {
            return $user;
        }

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Usuario no encontrado',
                'detail' => 'Intente de nuevo',
                'code' => '404'
            ]], 404);

    }

    // Para validacion asincronica desde el cliente y saber si el nombre de usuario existe o no
    public function verifyUser($username)
    {
        $user = User::firstWhere('username', $username);

        if (isset($user->id)) {
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

    // Para validacion asincronica desde el cliente y saber si el email existe o no
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

    // Para validacion asincronica desde el cliente y saber si el telefono existe o no
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
                'summary' => 'Número de teléfono disponible',
                'detail' => '',
                'code' => '200'
            ]], 200);
    }
}
