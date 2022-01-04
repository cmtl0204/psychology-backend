<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\CatalogueController;
use App\Http\Controllers\V1\Core\LocationController;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
Route::apiResource('catalogues', CatalogueController::class);

Route::prefix('catalogue')->group(function () {
    Route::get('all', [CatalogueController::class, 'all']);
});

/***********************************************************************************************************************
 * LOCATIONS
 **********************************************************************************************************************/
Route::apiResource('locations', LocationController::class);
