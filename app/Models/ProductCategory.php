<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use HasFactory;
    protected $table = 'product_categories';
    protected $casts = [
        'attributes' => 'json',
    ];


    //getter for parent_text
    public function getParentTextAttribute($value)
    {
        return Product::where('category', $this->id)->count();
    }
}
