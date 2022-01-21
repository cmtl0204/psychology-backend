<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationInformNeedResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Models\Cecy\DetailPlanification;


use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationsInformNeedResource extends JsonResource
{
    public function toArray($request)
    {
        $detailPlanification=DetailPlanification::planification_id();

        return [
            'id' => $this->id,
            'detailplanification' => new DetailPlanificationInformNeedResource($detailPlanification),
            'area' => CatalogueResource::make($this->area),
            'sector' => CatalogueResource::make($this->sector),
            'responsibleCourse' => InstructorResource::make($this->responsibleCourse),
            'detailSchoolPeriod' => DetailSchoolPeriodResource::make($this->schoolPeriod),
            'endedAt' => $this->ended_at,
            'startedAt' => $this->started_at,
            'needs' => $this->needs,

        ];
    }
}
