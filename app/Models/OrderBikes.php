<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class OrderBikes extends Model
{
    use HasApiTokens, HasFactory, Notifiable;


    // BelongsTo relations
    public function bikes(): BelongsTo
    {
        return $this->BelongsTo(Bike::class);
    }

    public function orders(): BelongsTo
    {
        return $this->BelongsTo(Order::class);
    }
}
