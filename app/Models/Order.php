<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Order extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    // HasMany relations
    public function bikes(): HasMany
    {
        return $this->HasMany(OrderBikes::class);
    }

    // BelongsTo relations
    public function users(): BelongsTo
    {
        return $this->BelongsTo(User::class);
    }
}