<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use App\Models\CartBikes;
use App\Models\Order;
use App\Models\OrderBikes;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class OrderController extends BaseController
{
    public function index(Request $request)
    {
        $user = $request->user();
        if ($request->user()->cannot('viewAny', OrderBikes::class)) {
            abort(403, 'Unauthorized');
        }

        $userOrders = $user->orders()->with('orderBikes')->get();

        if (!$userOrders) {
            return response()->json(['message' => 'Orders not found!'], 404);
        }
        return response()->json
        ([
            'orders' => $userOrders,
        ]);
    }

    public function store(Request $request)
    {
        $user = $request->user();
        $orderBikes = new OrderBikes;
        if ($user->cannot('create', $orderBikes)) {
            abort(403, 'Unauthorized');
        }

        $cartId = $user->cart->id;
        $cartBikes = CartBikes::where('cart_id', $cartId)->get();


        if ($cartBikes->isEmpty()) {
            return response()->json(['message' => 'Bikes not found'], 404);
        }


        $sum = 0;
        foreach ($cartBikes as $itemBike){
            $sum += $itemBike->bike->price;
        }


        $newOrder = Order::create([
            'user_id' => $user->id,
            'price' => $sum
        ]);

        foreach ($cartBikes as $bike){
            OrderBikes::create([
                'order_id' => $newOrder->id,
                'bike_id' => $bike->bike_id
            ]);
        }
        CartBikes::where('cart_id', $cartId)->delete();


        // Timestamp updates
        $cart = Cart::where('id', $cartId)->first();
        if ($cart) {
            $cart->touch();
        }

        return response()->json(['message' => 'Successfully created an order!']);
    }
}
