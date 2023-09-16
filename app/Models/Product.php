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
        self::creating(function ($m) {
            $district_id = 1;
            $sub = Location::find($m->subcounty_id);
            if ($sub != null) {
                $district_id = $sub->parent;
            }
            $m->district_id = $district_id;
            return $m;
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

    public function getRatesAttribute()
    {
        $imgs = Image::where('parent_id', $this->id)->orwhere('product_id', $this->id)->get();
        return json_encode($imgs);
    }

    protected $casts = [
        'data' => 'json',
    ];
}
