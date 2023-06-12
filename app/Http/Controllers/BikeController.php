<?php

namespace App\Http\Controllers;
use App\Http\Resources\BikeResource;
use App\Models\Bike;
use App\Http\Resources\BikeCollection;
use App\Models\Review;
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

        $reviews = Review::where('bike_id', $id)->paginate(5);

        if (!$reviews->isEmpty()) {
            $ratingSum = $reviews->sum('rating');
            $count = $reviews->count();
            $average = $ratingSum / $count;          // NOT DONE!
        } else {
            $average = 0;
        }

        if ($bike) {
            return new BikeResource($bike, $average);
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

    public function update(Request $request, int $id)
    {
        $bike = Bike::find($id);

        if ($bike) {
            // Обработка названия изображения, если оно было передано
            if ($request->has('image')) {
                $filename = $request->image;
                $bike->image = $filename;
            }

            // Получение переданных полей
            $brandId = $request->input('brand_id');
            $categoryId = $request->input('category_id');
            $model = $request->input('model');
            $colorId = $request->input('color_id');
            $description = $request->input('description');
            $price = $request->input('price');

            // Обновление значений только для переданных полей модели
            if ($brandId !== null) {
                $bike->brand_id = $brandId;
            }
            if ($categoryId !== null) {
                $bike->category_id = $categoryId;
            }
            if ($model !== null) {
                $bike->model = $model;
            }
            if ($colorId !== null) {
                $bike->color_id = $colorId;
            }
            if ($description !== null) {
                $bike->description = $description;
            }
            if ($price !== null) {
                $bike->price = $price;
            }

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
