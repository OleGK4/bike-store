<?php

namespace App\Policies;

use App\Models\Cart;
use App\Models\CartBikes;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class CartPolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {
        //
    }

    public function before(User $user): ?bool
    {
        return $user->role->name === 'Administrator';
    }
}
