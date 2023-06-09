<?php

namespace App\Http\Controllers;

use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class ColorController extends BaseController
{
    public function index()
    {
        $colors = Color::all();
        return response()->json(['colors' => $colors]);
    }

    public function show(int $id)
    {
        $color = Color::find($id);
        if ($color) {
            return response()->json(['color' => $color]);
        } else {
            return response()->json(['message' => 'Color not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $color = new Color;
        $color->name = $request->name;
        $color->save();

        return response()->json(['message' => 'Color created', 'color' => $color]);
    }

    public function update(Request $request, int $id)
    {
        $color = Color::find($id);
        if ($color) {
            $color->name = $request->name;
            $color->save();
            return response()->json(['message' => 'Color updated', 'color' => $color]);
        } else {
            return response()->json(['message' => 'Color not found'], 404);
        }
    }

    public function destroy(int $id)
    {
        $color = Color::find($id);
        if ($color) {
            $color->delete();
            return response()->json(['message' => 'Color deleted']);
        } else {
            return response()->json(['message' => 'Color not found'], 404);
        }
    }
}
