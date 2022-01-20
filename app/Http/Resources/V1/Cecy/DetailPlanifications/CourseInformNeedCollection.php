<?php

namespace App\Http\Resources\V1\Cecy\CourseInformNeeds;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CourseInformNeedInformNeedCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
