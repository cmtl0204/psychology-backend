<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\Topic;
use Illuminate\Http\Resources\Json\JsonResource;

class TopicsByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'course.id' => Course::make($this->course),
            'level.id' => Catalogue::make($this->level_id),
            'parent.id' => Topic::make($this->parent_id),
            'description' => $this->description
        ];
    }
}
