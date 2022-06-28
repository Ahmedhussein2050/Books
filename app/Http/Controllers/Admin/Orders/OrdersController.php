<?php

namespace App\Http\Controllers\Admin\Orders;

use App\Http\Controllers\Controller;
use App\Models\Book\Book;
use App\Models\Orders\Order;
use App\Models\Orders\OrderBooks;
use App\Models\Orders\Status;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    protected function index(){
        $orders = Order::query()->with('status','books','user')
            ->orderBy('id', 'desc')->get();
        return view('admin.show_orders', compact('orders'));
    }
    protected function change_status(Request $request){
        $order = Order::query()->find($request->id);
        $status_id = Status::query()->where('name', $request->status)->first()->id;
        if ($request->status == 'Refused'){
            $order->update([
               'status_id' => $status_id
            ]);
        }
        if ($request->status == 'Borrowed'){
            $check_avail = $order->books->pluck('status')->toArray();
            if (in_array(0, $check_avail)){
                $order->update([
                    'status_id' => Status::query()->where('name', 'Refused')->first()->id
                ]);
                return response()->json('success');
            }
            $order->update([
                'status_id' => $status_id,
            ]);
            $order_books = OrderBooks::query()
                ->where('order_id', $request->id)->get()->pluck('book_id')->toArray();
            Book::query()->whereIn('id', $order_books)->update([
                'status' => 0,
                'user_id' => $order->user_id
            ]);
        }
        if ($request->status == 'Refund-Refused'){
            $order->update([
                'status_id' => $status_id
            ]);
        }
        if ($request->status == 'Complete'){
            $order->update([
                'status_id' => $status_id,
            ]);
            $order_books = OrderBooks::query()
                ->where('order_id', $request->id)->get()->pluck('book_id')->toArray();
            Book::query()->whereIn('id', $order_books)->update([
                'status' => 1,
                'user_id' => null
            ]);
        }
    }
}
