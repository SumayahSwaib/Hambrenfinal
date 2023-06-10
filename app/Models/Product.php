<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function getRatesAttribute(){
        $imgs = Image::where('parent_id',$this->id)->orwhere('product_id',$this->id)->get();
        return json_encode($imgs); 
    }

}
