<?php

namespace App\Http\Resources\V1\Core;

use Illuminate\Http\Resources\Json\JsonResource;

class LocationResource extends JsonResource
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
            'parent' => LocationResource::make($this->parent),
            'code' => $this->code,
            'name' => $this->name,
            'alpha2Code' => strtolower($this->alpha2_code),
            'alpha3Code' => strtolower($this->alpha3_code),
            'callingCode' => $this->calling_code,
            'flag' => $this->flag,
        ];
    }
}
