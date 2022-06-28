<?php

namespace App\Models\Orders;

use App\Models\Book\Book;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $table = 'abandoned_cart';
    protected $guarded = [];

    public function book(){
        return $this->hasOne(Book::class, 'id', 'book_id');
    }
}
