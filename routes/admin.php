<?php

use App\Http\Controllers\Admin\BooksController;
use App\Http\Controllers\Admin\Orders\OrdersController;
use App\Http\Controllers\HomeController;
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

Route::post('add_book', [BooksController::class, 'save'])
    ->name('addBook')->middleware('auth');
Route::get('show_orders', [OrdersController::class, 'index'])
    ->name('show_orders')->middleware('auth');
Route::post('update_order_status', [OrdersController::class, 'change_status'])
    ->name('update_status')->middleware('auth');
Route::get('show_refunds', [\App\Http\Controllers\Admin\Orders\RefundsController::class, 'refunds'])
    ->name('show_refunds')->middleware('auth');
