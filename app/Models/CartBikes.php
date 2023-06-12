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
        'updated_at',
        'created_at',
    ];


    // BelongsTo relations
    public function bike(): BelongsTo
    {
        return $this->BelongsTo(Bike::class);
    }

    public function cart(): BelongsTo
    {
        return $this->BelongsTo(Cart::class);
    }
}
