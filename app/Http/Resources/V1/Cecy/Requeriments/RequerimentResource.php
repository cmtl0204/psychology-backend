<?php

namespace App\Http\Resources\V1\Cecy\Requeriments;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Registrations\RegistrationResource;
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
            'id' => $this->id,
            'registrations' => RegistrationResource::collection($this->registrations),
            'state' => CatalogueResource::make($this->state),
            'name' => $this->name,
            'required' => $this->required,
        ];
    }
}
