<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use Illuminate\Http\Resources\Json\ResourceCollection;

class TopicsByCourseCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
