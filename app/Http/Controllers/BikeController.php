<?php

namespace App\Http\Controllers;
use App\Http\Resources\BikeResource;
use App\Models\Bike;
use App\Http\Resources\BikeCollection;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class BikeController extends BaseController
{
    public function getBikes()
    {
        return new BikeCollection(Bike::paginate(10));
    }

    public function getBikeById(string $id)
    {
        return new BikeResource(Bike::find($id));
    }

    public function getBikesByCategory(string $id)
    {
        return new BikeCollection(Bike::where('category_id', $id)->paginate(10));
    }
}


