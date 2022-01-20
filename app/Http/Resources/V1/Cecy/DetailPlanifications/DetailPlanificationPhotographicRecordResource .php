<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationPhotographicRecordResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'workday' => CatalogueResource::make($this->workday),
            'endTime' => $this->end_time,
            'startTime' => $this->start_time,
            'planificacion' => PlanificationInformNeedResource::collection($this->planification),
        ];
    }
}
