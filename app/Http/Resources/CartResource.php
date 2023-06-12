<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CartResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
//            'user' => $this->users->name,
//            'updated_at' => $this->updated_at,
//            'bikes' => CartBikesResource::collection($this->cartBikes),
        ];
    }
}
