<?php

namespace App\Http\Resources\V1\Core;

use Illuminate\Http\Resources\Json\JsonResource;

class CareerResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */

    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'institution' => InstitutionResource::make($this->institution),
            'name' => $this->name,
        ];
    }
}
