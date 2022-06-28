<?php

namespace App\Http\Controllers\Portal\Orders;

use App\Http\Controllers\Controller;
use App\Models\Orders\Cart;
use App\Models\Orders\Order;
use App\Models\Orders\Status;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected function add(Request $request){
        Cart::query()->create([
            'user_id' => $request->user_id,
            'book_id' => $request->book_id,
            'days' => 3
        ]);
        return response()->json('success');
    }
    protected function show_cart(){
        $carts = Cart::with('book')->where('user_id', auth()->user()->id)->get();
        return view('singlePages.account.my_cart', compact('carts'));
    }
    protected function delete(Request $request){
        Cart::query()->find($request->id)->delete();
        return response()->json('success');
    }
}
