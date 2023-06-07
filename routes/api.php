<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\BikeController;
use App\Http\Controllers\Users;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



// Bikes
Route::prefix('bikes')->group(function () {
    Route::get('/all', [BikeController::class, 'getBikes']);
    Route::get('/{id}', [BikeController::class, 'getBikeById']);

    Route::prefix('category')->group(function () {
        Route::get('/{id}', [BikeController::class, 'getBikesByCategory']);
    });
});


// Users
Route::prefix('users')->group(function () {
    Route::get('/all', [Users::class, 'getUsers']);

    Route::prefix('auth')->group(function () {
        Route::post('/signup', [AuthController::class, 'register']);
        Route::post('/login', [AuthController::class, 'login']);
        Route::post('/token', [AuthController::class, 'authenticate']);
//        Route::post('/tokens/create', [Users::class, 'createToken']);
    });
});


Route::get('/orders', function () {
    // Token has both "check-status" and "place-orders" abilities...
})->middleware(['auth:sanctum', 'abilities:check-status,place-orders']);
