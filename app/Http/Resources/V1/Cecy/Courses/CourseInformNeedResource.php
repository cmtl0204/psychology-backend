<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;


class CourseInformNeedResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'courseType' => CatalogueResource::make($this->course_type),
            'modality' => CatalogueResource::make($this->modality),
            'needs' => $this->needs,
            'code' => $this->code,
            'name' => $this->name,
            'duration' => $this->duration,
            'summary' => $this->summary
        ];
    }
}
