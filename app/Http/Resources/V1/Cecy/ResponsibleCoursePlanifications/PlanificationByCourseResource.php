<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodResource;
use App\Models\Cecy\Instructor;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'instructors'=>'',
            'participants'=>'',
            'responsibleCourse' => InstructorResource::make($this->responsibleCourse),
            'schoolPeriod' => SchoolPeriodResource::make($this->schoolPeriod),
            'state' => CatalogueResource::make($this->state),
            'startedAt' => $this->started_at,
            'endedAt' => $this->ended_at,
        ];
    }
}
