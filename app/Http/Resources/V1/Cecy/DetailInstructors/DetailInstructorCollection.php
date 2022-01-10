<?php

namespace App\Http\Resources\V1\Cecy\DetailInstructors;

use Illuminate\Http\Resources\Json\ResourceCollection;

class DetailInstructorCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
