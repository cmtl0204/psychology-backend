<?php

namespace App\Http\Resources\V1\Cecy\PlanificationsInformNeeds;

use Illuminate\Http\Resources\Json\ResourceCollection;

class PlanificationsInformNeedCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
