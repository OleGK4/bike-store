<?php

namespace App\Http\Controllers;
use App\Http\Resources\OrderCollection;
use App\Http\Resources\OrderResource;
use App\Models\Cart;
use App\Models\CartBikes;
use App\Models\Order;
use App\Models\OrderBikes;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;

class OrderController extends BaseController
{
    public function userOrders(Request $request)
    {
        $user = $request->user();
        return OrderResource::collection($user->orders);
    }

    public function index(Request $request)
    {
        $orders = Order::paginate(5);
        return new OrderCollection($orders);
    }

    public function store(Request $request)
    {
        $user = $request->user();
        $orderBikes = new OrderBikes;

        if ($user->cannot('create', $orderBikes)) {
            return response()->json(['message' => 'You must verify your account to order products!'], 403);
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
            $orderBikes::create([
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
