<?php

namespace App\Http\Resources\V1\Cecy\Authorities;

use Illuminate\Http\Resources\Json\JsonResource;

class AuthorityResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'position_started_at' => $this->position_started_at,
            'position_ended_at' => $this->position_ended_at,
            'electronic_signature' => $this->electronicSignature
        ];
    }
}
