<?php

namespace App\Http\Resources\V1\Cecy\SchoolPeriods;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;

class SchoolPeriodResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'code'=> $this->code,
            'endedAt'=> $this->ended_at,
            'name'=> $this->id,
            'startedAt'=> $this->started_at,
            'state' => CatalogueResource::make($this->state),

        ];
    }
}
