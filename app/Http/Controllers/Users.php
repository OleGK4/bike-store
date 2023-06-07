<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;


class Users extends BaseController
{
    // Auth
    public function createToken(Request $request)
    {
        $token = $request->user()->createToken('token-name', ['server:update']);
        return ['token' => $token->plainTextToken];
    }



    public function login()
    {

    }

    public function signup()
    {


    }


    public function getUsers()
    {
        return User::all();
    }

}
