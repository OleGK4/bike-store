<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserProfileController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();
        return new UserResource($user);
    }

    public function update(Request $request)
    {
        $user = $request->user();

        if ($request->has('name')) {
            $user->name = $request->name;
        }
        if ($request->has('email')) {
            $user->email = $request->email;
        }
        if ($request->has('phone')) {
            $user->phone = $request->phone;
        }
        if ($request->has('password')) {
            $user->password = Hash::make($request->password);
        }
        if ($request->has('image')) {
            $user->image = $request->image;
        }

        $user->save();

        return response()->json(['message' => 'User updated', 'user' => $user]);
    }

    public function destroy(Request $request)
    {
        $user = $request->user();

        $user->delete();

        return response()->json(['message' => 'User deleted']);
    }
}
