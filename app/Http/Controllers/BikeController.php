<?php

namespace App\Http\Controllers;
use App\Http\Resources\BikeResource;
use App\Models\Bike;
use App\Http\Resources\BikeCollection;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class BikeController extends BaseController
{
    public function byCategory(string $id)
    {
        $bikes = Bike::where('category_id', $id)->paginate(10);
        return new BikeCollection($bikes);
    }

    public function index()
    {
        $bikes = Bike::paginate(10);
        return new BikeCollection($bikes);
    }

    public function show(string $id)
    {
        $bike = Bike::find($id);
        if ($bike) {
            return new BikeResource($bike);
        } else {
            return response()->json(['message' => 'Bike not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $bike = new Bike;
        $bike->brand_id = $request->brand_id;
        $bike->category_id = $request->category_id;
        $bike->model = $request->model;
        $bike->color_id = $request->color_id;
        $bike->description = $request->description;
        $bike->price = $request->price;
        $bike->image = $request->image;
        $bike->save();

        return response()->json(['message' => 'Bike created', 'bike' => $bike]);
    }

    public function update(Request $request, $id)
    {
        $bike = Bike::find($id);
        if ($bike) {
            $bike->brand_id = $request->brand_id;
            $bike->category_id = $request->category_id;
            $bike->model = $request->model;
            $bike->color_id = $request->color_id;
            $bike->description = $request->description;
            $bike->price = $request->price;
            $bike->image = $request->image;
            $bike->save();

            return response()->json(['message' => 'Bike updated', 'bike' => $bike]);
        } else {
            return response()->json(['message' => 'Bike not found'], 404);
        }
    }

    public function destroy($id)
    {
        $bike = Bike::find($id);
        if ($bike) {
            $bike->delete();
            return response()->json(['message' => 'Bike deleted']);
        } else {
            return response()->json(['message' => 'Bike not found'], 404);
        }
    }
}
