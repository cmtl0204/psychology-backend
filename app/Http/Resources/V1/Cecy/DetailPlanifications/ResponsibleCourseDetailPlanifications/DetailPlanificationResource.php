<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Classrooms\ClassroomResource;
use App\Http\Resources\V1\Cecy\Instructors\InstructorResource;
use App\Models\Cecy\Instructor;

class DetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'classroom' => ClassroomResource::make($this->classroom),
            'days' => CatalogueResource::make($this->day),
            'paralel' => CatalogueResource::make($this->paralel),
            'state' => CatalogueResource::make($this->state),
            'workday' => CatalogueResource::make($this->workday),
            'instructors' => InstructorResource::collection($this->instructors),
            'endTime' => $this->endTime,
            'endedAt' => $this->endedAt,
            'observations' => $this->observations,
            'startTime' => $this->startTime,
            'startedAt' => $this->startedAt,
        ];
    }
}
