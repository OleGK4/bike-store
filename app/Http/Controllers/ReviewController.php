<?php

namespace App\Http\Controllers;
use App\Http\Resources\ReviewCollection;
use App\Http\Resources\ReviewResource;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;


class ReviewController extends BaseController
{
    public function index()
    {
        $reviews = Review::paginate(5);
        return new ReviewCollection($reviews);
    }

    public function show(int $id)
    {
        $review = Review::find($id);
        if ($review) {
            return new ReviewResource($review);
        } else {
            return response()->json(['message' => 'Review not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $review = new Review;
        $review->bike_id = $request->bike_id;
        $review->user_id = $request->user_id;
        $review->text = $request->text;
        $review->rating = $request->rating;
        $review->save();

        return response()->json(['message' => 'Review created', 'review' => $review]);
    }

    public function update(Request $request, int $id)
    {
        $review = Review::find($id);
        if ($review) {
            $review->bike_id = $request->bike_id;
            $review->user_id = $request->user_id;
            $review->text = $request->text;
            $review->rating = $request->rating;
            $review->save();
            return response()->json(['message' => 'Review updated', 'review' => $review]);
        } else {
            return response()->json(['message' => 'Review not found'], 404);
        }
    }

    public function destroy(int $id)
    {
        $review = Review::find($id);
        if ($review) {
            $review->delete();
            return response()->json(['message' => 'Review deleted']);
        } else {
            return response()->json(['message' => 'Review not found'], 404);
        }
    }
}
