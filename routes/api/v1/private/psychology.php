<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\CatalogueController;
use App\Http\Controllers\V1\Psychology\QuestionsController;
use App\Http\Controllers\V1\Psychology\TestsController;
use App\Http\Controllers\V1\Psychology\InstitutionsController;
use App\Http\Controllers\V1\Psychology\ReportsController;

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
Route::controller(InstitutionsController::class)->group(function () {
    Route::prefix('institutions/{institution}')->group(function () {
        Route::post('/tests', 'assignmentTests');
    });

    Route::prefix('institutions')->group(function () {
        Route::get('/all', 'all');
    });
});

/***********************************************************************************************************************
 * TESTS
 **********************************************************************************************************************/
Route::controller(TestsController::class)->group(function () {
    Route::prefix('tests/{test}')->group(function () {
        Route::patch('/close', 'close');
    });

    Route::prefix('tests')->group(function () {
        Route::get('/count-priorities', 'countPriorities');
        Route::get('/count-all-priorities', 'countAllPriorities');
        Route::get('/count-all-tests', 'countAllTests');
        Route::patch('/destroys', 'destroys');
    });
});
Route::apiResource('tests', TestsController::class)->except('store');

/***********************************************************************************************************************
 * QUESTIONS
 **********************************************************************************************************************/
Route::controller(QuestionsController::class)->group(function () {
    Route::prefix('questions/{question}')->group(function () {
        Route::patch('/xyz', 'xyz');
    });

    Route::prefix('questions')->group(function () {

    });
});

//Route::apiResource('questions', QuestionsController::class);

/***********************************************************************************************************************
 * REPORTS
 **********************************************************************************************************************/
Route::prefix('reports')->group(function () {
    Route::get('/tests/{test}/results', [ReportsController::class, 'resultsTest']);
    Route::get('/tests/results', [ReportsController::class, 'resultsTests']);
});
