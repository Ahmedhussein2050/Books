<?php

namespace App\Http\Controllers;

use App\Models\Book\Book;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    protected function index(){
        $books = Book::with('data', 'images', 'tags')->get();
        return view('welcome', compact('books'));
    }
}
