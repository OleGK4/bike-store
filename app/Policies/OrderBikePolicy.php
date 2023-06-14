<?php

namespace App\Policies;

use App\Models\OrderBikes;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class OrderBikePolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {
        //
    }
    public function update(User $user, OrderBikes $orderBike): Response
    {
        return $user->id === $orderBike->orders->user_id
            ? Response::allow()
            : Response::deny('You do not own this orders!');
    }

    public function delete(User $user, OrderBikes $orderBike): Response
    {
        return $user->id === $orderBike->orders->user_id
            ? Response::allow()
            : Response::deny('You do not own this orders!');
    }

    public function viewAny(User $user, OrderBikes $orderBike): Response
    {
        return $user->id === $orderBike->orders->user_id
            ? Response::allow()
            : Response::deny('You do not own this orders!');
    }

    public function view(User $user, OrderBikes $orderBike): Response
    {
        return $user->id === $orderBike->orders->user_id
            ? Response::allow()
            : Response::deny('You do not own this orders!');
    }

    public function create(User $user): Response
    {
        return $user->is_email_verified === 1
            ? Response::allow()
            : Response::deny('You must verify your account to order products!');
    }

    public function after(User $user): ?bool
    {
        return $user->role->name === 'Administrator';
    }
}
