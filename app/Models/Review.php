<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Review extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    // BelongsTo relations
    public function bike(): BelongsTo
    {
        return $this->BelongsTo(Bike::class);
    }

    // If user trying to create a review on a bike that he has never bought, he'll get an error, that he should own this bike to create a review.
    public function user(): BelongsTo
    {
        return $this->BelongsTo(User::class);
    }
}
