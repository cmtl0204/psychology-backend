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
            'classroomsId' => ClassroomResource::make($this->classroom_id),
            'dayId' => CatalogueResource::make($this->day_id),
            'paralelId' =>CatalogueResource::make($this->paralel_id),
            'planificationId' => PlanificationResource::make($this->planification_id),
            'workdayId' => CatalogueResource::make($this->workday_id),
            'stateId' => CatalogueResource::make($this->state_id),
            'endTime' => $this->end_time,
            'observation' => $this->observation,
            'planEndedAt' => $this->plan_ended_at,
            'registrationsLeft' => $this->registrations_left,
            'startTime' => $this->start_time,
        ];
    }
}
