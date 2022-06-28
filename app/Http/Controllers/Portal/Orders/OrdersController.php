<?php

namespace App\Http\Controllers\Portal\Orders;

use App\Http\Controllers\Controller;
use App\Models\Orders\Cart;
use App\Models\Orders\Order;
use App\Models\Orders\OrderBooks;
use App\Models\Orders\Status;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    protected function index()
    {
        $id = auth()->user()->id;
        $orders = Order::query()->whereHas('user', function ($q) use ($id) {
            $q->where('id', $id);
        })->with('user', 'status', 'books')->orderBy('id', 'desc')->get();
        return view('singlePages.account.my_orders', compact('orders'));
    }

    protected function update_status(Request $request)
    {
        $order = Order::query()->find($request->id);
        $status = Status::query()->where('name', $request->status)->first()->id;
        $order->update([
            'status_id' => $status
        ]);

        return response()->json('success');
    }

    protected function confirm_order(Request $request){
//        dd($request->all(), auth()->user(), auth()->user()->cart);
        $order = Order::query()->create([
            'user_id' => auth()->user()->id,
            'status_id' => 1
        ]);
        foreach (auth()->user()->cart as $cart){
            OrderBooks::query()->create([
                'book_id' => $cart->book_id,
                'order_id' => $order->id,
                'days' => $cart->days
            ]);
        }
        Cart::query()->where('user_id', auth()->user()->id)->delete();
        return redirect()->route('my_orders', auth()->user()->id);
    }
}
