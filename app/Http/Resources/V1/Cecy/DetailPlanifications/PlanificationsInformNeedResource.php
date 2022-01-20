<?php

namespace App\Http\Resources\V1\Cecy\PlanificationsInformNeeds;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationsInformNeedsResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'area' => CatalogueResource::make($this->area),
            'sector' => CatalogueResource::make($this->sector),
            'course' => CatalogueResource::make($this->course),
            'responsibleCourse' => AuthorityResource::make($this->responsibleCourse),
            'endedAt' => $this->ended_at,
            'startedAt' => $this->started_at,
            'needs' => $this->needs,

        ];
    }
}
