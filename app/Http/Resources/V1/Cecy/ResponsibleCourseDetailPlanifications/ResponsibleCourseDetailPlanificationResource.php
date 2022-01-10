<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Http\Resources\V1\Cecy\Planifications\PlanificationResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class ResponsibleCourseDetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'classroom' => CourseResource::make($this->classroom),
            'day' => CecyCatalogueResource::make($this->day),
            'planification' => PlanificationResource::make($this->planification),
            'state' => CecyCatalogueResource::make($this->state),
            'endTime' => $this->endTime,
            'endedAt' => $this->endedAt,
            'daysNumber' => $this->daysNumber,
            'startTime' => $this->startTime,
            'startedAt' => $this->startedAt,
            'planEndedAt' => $this->planEndedAt,
        ];
    }
}
