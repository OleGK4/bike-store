<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Brand extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    // HasMany relations
    public function bikes(): HasMany
    {
        return $this->hasMany(Bike::class);
    }
}
