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
    use HasApiTokens, HasFactory, Notifiable;

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
    public function brands(): BelongsTo
    {
        return $this->belongsTo(Brand::class);
    }

    public function colors(): BelongsTo
    {
        return $this->belongsTo(Color::class);
    }

    public function categories(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}
