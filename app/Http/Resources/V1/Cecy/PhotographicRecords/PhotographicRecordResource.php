<?php

namespace App\Http\Resources\V1\Cecy\PhotographicRecords;

use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationPhotographicRecordResource;
use Illuminate\Http\Resources\Json\JsonResource;

class PhotographicRecordResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'detailPlanificacion' => DetailPlanificationPhotographicRecordResource::collection($this->detail_planification),
            'description' => $this->description,
            'numberWeek'=>$this->number_week,
            'weekAt' =>$this->week_at,

        ];
    }
}
