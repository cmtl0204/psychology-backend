<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'area' => $this->description,
            'sector' => $this->description,
            'id' => $this->id,
            'course' => CourseResource::make($this->course),
            'responsibleCourse' => AuthorityResource::make($this->responsibleCourse),
            'responsibleCecy' => AuthorityResource::make($this->responsibleCecy),
            'schoolPeriod' => SchoolPeriodResource::make($this->schoolPeriod),
            'state' => CecyCatalogueResource::make($this->state),
            'startedAt' => $this->description,
            'endedAt' => $this->description,
            'ordinaryInscriptionStartedAt' => $this->description,
            'ordinaryInscriptionEndedAt' => $this->description,
            'extraordinaryInscriptionStartedAt' => $this->description,
            'extraordinaryInscriptionEndedAt' => $this->description,
            'especialStartedDateAt' => $this->description,
            'especialEndedDateAt' => $this->description,
            'needs' => $this->description,
        ];
    }
}
