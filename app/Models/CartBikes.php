<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
// Soft delete is here, because after ordering the whole cart, soft deleted data used to make sure, that user has ever ordered the bike, on which he wants to create a review on.
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;



class CartBikes extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    // BelongsTo relations
    public function cart(): BelongsTo
    {
        return $this->BelongsTo(Cart::class);
    }

    public function bikes(): BelongsTo
    {
        return $this->BelongsTo(Bike::class);
    }
}
