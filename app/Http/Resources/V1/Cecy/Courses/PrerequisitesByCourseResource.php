<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Models\Cecy\Course;
use Illuminate\Http\Resources\Json\JsonResource;

class PrerequisitesByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'course.id' => Course::make($this->course),
            'prerequisite.id' => Course::make($this->prerequisite_id)
        ];
    }
}
