<?php

namespace App\Http\Resources\V1\Psychology;

use Illuminate\Http\Resources\Json\JsonResource;

class AssignmentResource extends JsonResource
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
            'institution' => InstitutionResource::make($this->institution),
            'test' => InstitutionResource::make($this->test),
            'endedAt' => $this->ended_at,
            'observations' => $this->observations,
            'startedAt' => $this->started_at,
        ];
    }
}
