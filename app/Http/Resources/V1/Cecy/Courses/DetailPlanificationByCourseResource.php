<?php

namespace App\Http\Resources\V1\Cecy\Courses;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Classrooms\ClassroomResource;
use App\Models\Cecy\Instructor;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationByCourseResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'classroom' => ClassroomResource::make($this->classroom),
            'day' => CatalogueResource::make($this->day),
            'paralel' => CatalogueResource::make($this->paralel),
            'workday' => CatalogueResource::make($this->workday),
            'state' => CatalogueResource::make($this->state),
            'endTime' => $this->endTime,
            'instructors' => Instructor::make($this->instructors),
            'daysNumber' => $this->daysNumber,
            'startTime' => $this->startTime,
            'registrationsLeft' => $this->registrations_left
        ];
    }
}
