<?php

namespace App\Http\Resources\V1\Cecy\Institutions;

use Illuminate\Http\Resources\Json\JsonResource;

class InstitutionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'code' => $this->code,
            'logo' => $this->logo,
            'name' => $this->name,
            'slogan' => $this->slogan,
        ];
    }
}
