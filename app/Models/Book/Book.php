<?php

namespace App\Models\Book;

use App\Models\Tag\Tag;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Book extends Model
{
    use HasFactory;
    protected $table = 'books';
    protected $guarded = [];

    public function data(): HasMany
    {
        return $this->hasMany(BookData::class, 'book_id');
    }

    public function images(): HasMany
    {
        return $this->hasMany(Image::class, 'book_id');
    }

    public function tags(): HasMany
    {
        return $this->hasMany(Tag::class, 'assignable_id');
    }
}
