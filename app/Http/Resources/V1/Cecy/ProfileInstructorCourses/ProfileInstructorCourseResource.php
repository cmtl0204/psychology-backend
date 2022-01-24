<?php

namespace App\Http\Resources\V1\Cecy\ProfileInstructorCourses;

use Illuminate\Http\Resources\Json\JsonResource;

class AuthorityResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'require_knowledge' => $this->require_knowledge,
            'require_skills' => $this->require_skills,
            'require_experience' => $this->require_experience,
        ];
    }
}
