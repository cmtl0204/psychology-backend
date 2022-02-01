<?php

namespace App\Http\Resources\V1\Cecy\ProfileInstructorCourses;

use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\Course;
use Illuminate\Http\Resources\Json\JsonResource;

class ProfileInstructorCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'course' => CourseCollection::make($this->course),
            'requiredKnowledges' => $this->required_knowledges,
            'requiredSkills' => $this->required_skills,
            'requiredExperiences' => $this->required_experiences,
        ];
    }
}
