<?php

namespace App\Http\Resources\V1\Cecy\Participants;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CoursesByParticipantCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
