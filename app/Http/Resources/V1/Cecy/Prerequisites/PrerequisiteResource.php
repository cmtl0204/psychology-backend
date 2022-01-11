<?php

namespace App\Http\Resources\V1\Cecy\Prerequisites;

use Illuminate\Http\Resources\Json\JsonResource;
// use Illuminate\Http\Re

class PrerequisiteResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'course' => CourseResource::make($this->course),
            'prerequisite' => PrerequisiteResource::make($this->prerequisite)
        ];
    }
}
