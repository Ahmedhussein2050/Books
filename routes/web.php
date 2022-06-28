<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Portal\Orders\CartController;
use App\Http\Controllers\Portal\Orders\OrdersController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index']);

Route::get('login', [AuthController::class, 'login'])->name('login');
Route::post('login', [AuthController::class, 'doLogin']);

Route::get('register', [AuthController::class, 'register'])->name('register');
Route::post('register', [AuthController::class, 'doRegister']);

Route::get('logout', [AuthController::class, 'logout'])->name('logout')->middleware('auth');

Route::get('my_orders', [OrdersController::class, 'index'])
    ->name('my_orders')->middleware('auth');

Route::post('update_order_status/{id}', [OrdersController::class, 'update_status'])
    ->name('update_order_status')->middleware('auth');

Route::post('add_to_cart', [CartController::class, 'add'])
    ->name('add_to_cart')->middleware('auth');
Route::get('show_cart', [CartController::class, 'show_cart'])
    ->name('show_cart')->middleware('auth');
Route::post('delete', [CartController::class, 'delete'])
    ->name('delete_cart')->middleware('auth');

Route::post('confirm_order', [OrdersController::class, 'confirm_order'])
    ->name('confirm_order')->middleware('auth');
