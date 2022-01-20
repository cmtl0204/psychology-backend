<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Cecy\CatalogueController;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
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
        Route::put('{image}', [CatalogueController::class, 'updateImage']);
        Route::delete('{image}', [CatalogueController::class, 'destroyImage']);
        Route::patch('', [CatalogueController::class, 'destroyImages']);
    });
});

/***********************************************************************************************************************
 * INSTITUTIONS
 **********************************************************************************************************************/

/***********************************************************************************************************************
 * PLANIFICATIONS
 **********************************************************************************************************************/

/***********************************************************************************************************************
 * COURSE
 **********************************************************************************************************************/
Route::prefix('courses')->group(function () {
    Route::get('', [AlvaradoController::class, 'getCourses']);
    Route::put('/{course}', [AlvaradoController::class, 'updateCourse']);
});

/***********************************************************************************************************************
 * TOPICS
 **********************************************************************************************************************/
Route::prefix('topics')->group(function () {
    Route::get('/{course}', [AlvaradoController::class, 'getTopics']);
    Route::post('/{course}', [AlvaradoController::class, 'storeTopic']);
    Route::put('/{course}', [AlvaradoController::class, 'updateTopic']);
    Route::delete('', [AlvaradoController::class, 'destroyTopic']);
    Route::patch('', [AlvaradoController::class, 'destroysTopics']);
});
/***********************************************************************************************************************
 * PREREQUISITES
 **********************************************************************************************************************/
Route::prefix('prerequisites')->group(function () {
    Route::get('/{course}', [AlvaradoController::class, 'getPrerequisites']);
    Route::post('/{course}', [AlvaradoController::class, 'storePrerequisite']);
    Route::put('/{course}', [AlvaradoController::class, 'updatePrerequisite']);
    Route::delete('', [AlvaradoController::class, 'DestroyPrerequisite']);
    Route::patch('', [AlvaradoController::class, 'destroysPrerequisites']);
});
