<?php

namespace App\Providers;

use App\Models\Cart;
use App\Models\CartBikes;
use App\Models\Order;
use App\Models\OrderBikes;
use App\Models\Review;
use App\Models\User;
use App\Policies\CartBikePolicy;
use App\Policies\CartPolicy;
use App\Policies\OrderBikePolicy;
use App\Policies\OrderPolicy;
use App\Policies\ReviewPolicy;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        Cart::class => CartPolicy::class,
        CartBikes::class => CartBikePolicy::class,
        Order::class => OrderPolicy::class,
        OrderBikes::class => OrderBikePolicy::class,
        Review::class => ReviewPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

//        ResetPassword::createUrlUsing(function (object $notifiable, string $token) {
//            return config('app.frontend_url')."/password-reset/$token?email={$notifiable->getEmailForPasswordReset()}";
//        });

//        Gate::define('update-review', function (User $user, Review $review) {
//            return ($user->id === $review->user_id || $user->role_id === 2);
//        });
        //
    }
}
