<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\BikeController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\Contact\ContactController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserProfileController;
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
    Route::get('/{id}', [BikeController::class, 'show']);
    Route::get('/all', [BikeController::class, 'index']);
    Route::prefix('category')->group(function () {
        Route::get('/{id}', [BikeController::class, 'byCategory']);
    });
    Route::prefix('{bike_id}')->group(function () {
        // Review interaction
        Route::prefix('reviews')->group(function () {
            Route::get('/all', [ReviewController::class, 'reviewsForBike'])->middleware('is_verify_email');
            Route::post('/add', [ReviewController::class, 'store'])->middleware('is_verify_email');
            Route::get('/update', [ReviewController::class, 'update'])->middleware('is_verify_email');
            Route::get('/delete', [ReviewController::class, 'destroy'])->middleware('is_verify_email');
        });
        // Add to cart
        Route::apiResource('add-to-cart',CartController::class);
    });
});


// Contact
Route::post('/contact', [ContactController::class, 'sendMessage']);

// Cart interaction
Route::delete('cart/{id}',[CartController::class, 'destroy'])->middleware('auth:sanctum');
Route::get('cart',[CartController::class, 'index'])->middleware('auth:sanctum');
Route::post('cart',[CartController::class, 'store'])->middleware('auth:sanctum');

// Orders interaction
Route::apiResource('orders',OrderController::class)->middleware('auth:sanctum');



// Authentication
Route::prefix('auth')->group(function () {
    Route::post('/signup', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/verify/{token}', [AuthController::class, 'verifyAccount'])->name('user.verify');

//    Route::get('forget-password', [ForgotPasswordController::class, 'showForgetPasswordForm'])->middleware('auth:sanctum')->name('forget.password.get');
    Route::post('forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->middleware('auth:sanctum')->name('forget.password.post');
//    Route::get('reset-password/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->middleware('auth:sanctum')->name('reset.password.get');
    Route::post('reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->middleware('auth:sanctum')->name('reset.password.post');
});

// User profile
Route::prefix('profile')->middleware('auth:sanctum')->group(function () {
    Route::apiResource('users', UserProfileController::class);
    Route::apiResource('cart', CartController::class);
    Route::apiResource('orders', OrderController::class);
});


// Admin panel
Route::prefix('admin')->middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResource('users', UserController::class);
    Route::apiResource('bikes', BikeController::class);
    Route::apiResource('reviews', ReviewController::class);
    Route::apiResource('colors', ColorController::class);
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('brands', BrandController::class);
    Route::apiResource('roles', RoleController::class);
});










//Route::get('/orders', function () {
//    // Token has both "check-status" and "place-orders" abilities...
//})->middleware('abilities:check-status,place-orders');
