<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'responsibleCourse' => AuthorityResource::make($this->responsibleCourse),
            'responsibleCecy' => AuthorityResource::make($this->responsibleCecy),
            'schoolPeriod' => SchoolPeriodResource::make($this->schoolPeriod),
            'state' => CatalogueResource::make($this->state),
            'startedAt' => $this->started_at,
            'endedAt' => $this->ended_at,
        ];
    }
}
