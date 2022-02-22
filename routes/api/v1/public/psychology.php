<?php

use App\Http\Controllers\V1\Psychology\QuestionsController;
use App\Http\Controllers\V1\Psychology\TestsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\CatalogueController;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
Route::prefix('catalogue')->group(function () {
    Route::get('catalogue', [CatalogueController::class, 'catalogue']);
});

Route::controller(TestsController::class)->group(function () {
    Route::prefix('tests/{test}')->group(function () {
    });

    Route::prefix('tests')->group(function () {
        Route::post('/chat', 'saveChat');
        Route::post('/generate-transactional-code', 'generateTransactionalCode');
        Route::post('/verify-transactional-code', 'verifyTransactionalCode');
    });
});

Route::apiResource('tests', TestsController::class)->only('store');

Route::controller(QuestionsController::class)->group(function () {
    Route::prefix('questions/{question}')->group(function () {

    });

    Route::prefix('questions')->group(function () {
        Route::get('/all', 'all');
    });
});
