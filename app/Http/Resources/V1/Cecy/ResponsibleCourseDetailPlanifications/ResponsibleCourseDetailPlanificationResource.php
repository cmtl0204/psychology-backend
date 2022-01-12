<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Models\Cecy\Instructor;
use Illuminate\Http\Resources\Json\JsonResource;

class ResponsibleCourseDetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'classroom' => ClassroomResource::make($this->classroom),
            'day' => CatalogueResource::make($this->day),
            'workday' => CatalogueResource::make($this->workday),
            'endTime' => $this->endTime,
            'instructors'=> Instructor::make($this->instructors),
            'endedAt' => $this->endedAt,
            'daysNumber' => $this->daysNumber,
            'startTime' => $this->startTime,
            'startedAt' => $this->startedAt,
        ];
    }
}
