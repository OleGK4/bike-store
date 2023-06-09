<?php

namespace App\Http\Controllers;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class CategoryController extends BaseController
{
    public function index()
    {
        $categories = Category::all();
        return response()->json(['categories' => $categories]);
    }

    public function show(int $id)
    {
        $category = Category::find($id);
        if ($category) {
            return response()->json(['category' => $category]);
        } else {
            return response()->json(['message' => 'Category not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $category = new Category;
        $category->name = $request->name;
        $category->save();

        return response()->json(['message' => 'Category created', 'category' => $category]);
    }

    public function update(Request $request, int $id)
    {
        $category = Category::find($id);
        if ($category) {
            $category->name = $request->name;
            $category->save();

            return response()->json(['message' => 'Category updated', 'category' => $category]);
        } else {
            return response()->json(['message' => 'Category not found'], 404);
        }
    }

    public function destroy(int $id)
    {
        $category = Category::find($id);
        if ($category) {
            $category->delete();
            return response()->json(['message' => 'Category deleted']);
        } else {
            return response()->json(['message' => 'Category not found'], 404);
        }
    }
}
