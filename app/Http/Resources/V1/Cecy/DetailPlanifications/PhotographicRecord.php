<?php

namespace App\Http\Resources\V1\Cecy\DetailPanifications;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class PhotographicRecordResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'description' => $this->description,
            'numberWeek'=>$this->number_week,
            'weekAt' =>$this->week_at,
            'detailPlanificacion' => DetailPlanificationPhotographicRecordResource::collection($this->detail_planification),

        ];
    }
}
