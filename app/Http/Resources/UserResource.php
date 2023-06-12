<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
//            'reviews' => ReviewResource::collection($this->reviews),
            'cart' => CartResource::collection($this->cart), // Issue
//            'orders' => OrderResource::collection($this->orders),
        ]; // Ресурс юзера, что бы вложить в него обзоры, корзину и проч.
    }
}
