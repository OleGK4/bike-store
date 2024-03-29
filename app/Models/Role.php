<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Role extends Model
{
    public $timestamps = false;
    use HasFactory;

    // HasMany relations
    public function user(): HasMany
    {
        return $this->HasMany(User::class);
    }
}
