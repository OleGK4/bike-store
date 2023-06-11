<?php

namespace App\Policies;

use App\Models\User;

class OrderPolicy
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
