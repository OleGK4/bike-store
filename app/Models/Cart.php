<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Cart extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    // BelongsTo relations
    public function users(): BelongsTo
    {
        return $this->BelongsTo(User::class);
    }
}
