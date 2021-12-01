<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
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
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

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

    /**
     * Display a listing of the resource.
     *
     * @return UserCollection
     */
    public function index(IndexUserRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $users = User::customSelect($request->fields)->customOrderBy($sorts)
            ->name($request->input('name'))
            ->lastname($request->input('lastname'))
            ->paginate();

        return (new UserCollection($users))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return UserResource
     */
    public function store(StoreUserRequest $request)
    {
        $user = User::where('username', $request->input('username'))
            ->orWhere('email', $request->input('email'))->first();

        if ($user->username === $request->input('username')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El usuario ya se encuentra registrado',
                        'detail' => 'Intente con otro nombre de usuario',
                        'code' => '200'
                    ]
                ]);
        }

        if ($user->email === $request->input('email')) {
            return (new UserResource($user))
                ->additional([
                    'msg' => [
                        'summary' => 'El correo electrónico ya está en uso',
                        'detail' => 'Intente con otro correo electrónico',
                        'code' => '200'
                    ]
                ]);
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
            ]);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\User $user
     * @return UserResource
     */
    public function show(User $user)
    {
        return (new UserResource($user))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\User $user
     * @return UserResource
     */
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
            ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\User $user
     * @return UserResource|\Illuminate\Http\JsonResponse
     */
    public function destroy(Request $request, User $user)
    {
        if ($request->user()->id === $user->id) {
            return response()->json([
                'msg' => [
                    'summary' => 'No se puede eliminar',
                    'detail' => 'No puede eliminar el usuario logueado',
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
                    'code' => '200'
                ]
            ]);
    }

    public function destroys(DestroysUserRequest $request)
    {
        if (in_array($request->user()->id, $request->ids)) {
            return response()->json([
                'msg' => [
                    'summary' => 'No se pudeo eliminar',
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
            ]);
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

