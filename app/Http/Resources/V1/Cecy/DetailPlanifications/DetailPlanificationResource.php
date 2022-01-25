<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [

            'id' => $this->id,
            'classrooms' => ClassroomResource::collection($this->classroom_id),
            'day' => CatalogueResource::collection($this->day_id),
            'paralel' =>CatalogueResource::collection($this->paralel_id),
            'planification' => PlanificationResource::collection($this->planification_id),
            'workday' => CatalogueResource::collection($this->workday_id),
            'state' => CatalogueResource::collection($this->state_id),
            'endTime' => $this->end_time,
            'observations' => $this->observation,
            'planEndedAt' => $this->plan_ended_at,
            'registrationsLeft' => $this->registrations_left,
            'startTime' => $this->start_time,
        ];
    }
}
