<?php

namespace App\Http\Resources\V1\Cecy\ParticipantRecordCompetitors;

use Illuminate\Http\Resources\Json\JsonResource;

class ParticipantRecordCompetitorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'user' => UserResource::make($this->user)
        ];
    }
}
