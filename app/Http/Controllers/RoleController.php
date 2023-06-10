<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index()
    {
        $roles = Role::all();
        return response()->json(['roles' => $roles]);
    }

    public function show($id)
    {
        $role = Role::find($id);
        if ($role) {
            return response()->json(['role' => $role]);
        } else {
            return response()->json(['message' => 'Role not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $role = new Role;
        $role->name = $request->name;
        $role->save();

        return response()->json(['message' => 'Role created', 'role' => $role]);
    }

    public function update(Request $request, $id)
    {
        $role = Role::find($id);
        if ($role) {
            $role->name = $request->name;
            $role->save();

            return response()->json(['message' => 'Role updated', 'role' => $role]);
        } else {
            return response()->json(['message' => 'Role not found'], 404);
        }
    }

    public function destroy($id)
    {
        $role = Role::find($id);
        if ($role) {
            $role->delete();
            return response()->json(['message' => 'Role deleted']);
        } else {
            return response()->json(['message' => 'Role not found'], 404);
        }
    }
}
