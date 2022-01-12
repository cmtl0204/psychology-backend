<?php

namespace App\Http\Resources\V1\Cecy\SchoolPeriods;

use Illuminate\Http\Resources\Json\JsonResource;

class SchoolPeriodResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'code'=> $this->code,
            'ended_at'=> $this->ended_at,
            'especial_ended_at'=> $this->especial_ended_at,
            'especial_started_at'=> $this->especial_started_at,
            'extraordinary_ended_at'=> $this->extraordinary_ended_at,
            'extraordinary_started_at'=> $this->extraordinary_started_at,
            'name'=> $this->id,
            'ordinary_ended_at'=> $this->ordinary_ended_at,
            'ordinary_started_at'=> $this->ordinary_started_at,
            'started_at'=> $this->started_at,

        ];
    }
}
