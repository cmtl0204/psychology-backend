<?php

namespace App\Http\Resources\V1\Cecy\Requeriments;

use Illuminate\Http\Resources\Json\JsonResource;

class RequerimentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'name' => $this->name,
            'required' => $this->required,
        ];
    }
}
