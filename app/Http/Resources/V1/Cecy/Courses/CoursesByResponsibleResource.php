<?php

namespace App\Http\Resources\V1\Cecy\Planifications;

use App\Http\Resources\V1\Cecy\Authorities\AuthorityResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Courses\CourseResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Models\Cecy\Authority;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Resources\Json\JsonResource;

class CoursesByResponsibleResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'responsibleCourseId' => InstructorResource::make($this->responsibleCourseId), 
            // 'course' => CourseResource::make($this->course),
            'state' => CatalogueResource::make($this->state),
            'photoId' => CourseResource::make($this->photoId)
        ];
    }
}
