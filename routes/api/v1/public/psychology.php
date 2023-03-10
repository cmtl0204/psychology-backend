<?php

use App\Http\Controllers\V1\Psychology\QuestionsController;
use App\Http\Controllers\V1\Psychology\TestsController;
use App\Http\Resources\V1\Psychology\TestCollection;
use App\Models\Authentication\User;
use App\Models\Psychology\Test;
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

Route::get('results-tests',function (\Illuminate\Http\Request $request){
    return new TestCollection(
        Test::whereBetween('created_at',$request->dates)
            ->where('type', $request->testType)
            ->orWhere('type', 'phq2')
            ->get()
    );
});

Route::get('emails',function (\Illuminate\Http\Request $request){
    $emails = User::select('email')->whereHas('roles', function ($roles) {
        $roles->where('name', 'support');
    })->get();

    return $emails;
});
