<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\BikeController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Bikes
Route::prefix('bikes')->middleware('auth:sanctum')->group(function () {
    Route::get('/all', [BikeController::class, 'index']);
    Route::get('/{id}', [BikeController::class, 'show']);

    Route::prefix('category')->group(function () {
        Route::get('/{id}', [BikeController::class, 'byCategory']);
    });
});

// Authentication
Route::prefix('auth')->group(function () {
    Route::post('/signup', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

// Admin panel
Route::prefix('admin')->middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResource('users', UserController::class);
    Route::apiResource('bikes', BikeController::class);
    Route::apiResource('reviews', ReviewController::class);
    Route::apiResource('colors', ColorController::class);
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('brands', BrandController::class);
});










Route::get('/orders', function () {
    // Token has both "check-status" and "place-orders" abilities...
})->middleware('abilities:check-status,place-orders');
