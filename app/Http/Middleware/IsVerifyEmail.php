<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsVerifyEmail
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = $request->user();
        if ($user && !$user->is_email_verified) {
            return response()->json([
                'message' => 'You need to confirm your account. We have sent you an activation code, please check your e-mail.'
            ], 401);
        }
        return $next($request);
    }
}
