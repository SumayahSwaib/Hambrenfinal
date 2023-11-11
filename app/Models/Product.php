<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        //created
        self::created(function ($m) {
            Utils::sync_products();
        });
        self::deleting(function ($m) {
            try {
                $imgs = Image::where('parent_id', $m->id)->orwhere('product_id', $m->id)->get();
                foreach ($imgs as $img) {
                    $img->delete();
                }
            } catch (\Throwable $th) {
                //throw $th;
            }
        });
    }

    //getter for feature_photo
    public function getFeaturePhotoAttribute($value)
    {

        //check if value contains images/
        if (str_contains($value, 'images/')) {
            return $value;
        }
        $value = 'images/' . $value;
        return $value;
    }

    //getter for price_2
    public function getPrice2Attribute($value)
    {
        if ($value == null || $value == 0 || strlen($value) < 1) {
            $p1 = ((int)($this->price_1));
            //10 of p1
            $discount = $p1 * 0.1;
            $value = $p1 + $discount;
        } 
        return $value;
    }


    public function sync($stripe)
    {
        set_time_limit(-1);
        $original_images = json_decode($this->rates);
        $imgs = [];
        $i = 0;
        if (is_array($original_images))
            foreach ($original_images as $key => $v) {
                $imgs[] = 'https://app.hambren.com/storage/images/' . $v->src;
                if ($i > 5) {
                    break;
                }
                $i++;
            }

        $resp = $stripe->products->create([
            'name' => $this->name,
            'default_price_data' => [
                'currency' => 'cad',
                'unit_amount' => $this->price_1,
            ],
        ]);
        if ($resp != null) {
            $this->stripe_id = $resp->id;
            $this->stripe_price = $resp->default_price;
            $this->save();
        }
    }
    public function getRatesAttribute()
    {
        $imgs = Image::where('parent_id', $this->id)->orwhere('product_id', $this->id)->get();
        return json_encode($imgs);
    }

    protected $casts = [
        'summary' => 'json',
    ];
}
