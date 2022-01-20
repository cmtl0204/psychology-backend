<?php

namespace App\Http\Resources\V1\Cecy\Prerequisites;

use Illuminate\Http\Resources\Json\ResourceCollection;

class PlanificationCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
