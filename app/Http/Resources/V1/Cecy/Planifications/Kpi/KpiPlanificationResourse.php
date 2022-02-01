<?php

namespace App\Http\Resources\V1\Cecy\Planifications\Kpi;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use Illuminate\Http\Resources\Json\JsonResource;

class KpiPlanificationResourse extends JsonResource
{
    public function toArray($request)
    {
        return [
            'state' => CatalogueResource::make($this->state),
            'count' => $this->id_count,
        ];
    }
}
