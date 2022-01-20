<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\LocationController;

/***********************************************************************************************************************
 * LOCATIONS
 **********************************************************************************************************************/
Route::apiResource('locations', LocationController::class);
