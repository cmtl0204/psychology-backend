<?php

namespace App\Http\Resources\V1\Cecy\Instructors;

use Illuminate\Http\Resources\Json\JsonResource;

class InstructorResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            // 'course' => CourseResource::make($this->parent),
            'parent' => InstructorResource::make($this->parent),
            // 'nivel' => CatalogueResource::make($this->parent),
            'code_certified' => $this->code_certified,
        ];
    }
}