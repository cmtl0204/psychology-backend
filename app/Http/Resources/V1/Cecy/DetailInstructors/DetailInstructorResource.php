<?php

namespace App\Http\Resources\V1\Cecy\DetailInstructors;

use Illuminate\Http\Resources\Json\JsonResource;

class DetailInstructorResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            // 'course' => CourseResource::make($this->parent),
            'parent' => DetailInstructorResource::make($this->parent),
            // 'nivel' => CatalogueResource::make($this->parent),
            'code_certified' => $this->code_certified,
        ];
    }
}