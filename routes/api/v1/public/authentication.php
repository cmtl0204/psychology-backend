<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Authentication\AuthController;

Route::prefix('auth')->group(function () {
    Route::post('login', [AuthController::class, 'login'])->middleware(['verify_user_blocked','verify_user_suspended']);
    Route::post('request-password-reset', [AuthController::class, 'requestPasswordReset']);
    Route::post('reset-password', [AuthController::class, 'resetPassword']);
    Route::post('request-user-unlock', [AuthController::class, 'requestUserUnlock']);
    Route::post('user-unlock', [AuthController::class, 'userUnlock']);
    Route::post('email-verified', [AuthController::class, 'emailVerified']);
    Route::get('verify-user/{username}', [AuthController::class, 'verifyUser']);
    Route::get('verify-email/{email}', [AuthController::class, 'verifyEmail']);
    Route::get('verify-phone/{phone}', [AuthController::class, 'verifyPhone']);
});

