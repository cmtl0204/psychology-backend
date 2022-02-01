<?php

namespace App\Http\Resources\V1\Cecy\Classrooms;

use App\Http\Resources\V1\Cecy\AdditionalInformations\AdditionalInformationResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ClassroomResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'additionalInformation' => AdditionalInformationResource::make($this->additionalInformation),
            'type' => CatalogueResource::make($this->type),
            'description' => $this->description,
            'capacity' => $this->capacity,
            'code' => $this->code,
            'name' => $this->name,
        ];
    }
}
