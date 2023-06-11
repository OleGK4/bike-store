<?php

namespace App\Policies;

use App\Models\Cart;
use App\Models\User;


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
