<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $data = $request->json()->all();

        $validator = Validator::make($data, [
            'name' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'phone' => 'required|phone:RU',
            'password' => 'required|confirmed',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            return new JsonResponse(['errors' => $errors], 422);
        }

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'password' => Hash::make($data['password']),
        ]);

        $token = $user->createToken('auth_token', ['*'], Carbon::now()->addMinutes(1440));

        return new JsonResponse(['token' => $token->plainTextToken], 201);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('auth_token', ['*'], Carbon::now()->addMinutes(1440));
            return new JsonResponse(['token' => $token->plainTextToken], 200);
        }

        return new JsonResponse(['error' => 'Invalid credentials'], 401);
    }

    public function authenticate(Request $request)
    {
        $token = $request->bearerToken();
        ;
        if (!$token) {
            return new JsonResponse(['error' => 'Unauthorized'], 401);
        }
        var_dump($token);
        $user = User::where('id', $token)->first();
        if (!$user) {
            return new JsonResponse(['error' => 'Unauthorized'], 401);
        }

        return new JsonResponse(['user' => $user]);
    }
}






