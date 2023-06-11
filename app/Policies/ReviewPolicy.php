<?php

namespace App\Policies;

use App\Models\Bike;
use App\Models\Review;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class ReviewPolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {

    }

    public function before(User $user): ?bool
    {
        return $user->role->name === 'Administrator';
    }

    public function update(User $user, Review $review): Response
    {
        return $user->id === $review->user_id
            ? Response::allow()
            : Response::deny('You do not own this review!');
    }

    public function delete(User $user, Review $review): Response
    {
        return $user->id === $review->user_id
            ? Response::allow()
            : Response::deny('You do not own this review!');
    }

    public function create(User $user, Bike $bike): Response
    {
        return $user->orders->orderBikes->bike_id === $bike->id
            ? Response::allow()
            : Response::deny('You must buy this bike to make a review!');
    }
}
