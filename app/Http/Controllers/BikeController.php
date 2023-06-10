<?php

namespace App\Http\Controllers;
use App\Http\Resources\BikeResource;
use App\Models\Bike;
use App\Http\Resources\BikeCollection;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

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
        $data = $request->all();
        $filename = $data['image']->getClientOriginalName();

        // Сохраняем оригинальную картинку
        $data['image']->move(Storage::path('/public/images/bikes/').'origin/',$filename);

        // Создаем миниатюру изображения и сохраняем ее
        $thumbnail = Image::make(Storage::path('/public/images/bikes/').'origin/'.$filename);
        $thumbnail->fit(300, 300);
        $thumbnail->save(Storage::path('/public/images/bikes/').'thumbnail/'.$filename);

        $data['image'] = $filename;


        $bike = new Bike;
        $bike->brand_id = $request->brand_id;
        $bike->category_id = $request->category_id;
        $bike->model = $request->model;
        $bike->color_id = $request->color_id;
        $bike->description = $request->description;
        $bike->price = $request->price;
        $bike->image = $data['image'];
        $bike->save();

        return response()->json(['message' => 'Bike created', 'bike' => $bike]);
    }

    public function update(Request $request,int $id)
    {
        $bike = Bike::find($id);

        if ($bike) {
            // Обработка изображения, если оно было передано
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $filename = $image->getClientOriginalName();

                $image->move(public_path('/images/bikes/origin/'), $filename);

                $thumbnail = Image::make(public_path('/images/bikes/origin/') . $filename);
                $thumbnail->fit(300, 300);
                $thumbnail->save(public_path('/images/bikes/thumbnail/') . $filename);

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
