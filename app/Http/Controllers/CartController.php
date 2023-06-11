<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use App\Models\CartBikes;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class CartController extends BaseController
{
    public function index(Request $request)
    {
        $user = $request->user();
        $cartId = $user->cart->id;

        if ($request->user()->cannot('viewAny', CartBikes::class)) {
            abort(403, 'Unauthorized');
        }

        $cartBikes = CartBikes::where('cart_id', $cartId)->get();

        if (!$cartBikes) {
            return response()->json(['message' => 'Bike not found'], 404);
        }
        return response()->json
        ([
            'bikes' => $cartBikes,
        ]);
    }

    public function store(Request $request)
    {
        $user = $request->user();

        $bikeId = $request->bike_id;
        if (!$bikeId) {
            return response()->json(['message' => 'Invalid request'], 400);
        }
        $cartBike = new CartBikes;
        if ($request->user()->cannot('create', $cartBike)) {
            abort(403, 'Unauthorized');
        }
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
            abort(403, 'Unauthorized');
        }

        $cartBike->delete();

        $cart = Cart::where('id', $user->cart->id)->first();
        if ($cart) {
            $cart->touch();
        }

        return response()->json(['message' => 'Bike deleted from cart']);
    }
}
