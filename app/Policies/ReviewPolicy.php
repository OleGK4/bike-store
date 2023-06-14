<?php

namespace App\Policies;

use App\Models\Order;
use App\Models\OrderBikes;
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

    public function after(User $user): ?bool
    {
        return $user->role->name === 'Administrator';
    }
}
