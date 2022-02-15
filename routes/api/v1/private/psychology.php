<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\CatalogueController;
use App\Http\Controllers\V1\Psychology\QuestionsController;
use App\Http\Controllers\V1\Psychology\TestsController;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
Route::apiResource('catalogues', CatalogueController::class);

Route::prefix('catalogue/{catalogue}')->group(function () {
    Route::prefix('file')->group(function () {
        Route::get('{file}/download', [CatalogueController::class, 'downloadFile']);
        Route::get('download', [CatalogueController::class, 'downloadFiles']);
        Route::get('', [CatalogueController::class, 'indexFiles']);
        Route::get('{file}', [CatalogueController::class, 'showFile']);
        Route::post('', [CatalogueController::class, 'uploadFile']);
        Route::post('{file}', [CatalogueController::class, 'updateFile']);
        Route::delete('{file}', [CatalogueController::class, 'destroyFile']);
        Route::patch('', [CatalogueController::class, 'destroyFiles']);
    });
    Route::prefix('image')->group(function () {
        Route::get('{image}/download', [CatalogueController::class, 'downloadImage'])->withoutMiddleware('auth:sanctum');
        Route::get('', [CatalogueController::class, 'indexImages']);
        Route::get('{image}', [CatalogueController::class, 'showImage']);
        Route::post('', [CatalogueController::class, 'uploadImage']);
        Route::post('{image}', [CatalogueController::class, 'updateImage']);
        Route::delete('{image}', [CatalogueController::class, 'destroyImage']);
        Route::patch('', [CatalogueController::class, 'destroyImages']);
    });
});

/***********************************************************************************************************************
 * INSTITUTIONS
 **********************************************************************************************************************/

/***********************************************************************************************************************
 * TESTS
 **********************************************************************************************************************/
Route::apiResource('tests', TestsController::class);

/***********************************************************************************************************************
 * QUESTIONS
 **********************************************************************************************************************/
Route::controller(QuestionsController::class)->group(function () {
    Route::prefix('questions/{question}')->group(function () {
        Route::patch('/xyz', 'xyz');
    });

    Route::prefix('questions')->group(function () {
        Route::get('/all', 'all');
    });
});

Route::apiResource('questions', QuestionsController::class);

/***********************************************************************************************************************
 * USERS
 **********************************************************************************************************************/
