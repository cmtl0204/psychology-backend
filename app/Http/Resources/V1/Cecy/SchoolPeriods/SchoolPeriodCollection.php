<?php

namespace App\Http\Resources\V1\Cecy\SchoolPeriods;

use Illuminate\Http\Resources\Json\ResourceCollection;

class SchoolPeriodsCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
