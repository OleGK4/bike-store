<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\User;
use App\Models\UserVerify;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

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

        Cart::create([
            'user_id' => $user['id'],
        ]);


        $mailToken = Str::random(64);

        UserVerify::create([
            'user_id' => $user['id'],
            'token' => $mailToken
        ]);

        Mail::send('emails.verificationEmail', ['token' => $mailToken], function($message) use($data){
            $message->to($data['email']);
            $message->subject('Email Verification Mail');
            $message->from('bike-store@mail.su', 'Bike-store');
        });

        return new JsonResponse(['token' => $token->plainTextToken, 'message' => 'Check your E-mail to confirm your account!'], 201);
    }

    public function verifyAccount($token)
    {
        $verifyUser = UserVerify::where('token', $token)->first();
        $message = 'Sorry your email cannot be identified.';

        if(!is_null($verifyUser) ){
            $user = $verifyUser->user;
            if(!$user->is_email_verified) {
                $verifyUser->user->is_email_verified = 1;
                $verifyUser->user->save();
                $message = "Your e-mail is verified.";
            } else {
                $message = "Your e-mail is already verified.";
            }
        }
        return new JsonResponse(['message' => $message], 200);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('auth_token', ['*'], Carbon::now()->addMinutes(1440));
            return new JsonResponse(['user' => $user, 'token' => $token->plainTextToken], 200);
        }

        return new JsonResponse(['error' => 'Invalid credentials'], 401);
    }

    public function logout(): JsonResponse
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
}






