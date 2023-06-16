<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class UserController extends BaseController
{
    public function index()
    {
        $users = User::all();
        return response()->json(['users' => UserResource::collection($users)]);
    }

    public function show($id)
    {
        $user = User::find($id);
        if ($user) {
            return response()->json(['user' => new UserResource($user)]);
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role_id' => 'required|integer',
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required',
            'password' => 'required|string',
            'image' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = new User;
        $user->role_id = $request->role_id;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->image = $request->image;

        $user->save();

        return response()->json(['message' => 'User created', 'user' => $user]);
    }

    public function update(Request $request, int $id)
    {
        $validator = Validator::make($request->all(), [
            'role_id' => 'integer',
            'name' => 'string',
            'email' => 'email|unique:users,email,' . $id,
            'phone' => 'string',
            'password' => 'string',
            'image' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::find($id);

        if ($user) {
            // Обновление значений только для переданных полей модели
            if ($request->has('role_id')) {
                $user->role_id = $request->role_id;
            }
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
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }

    public function destroy($id)
    {
        $user = User::find($id);
        if ($user) {
            $user->delete();
            return response()->json(['message' => 'User deleted']);
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }
}
