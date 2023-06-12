<?php

namespace App\Http\Controllers;
use App\Http\Resources\ReviewCollection;
use App\Http\Resources\ReviewResource;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Gate;


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
        if ($request->user()->cannot('create', $review)) {
            abort(403, 'Unauthorized');
        }
        $review->bike_id = $request->bike_id;
        $review->user_id = $request->user()->id;
        $review->text = $request->text;
        $review->rating = $request->rating;
        $review->save();

        return response()->json(['message' => 'Review created', 'review' => $review]);
    }

    public function update(Request $request, int $id)
    {

        $review = Review::find($id);
        if ($request->user()->cannot('update', $review)) {
            abort(403, 'Unauthorized');
        }
        if ($review) {
            $review->text = $request->text;
            $review->rating = $request->rating;
            $review->save();
            return response()->json(['message' => 'Review updated', 'review' => $review]);
        } else {
            return response()->json(['message' => 'Review not found'], 404);
        }
    }

    public function destroy(Request $request, int $id)
    {
        $review = Review::find($id);
        if ($request->user()->cannot('delete', $review)) {
            abort(403, 'Unauthorized');
        }
        if ($review) {
            $review->delete();
            return response()->json(['message' => 'Review deleted']);
        } else {
            return response()->json(['message' => 'Review not found'], 404);
        }
    }
}
