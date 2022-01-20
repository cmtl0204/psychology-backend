<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
<<<<<<< HEAD
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
=======
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\SchoolPeriods\SchoolPeriodResource;
>>>>>>> 0e29ed5e1284f70ddaa1c44e6e575b8e52a081ec
use App\Models\Cecy\Authority;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class PlanificationByResponsibleCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'responsibleCourse' => AuthorityResource::make($this->responsibleCourse),
            'responsibleCecy' => AuthorityResource::make($this->responsibleCecy),
            'schoolPeriod' => SchoolPeriodResource::make($this->schoolPeriod),
            'course' => CourseResource::make($this->course),
            'state' => CatalogueResource::make($this->state),
            'startedAt' => $this->started_at,
            'endedAt' => $this->ended_at,
        ];
    }
}
