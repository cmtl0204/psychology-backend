<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\V1\Core\CatalogueController;

/***********************************************************************************************************************
 * CATALOGUES
 **********************************************************************************************************************/
Route::prefix('catalogue')->group(function () {
    Route::get('catalogue', [CatalogueController::class, 'catalogue']);
});
