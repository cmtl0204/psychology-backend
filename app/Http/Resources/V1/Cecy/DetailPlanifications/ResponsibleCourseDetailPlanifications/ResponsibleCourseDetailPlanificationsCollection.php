<?php

namespace App\Http\Resources\V1\Cecy\DetailsPlanifications;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ResponsibleCourseDetailPlanificationCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
