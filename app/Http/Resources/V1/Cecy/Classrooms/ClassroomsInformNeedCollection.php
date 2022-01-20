<?php

namespace App\Http\Resources\V1\Cecy\Classrooms;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ClassroomsInformNeedInformNeedCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
