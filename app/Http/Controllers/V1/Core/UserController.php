<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Requests\V1\Core\Images\IndexImageRequest;
use App\Http\Requests\V1\Core\Images\UploadImageRequest;
use App\Http\Requests\V1\Core\Users\DestroysUserRequest;
use App\Http\Requests\V1\Core\Users\IndexUserRequest;
use App\Http\Requests\V1\Core\Users\StoreUserRequest;
use App\Http\Requests\V1\Core\Users\UpdateUserRequest;
use App\Http\Resources\V1\Core\Users\UserCollection;
use App\Http\Resources\V1\Core\Users\UserResource;
use App\Models\Core\Catalogue;
use App\Models\Core\File;
use App\Models\Authentication\User;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin');
        $this->middleware('permission:view-users')->only(['index', 'show']);
        $this->middleware('permission:store-users')->only(['store']);
        $this->middleware('permission:update-users')->only(['update']);
        $this->middleware('permission:delete-users')->only(['destroy', 'destroys']);
    }

    public function index(IndexUserRequest $request)
    {
        $sorts = explode(',', $request->input('sort'));

        $users = User::customOrderBy($sorts)
            ->email($request->input('search'))
            ->lastname($request->input('search'))
            ->name($request->input('search'))
            ->username($request->input('search'))
            ->paginate($request->input('per_page'));

        return (new UserCollection($users))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function store(StoreUserRequest $request)
    {
        $user = User::where('username', $request->input('username'))
            ->orWhere('email', $request->input('email'))->first();

        if (isset($user) && $user->username === $request->input('username')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El usuario ya se encuentra registrado',
                        'detail' => 'Intente con otro nombre de usuario',
                        'code' => '200'
                    ]
                ])
                ->response()->setStatusCode(400);
        }

        if (isset($user) && $user->email === $request->input('email')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El correo electrónico ya está en uso',
                        'detail' => 'Intente con otro correo electrónico',
                        'code' => '200'
                    ]
                ])->response()->setStatusCode(400);
        }

        $user = new User();
        $user->identificationType()->associate(Catalogue::find($request->input('identificationType.id')));
        $user->sex()->associate(Catalogue::find($request->input('sex.id')));
        $user->gender()->associate(Catalogue::find($request->input('gender.id')));
        $user->bloodType()->associate(Catalogue::find($request->input('bloodType.id')));
        $user->ethnicOrigin()->associate(Catalogue::find($request->input('ethnicOrigin.id')));
        $user->civilStatus()->associate(Catalogue::find($request->input('civilStatus.id')));

        $user->username = $request->input('username');
        $user->password = $request->input('password');
        $user->name = $request->input('name');
        $user->lastname = $request->input('lastname');
        $user->birthdate = $request->input('birthdate');
        $user->email = $request->input('email');

        DB::transaction(function () use ($request, $user) {
            $user->save();
            $user->addPhones($request->input('phones'));
            $user->addEmails($request->input('emails'));
        });

        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function show(User $user)
    {
        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $user->identificationType()->associate(Catalogue::find($request->input('identificationType.id')));
        $user->sex()->associate(Catalogue::find($request->input('sex.id')));
        $user->gender()->associate(Catalogue::find($request->input('gender.id')));
        $user->bloodType()->associate(Catalogue::find($request->input('bloodType.id')));
        $user->ethnicOrigin()->associate(Catalogue::find($request->input('ethnicOrigin.id')));
        $user->civilStatus()->associate(Catalogue::find($request->input('civilStatus.id')));

        $user->username = $request->input('username');
        $user->name = $request->input('name');
        $user->lastname = $request->input('lastname');
        $user->birthdate = $request->input('birthdate');
        $user->email = $request->input('email');

        $user->save();
        $user->addPhones($request->input('phones'));
        $user->addEmails($request->input('emails'));

        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function destroy(Request $request, User $user)
    {
        if ($request->user()->id === $user->id) {
            return response()->json([
                'msg' => [
                    'summary' => 'Error al eliminar',
                    'detail' => 'El usuario se encuentra logueado',
                    'code' => '400'
                ],
            ], 400);
        }

        $user->delete();

        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'Usuario Eliminado',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    public function destroys(DestroysUserRequest $request)
    {
        if (in_array($request->user()->id, $request->ids)) {
            return response()->json([
                'msg' => [
                    'summary' => 'Error al eliminar',
                    'detail' => 'El usuario se encuentra logueado',
                    'code' => '400'
                ],
            ], 400);
        }

        $users = User::whereIn('id', $request->input('ids'))->get();

        User::destroy($request->input('ids'));

        return (new UserCollection($users))
            ->additional([
                'msg' => [
                    'summary' => 'Usuarios Eliminados',
                    'detail' => '',
                    'code' => '201'
                ]
            ])
            ->response()->setStatusCode(201);
    }

    // Images
    public function uploadImage(UploadImageRequest $request, User $user)
    {
        return $user->uploadImage($request);
    }

    public function indexImage(IndexImageRequest $request)
    {
        return (new ImageController())->index($request, User::find($request->input('id')));
    }

    // Files
    public function indexFiles(IndexFileRequest $request, User $user)
    {
        return $user->indexFiles($request);
    }

    public function uploadFile(UploadFileRequest $request, User $user)
    {
        return $user->uploadFile($request);
    }

    public function downloadFile(User $user, File $file)
    {
        return $user->downloadFile($file);
    }

    public function showFile(User $user, File $file)
    {
        return $user->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, User $user, File $file)
    {
        return $user->updateFile($request, $file);
    }

    public function destroyFile(User $user, File $file)
    {
        return $user->destroyFile($file);
    }

    public function destroyFiles(User $user, DestroysFileRequest $request)
    {
        return $user->destroyFiles($request);
    }
}

