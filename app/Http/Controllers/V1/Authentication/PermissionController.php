<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionController extends Controller
{
    public function assignRoles(Request $request, Permission $permission)
    {
        $permission->assignRole($request->roles);
    }

    public function syncRoles(Request $request, Permission $permission)
    {
        $permission->syncRoles($request->roles);
    }

    public function removeRoles(Request $request, Permission $permission)
    {
        foreach ($request->roles as $role) {
            $role = Role::find($role['id']);
            $permission->removeRole($role);
        }
    }
}
