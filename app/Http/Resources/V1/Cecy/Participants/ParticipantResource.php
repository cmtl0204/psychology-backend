<?php

namespace App\Http\Resources\V1\Cecy\DetailRegistrations;

use Illuminate\Http\Resources\Json\JsonResource;

class ParticipantResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
        ];
    }
}