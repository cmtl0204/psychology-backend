<?php

namespace App\Http\Resources\V1\Cecy\DetailPlanifications;

use App\Http\Resources\V1\Cecy\DetailInstructors\DetailInstructorResource;
use Illuminate\Http\Resources\Json\JsonResource;

class DetailPlanificationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            
            'id' => $this->id,
            'parent' => DetailInstructorResource::make($this->parent),
            'code_certified' => $this->code_certified,
        ];
    }
}
