<?php

namespace App\Http\Controllers\Admin\Orders;

use App\Http\Controllers\Controller;
use App\Models\Book\Book;
use App\Models\Orders\Order;
use App\Models\Orders\OrderBooks;
use App\Models\Orders\Status;
use Carbon\Carbon;
use Illuminate\Http\Request;

class RefundsController extends Controller
{
    protected function refunds(){
        $orders = Order::query()->whereHas('status', function ($q){
            $q->where('name', 'Refund');
        })->with('status')->get();
        return view('admin.show_refunds', compact('orders'));
    }
}
