<?php

namespace App\Policies;

use App\Models\Cart;
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

    public function update(User $user, Cart $cart): Response
    {
        return $user->id === $cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function delete(User $user, Cart $cart): Response
    {
        return $user->id === $cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function viewAny(User $user, Cart $cart): Response
    {
        return $user->id === $cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function view(User $user, Cart $cart): Response
    {
        return $user->id === $cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function create(User $user): Response
    {
        return $user->is_email_verified === 1
            ? Response::allow()
            : Response::deny('You must verify your account to add products to cart!');
    }
}
