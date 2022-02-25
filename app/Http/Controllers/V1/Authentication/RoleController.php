<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Authentication\RoleCollection;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function catalogue()
    {
        $roles= Role::get();
        return (new RoleCollection($roles))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }

    public function givePermissions(Request $request, Role $role)
    {
        $role->givePermissionTo($request->permissions);
    }

    public function syncPermissions(Request $request, Role $role)
    {
        $role->syncPermissions($request->permissions);
    }

    public function revokePermissions(Request $request, Role $role)
    {
        foreach ($request->permissions as $permission) {
            $role->revokePermissionTo($permission);
        }
    }
}
