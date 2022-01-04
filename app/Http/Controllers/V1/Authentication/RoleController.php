<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
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
