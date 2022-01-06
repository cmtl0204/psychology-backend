<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;

Route::get('init', function () {
    if (env('APP_ENV') != 'local') {
        return response()->json('El sistema se encuentra en producción.', 500);
    }

    DB::select('drop schema if exists public cascade;');
    DB::select('drop schema if exists authentication cascade;');
    DB::select('drop schema if exists core cascade;');
    DB::select('drop schema if exists cecy cascade;');


    DB::select('create schema authentication;');
    DB::select('create schema core;');
    DB::select('create schema cecy;');

    Artisan::call('migrate', ['--seed' => true]);

    return response()->json([
        'msg' => [
            'Los esquemas fueron creados correctamente.',
            'Las migraciones fueron creadas correctamente'
        ]
    ]);
});
