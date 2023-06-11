<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;



class CartBikes extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'bike_id',
        'cart_id',
    ];


    // BelongsTo relations
    public function cart(): BelongsTo
    {
        return $this->BelongsTo(Cart::class);
    }

    public function bike(): BelongsTo
    {
        return $this->BelongsTo(Bike::class);
    }
}
