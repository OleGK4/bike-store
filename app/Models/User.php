<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    public $timestamps = false;
    use HasApiTokens, HasFactory, Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'role_id',
        'email',
        'phone',
        'password',
        'remember_token',
        'is_email_verified',
        'image',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'role_id',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'password' => 'hashed',
    ];

    // HasOne relations
    public function cart(): HasOne
    {
        return $this->HasOne(Cart::class);
    }

    // BelongsTo relations
    public function role(): BelongsTo
    {
        return $this->BelongsTo(Role::class);
    }


    // HasMany relations
    public function orders(): HasMany
    {
        return $this->HasMany(Order::class);
    }

    public function reviews(): HasMany
    {
        return $this->HasMany(Review::class);
    }

    // HasManyThrough relations
    public function orderBikes(): HasManyThrough
    {
        return $this->hasManyThrough(OrderBikes::class, Order::class);
    }

    public function cartBikes(): HasManyThrough
    {
        return $this->hasManyThrough(CartBikes::class, Cart::class);
    }
}
