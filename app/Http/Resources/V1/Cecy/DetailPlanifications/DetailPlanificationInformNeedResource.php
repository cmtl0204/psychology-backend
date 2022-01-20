<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationInformNeedResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'day' => CatalogueResource::make($this->day),
            'endTime' => $this->end_time,
            'startTime' => $this->start_time,
            'planificacion' => PlanificationInformNeedResource::collection($this->planification),
            'classroom' => ClassroomInformNeedResource::collection($this->classroom)
        ];
    }
}
