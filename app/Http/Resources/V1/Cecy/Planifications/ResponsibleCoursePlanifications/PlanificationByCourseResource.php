<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueCollection;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationCollection;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodResource;
use App\Models\Cecy\Instructor;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        $course = $request->input('course.id');
        $partipantTypes = $course->participantType();
        
        return [
            'id' => $this->id,
            'participantTypes' => new CatalogueCollection($partipantTypes),
            'responsibleCourse' => InstructorResource::make($this->responsibleCourse),
            'schoolPeriod' => DetailSchoolPeriodResource::collection($this->detailSchoolPeriod),
            'state' => CatalogueResource::make($this->state),
            'code' => $this->code,
            'startedAt' => $this->started_at,
            'startTime' => $this->started_at,
            // 'instructors'=>'',
            // 'endedAt' => $this->ended_at,
            // 'endTime' => $this->ended_at,
            'detailPlanifications' => DetailPlanificationResource::collection($this->dedetailPlanifications),
        ];
    }
}
