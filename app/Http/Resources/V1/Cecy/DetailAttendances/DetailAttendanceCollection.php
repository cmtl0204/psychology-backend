<?php

namespace App\Http\Resources\V1\Cecy\Authorities;

use Illuminate\Http\Resources\Json\ResourceCollection;

class DetailAttendanceCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
