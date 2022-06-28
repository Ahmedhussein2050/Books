<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Book\Book;
use App\Models\Book\BookData;
use App\Models\Book\Image;
use App\Models\Tag\Tag;
use Illuminate\Http\Request;

class BooksController extends Controller
{
    protected function save(Request $request)
    {
        $book = Book::query()->create([
            'author' => $request->author,
            'isbn_number' => $request->isbn,
            'status' => $request->status == 'on' ? 1 : 0
        ]);
        BookData::query()->create([
            'title' => $request->title,
            'description' => $request->desc,
            'lang_id' => 1,
            'book_id' => $book->id
        ]);
        if ($request->hasFile('images')) {
            foreach ($request->images as $image) {
                $filename = time() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('uploads/books/' . $book->id), $filename);
                $image_name = '/uploads/books/' . $book->id . '/' . $filename;
                $image = Image::query()->create([
                    'name' => $image_name,
                    'book_id' => $book->id
                ]);
            }
        }

        if ($request->tags) {
            $arr = explode(',', $request->tags);
            foreach ($arr as $tag){
                Tag::query()->create([
                    'name' => $tag,
                    'assignable_type' => 'book',
                    'assignable_id' => $book->id
                ]);
            }
        }
        return redirect()->to('/');
    }
}
