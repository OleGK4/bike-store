<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Bike extends Model
{
    public $timestamps = false;
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'brand_id ',
        'category_id',
        'model',
        'color_id',
        'description',
        'price',
        'image',
    ];
    protected $visible = [
        'id',
        'brand',
        'category',
        'model',
        'color',
        'description',
        'price',
        'image',
    ];

    protected $hidden = [
        'brand_id',
        'category_id',
        'color_id',
    ];


    // HasMany relations
    public function cartBikes(): HasMany
    {
        return $this->hasMany(CartBikes::class);
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(Review::class);
    }

    public function orderBikes(): HasMany
    {
        return $this->hasMany(OrderBikes::class);
    }



    // BelongTo relations
    public function brand(): BelongsTo
    {
        return $this->belongsTo(Brand::class);
    }

    public function color(): BelongsTo
    {
        return $this->belongsTo(Color::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}
