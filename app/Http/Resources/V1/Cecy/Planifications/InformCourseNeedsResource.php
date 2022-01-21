<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodResource;
use App\Models\Cecy\Planification;
use Illuminate\Http\Resources\Json\JsonResource;
// use Illuminate\Http\Re

class InformCourseNeedsResource extends JsonResource
{
    public function toArray($request)
    {
        $planification = Planification::where([
            ['course_id', $request->input('course.id')],
            ['detail_school_period', $request->input('detailSchoolPeriod.id')],
            ['responsible_course_id', $request->input('responsibleCourse.id')]
        ]);

        return [
            'id' => $this->id,
            // 'course' => CourseResource::make($this->course),
            'planification' => new PlanificationsInformNeedResource($planification),
            'courseType' => CatalogueResource::make($this->course_type),
            'modality' => CatalogueResource::make($this->modality),
            'needs' => $this->needs,
            'code' => $this->code,
            'name' => $this->name,
            'duration' => $this->duration,
            'summary' => $this->summary
            'code' => $this->code,
           
        ];
    }
}
