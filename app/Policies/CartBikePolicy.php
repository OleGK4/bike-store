<?php

namespace App\Policies;

use App\Models\CartBikes;
use App\Models\User;
use Illuminate\Http\Response;

class CartBikePolicy
{
    public function update(User $user, CartBikes $cartBike): Response
    {
        return $user->id === $cartBike->cart->user_id
            ? Response::allow()
            : Response::deny('You do not own this cart!');
    }

    public function delete(User $user, CartBikes $cartBike): bool
    {
        return $user->cart->id === $cartBike->cart_id;
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

    /**
     * Create a new policy instance.
     */

    public function after(User $user): ?bool
    {
        return $user->role->name === 'Administrator';
    }
}
