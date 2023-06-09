<?php

namespace App\Http\Controllers;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class BrandController extends BaseController
{
    public function index()
    {
        $brands = Brand::all();
        return response()->json(['brands' => $brands]);
    }

    public function show(int $id)
    {
        $brand = Brand::find($id);
        if ($brand) {
            return response()->json(['brand' => $brand]);
        } else {
            return response()->json(['message' => 'Brand not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $brand = new Brand;
        $brand->name = $request->name;
        $brand->save();

        return response()->json(['message' => 'Brand created', 'brand' => $brand]);
    }

    public function update(Request $request, int $id)
    {
        $brand = Brand::find($id);
        if ($brand) {
            $brand->name = $request->name;
            $brand->save();

            return response()->json(['message' => 'Brand updated', 'brand' => $brand]);
        } else {
            return response()->json(['message' => 'Brand not found'], 404);
        }
    }

    public function destroy(int $id)
    {
        $brand = Brand::find($id);
        if ($brand) {
            $brand->delete();
            return response()->json(['message' => 'Brand deleted']);
        } else {
            return response()->json(['message' => 'Brand not found'], 404);
        }
    }
}
