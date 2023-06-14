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
        });
        // Add to cart
        Route::post('add-to-cart', [CartController::class, 'store'])->middleware('is_verify_email');
    });
});


// Authentication
Route::prefix('auth')->group(function () {
    Route::post('/signup', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::get('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
    Route::get('/verify/{token}', [AuthController::class, 'verifyAccount'])->name('user.verify');

//    Route::get('forget-password', [ForgotPasswordController::class, 'showForgetPasswordForm'])->middleware('auth:sanctum')->name('forget.password.get');
    Route::post('forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->middleware('auth:sanctum')->name('forget.password.post');
//    Route::get('reset-password/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->middleware('auth:sanctum')->name('reset.password.get');
    Route::post('reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->middleware('auth:sanctum')->name('reset.password.post');
});

// Contact e-mail
Route::post('/contact', [ContactController::class, 'sendMessage']);

// User profile
Route::prefix('profile')->middleware('auth:sanctum')->group(function () {

    // Profile interaction
    Route::apiResource('users', UserProfileController::class);
    Route::put('users/{id?}', [UserProfileController::class, 'update']);
    Route::delete('users/{id?}', [UserProfileController::class, 'destroy']);

    // Cart interaction
    Route::apiResource('cart', CartController::class)->middleware('is_verify_email');
    Route::delete('cart/{id}', [CartController::class, 'destroy'])->middleware('auth:sanctum', 'is_verify_email');
    Route::get('cart', [CartController::class, 'index'])->middleware('auth:sanctum', 'is_verify_email');

    // Orders interaction
    Route::apiResource('orders', OrderController::class)->middleware('is_verify_email');
    Route::get('orders', [OrderController::class, 'userOrders'])->middleware('is_verify_email');

    // Reviews interaction
    Route::get('reviews/all', [ReviewController::class, 'userReviews'])->middleware('is_verify_email');
    Route::put('reviews/{id}', [ReviewController::class, 'update'])->middleware('is_verify_email');
    Route::delete('reviews/{id}', [ReviewController::class, 'destroy'])->middleware('is_verify_email');
});


// Admin panel
Route::prefix('admin')->middleware(['auth:sanctum', 'admin', 'is_verify_email'])->group(function () {
    Route::apiResources([
        'reviews' => ReviewController::class,
        'colors' => ColorController::class,
        'bikes' => BikeController::class,
        'brands' => BrandController::class,
        'users' => UserController::class,
        'roles' => RoleController::class,
        'categories' => CategoryController::class,
        'orders' => OrderController::class,
    ]);
});
