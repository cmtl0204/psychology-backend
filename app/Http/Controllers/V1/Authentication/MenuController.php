<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Authentication\MenuCollection;
use App\Models\Authentication\Menu;
use Spatie\Permission\Models\Role;

class MenuController extends Controller
{
    public function catalogue(Role $role)
    {
        $menus = Menu::whereNull('parent_id')->where('role_id', $role->id)->get();
        return new MenuCollection($menus);
    }
}
