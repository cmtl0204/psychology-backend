<?php

namespace App\Http\Resources\V1\Cecy\RegistrationRequeriments;

use Illuminate\Http\Resources\Json\JsonResource;

class RegistrationRequerimentResource extends JsonResource
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
            'url' => $this->url,
        ];
    }
}
