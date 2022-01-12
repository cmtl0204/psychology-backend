<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use App\Http\Resources\V1\Cecy\Classrooms\ClassroomResource;
use App\Models\Cecy\Instructor;

class ResponsibleCourseDetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'classroom' => ClassroomResource::make($this->classroom),
            'day' => CatalogueResource::make($this->day),
            'workday' => CatalogueResource::make($this->workday),
            'instructors'=> Instructor::make($this->instructors),
            'daysNumber' => $this->daysNumber,
            'endTime' => $this->endTime,
            'endedAt' => $this->endedAt,
            'startTime' => $this->startTime,
            'startedAt' => $this->startedAt,
        ];
    }
}
