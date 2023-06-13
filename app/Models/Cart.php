<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Cart extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'user_id',
        'updated_at',
        'created_at',
    ];


    // HasMay relations
    public function cartBikes(): HasMany
    {
        return $this->HasMany(CartBikes::class);
    }

    // BelongsTo relations
    public function user(): BelongsTo
    {
        return $this->BelongsTo(User::class);
    }

}
