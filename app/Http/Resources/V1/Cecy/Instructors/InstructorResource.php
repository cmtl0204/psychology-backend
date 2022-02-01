<?php

namespace App\Http\Resources\V1\Cecy\Instructors;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Users\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;

class InstructorResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'state' => CatalogueResource::make($this->state),
            'type' => CatalogueResource::make($this->type),
            'user' => UserResource::make($this->user),
        ];
    }
}
