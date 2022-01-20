<?php

namespace App\Http\Resources\V1\Cecy\Instructors;

use Illuminate\Http\Resources\Json\JsonResource;

class InstructorResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'state' => CatalogueResource::make($this->state_id),
            'type' => CatalogueResource::make($this->type_id),
            'user' => UsersResource::make($this->user_id),
        ];
    }
}