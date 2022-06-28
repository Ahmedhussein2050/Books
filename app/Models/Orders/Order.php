<?php

namespace App\Models\Orders;

use App\Models\Book\Book;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';
    protected $guarded = [];
    public function status(){
        return $this->belongsTo(Status::class, 'status_id');
    }
    public function books(){
        return $this->belongsToMany(Book::class, 'books_orders', 'order_id', 'book_id');
    }
    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }
}
