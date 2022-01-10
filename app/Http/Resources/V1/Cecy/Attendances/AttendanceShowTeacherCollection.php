<?php

namespace App\Http\Resources\V1\Cecy\Attendances;

use Illuminate\Http\Resources\Json\ResourceCollection;

class AttendanceShowTeacherCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
