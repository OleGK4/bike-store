<?php

namespace App\Http\Controllers;
use App\Http\Resources\CartResource;
use App\Models\Cart;
use App\Models\CartBikes;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Gate;

class CartController extends BaseController
{
    public function index(Request $request)
    {
        $user = $request->user();
        return new CartResource($user->cart);

    }

    public function store(Request $request)
    {
        $user = $request->user();

        $bikeId = $request->bike_id;
        if (!$bikeId) {
            return response()->json(['message' => 'Invalid request'], 400);
        }

        $cartBike = new CartBikes;

        $cartBike->bike_id = $bikeId;
        $cartBike->cart_id = $user->cart->id;
        $cartBike->save();

        $cart = Cart::where('id', $user->cart->id)->first();
        if ($cart) {
            $cart->touch();
        }

        return response()->json(['message' => 'Bike added to cart', 'bike' => $cartBike]);
    }

    public function destroy(Request $request)
    {
        $user = $request->user();
        $cartBike = CartBikes::find($request->id);

        if (!$cartBike) {
            return response()->json(['message' => 'Cart bike not found'], 404);
        }

        if ($user->cannot('delete', $cartBike)) {
            abort(403, 'You do not own this cart!');
        }

        $cartBike->delete();

        $cart = Cart::where('id', $user->cart->id)->first();
        if ($cart) {
            $cart->touch();
        }

        return response()->json(['message' => 'Bike deleted from cart']);
    }
}
