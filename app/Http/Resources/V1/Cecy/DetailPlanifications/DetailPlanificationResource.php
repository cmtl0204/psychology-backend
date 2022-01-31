<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Classrooms\ClassroomResource;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [

            'id' => $this->id,
            'classroom' => ClassroomResource::make($this->classroom_id),
            'day' => CatalogueResource::make($this->day_id),
            'paralel' => CatalogueResource::make($this->paralel_id),
            'planification' => PlanificationResource::make($this->planification_id),
            'workday' => CatalogueResource::make($this->workday_id),
            'state' => CatalogueResource::make($this->state_id),
            'endedTime' => $this->end_time,
            'observations' => $this->observation,
            'planEndedAt' => $this->plan_ended_at,
            'registrationsLeft' => $this->registrations_left,
            'startedTime' => $this->start_time,
        ];
    }
}
