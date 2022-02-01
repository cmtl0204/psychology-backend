<?php

namespace App\Http\Resources\V1\Cecy\ProfileInstructorCourses;

use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProfileInstructorCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'course' => CourseResource::make($this->course),
            'requiredExperiences' => $this->require_experience,
            'requiredKnowledges' => $this->require_knowledge,
            'requiredSkills' => $this->require_skills
        ];
    }
}
