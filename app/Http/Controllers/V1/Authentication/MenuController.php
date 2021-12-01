<?php

namespace App\Http\Controllers\V1\Authentication;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Core\Authentications\MenuCollection;
use App\Models\Authentication\Menu;

class MenuController extends Controller
{
    public function index(){
        return new MenuCollection(Menu::whereNull('parent_id')->get());
    }
}
