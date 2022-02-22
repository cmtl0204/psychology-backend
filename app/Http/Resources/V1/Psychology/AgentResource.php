<?php

namespace App\Http\Resources\V1\Psychology;

use Illuminate\Http\Resources\Json\JsonResource;

class AgentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'identification' => $this->identification,
            'lastname' => $this->lastname,
            'name' => $this->name,
            'phone' => $this->phone,
            'email' => $this->email,
        ];
    }
}
