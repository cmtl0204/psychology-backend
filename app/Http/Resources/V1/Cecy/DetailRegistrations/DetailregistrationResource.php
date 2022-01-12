<?php

namespace App\Http\Resources\V1\Cecy\DetailRegistrations;

use Illuminate\Http\Resources\Json\JsonResource;

class DetailRegistrationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            // 'course' => CourseResource::make($this->parent),
            'parent' => DetailRegistrationResource::make($this->parent),
            // 'nivel' => CatalogueResource::make($this->parent),
            'code_certified' => $this->code_certified,
            'grade1' => $this->grade1,
            'grade2' => $this->grade2,
            'final_grade' => $this->final_grade,
        ];
    }
}