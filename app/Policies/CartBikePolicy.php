<?php

namespace App\Policies;

use App\Models\CartBikes;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class CartBikePolicy
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

    public function update(User $user, CartBikes $cartBike): Response
    {
        return $user->id === $cartBike->cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function delete(User $user, CartBikes $cartBike): Response
    {
        return $user->id === $cartBike->cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function viewAny(User $user, CartBikes $cartBike): Response
    {
        return $user->id === $cartBike->cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function view(User $user, CartBikes $cartBike): Response
    {
        return $user->id === $cartBike->cart->user_id
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
