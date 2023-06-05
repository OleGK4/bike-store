<?php

namespace App\Http\Controllers;
use App\Models\Bike;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class BikeController extends BaseController
{
    public function getBikes(){
        return Bike::all();
    }
}
