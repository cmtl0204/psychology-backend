<?php

namespace App\Http\Resources\V1\Cecy\ClassroomsInformNeeds;

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
