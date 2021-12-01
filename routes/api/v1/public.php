<?php

use App\Http\Controllers\V1\Authentication\AuthController;
use App\Http\Controllers\V1\Core\CatalogueController;
use App\Http\Controllers\V1\Core\LocationController;
use App\Http\Controllers\V1\JobBoard\ProfessionalController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
Route::apiResource('catalogues', CatalogueController::class);

Route::prefix('catalogue')->group(function () {
    Route::get('all', [CatalogueController::class, 'all']);
});

Route::prefix('auth')->group(function () {
    Route::post('login', [AuthController::class, 'login'])->middleware('verify_user_blocked');
    Route::post('request-password-reset', [AuthController::class, 'requestPasswordReset']);
    Route::post('reset-password', [AuthController::class, 'resetPassword']);
    Route::post('request-user-unlock', [AuthController::class, 'requestUserUnlock']);
    Route::post('user-unlock', [AuthController::class, 'userUnlock']);
    Route::post('email-verified', [AuthController::class, 'emailVerified']);
    Route::get('verify-user/{username}', [AuthController::class, 'verifyUser']);
    Route::get('verify-email/{email}', [AuthController::class, 'verifyEmail']);
    Route::get('verify-phone/{phone}', [AuthController::class, 'verifyPhone']);
});

Route::apiResource('locations', LocationController::class);

Route::get('init', function () {
    if (env('APP_ENV') != 'local') {
        return response()->json('El sistema se encuentra en producción.', 500);
    }

    DB::select('drop schema if exists public cascade;');
    DB::select('drop schema if exists authentication cascade;');
    DB::select('drop schema if exists core cascade;');
    DB::select('drop schema if exists job_board cascade;');

    DB::select('create schema authentication;');
    DB::select('create schema core;');
    DB::select('create schema job_board;');

    Artisan::call('migrate', ['--seed' => true]);

    return response()->json([
        'msg' => [
            'Los esquemas fueron creados correctamente.',
            'Las migraciones fueron creadas correctamente'
        ]
    ]);
});

Route::prefix('registration')->group(function () {
    Route::post('professional', [ProfessionalController::class, 'registration']);
});

Route::prefix('professional')->group(function () {
    Route::get('certificate/{username}', [ProfessionalController::class, 'generateCertificate']);
    Route::get('validate-certificate/{username}', [ProfessionalController::class, 'getCertificate']);
});
