<?php

namespace App\Http\Controllers;

use App\Http\Resources\ReviewCollection;
use App\Http\Resources\ReviewResource;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Validator;


class ReviewController extends BaseController
{
    public function reviewsForBike(Request $request, int $bike_id)
    {
        $reviews = Review::where('bike_id', $bike_id)->paginate(5);
        if ($reviews->isEmpty()) {
            return response()->json(['message' => 'There are no reviews for this bike!'], 404);
        }

        return new ReviewCollection($reviews);
    }

    public function index()
    {
        $reviews = Review::paginate(5);
        return new ReviewCollection($reviews);
    }

    public function userReviews(Request $request)
    {
        $user = $request->user();
        $reviews = $user->reviews()->paginate(5);
        return new ReviewCollection($reviews);
    }

    public function show(int $id)
    {
        $review = Review::find($id);
        if (!$review) {
            return response()->json(['message' => 'Review not found'], 404);
        }

        return new ReviewResource($review);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'text' => 'required|string',
            'rating' => 'required|integer|between:1,10',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = $request->user();
        $bikeId = $request->bike_id;

        $orderBikes = $user->orderBikes;

        foreach ($orderBikes as $bike) {
            if ($bike->bike_id == $bikeId) {
                $review = new Review;

                $review->bike_id = $bikeId;
                $review->user_id = $request->user()->id;
                $review->text = $request->text;
                $review->rating = $request->rating;

                $review->save();

                return response()->json(['message' => 'Review created', 'review' => $review]);
            }
        }
        return response()->json(['message' => 'You must buy this bike to make a review!'], 403);

    }

    public function update(Request $request, int $id)
    {
        $validator = Validator::make($request->all(), [
            'text' => 'required|string',
            'rating' => 'required|integer|between:1,10',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $review = Review::find($id);
        if (!$review) {
            return response()->json(['message' => 'Review not found'], 404);
        }

        $user = $request->user();
        if ($user->cannot('update', $review)) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $review->text = $request->text;
        $review->rating = $request->rating;
        $review->save();

        return response()->json(['message' => 'Review updated', 'review' => $review]);
    }

    public function destroy(Request $request, int $id)
    {
        $review = Review::find($id);
        if(!$review){
            return response()->json(['message' => 'Review not found'], 404);
        }
        if ($request->user()->cannot('delete', $review)) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }
        $review->delete();
        return response()->json(['message' => 'Review deleted']);
    }
}
