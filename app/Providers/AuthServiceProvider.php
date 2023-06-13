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
use App\Policies\UserPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

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
        User::class => UserPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        $this->registerPolicies();
    }
}
