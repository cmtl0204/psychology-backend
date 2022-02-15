<?php

namespace App\Http\Resources\V1\Psychology;

use App\Http\Resources\V1\Core\LocationResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;

class TestResource extends JsonResource
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
            'assignment' => AssignmentResource::make($this->assignment),
            'canton' => LocationResource::make($this->canton),
            'priority' => PriorityResource::make($this->priority),
            'province' => LocationResource::make($this->province),
            'state' => StateResource::make($this->state),
            'user' => UserResource::make($this->user),
            'code' => $this->code,
            'termsConditions' => $this->terms_conditions,
            'createdAt' => $this->created_at,
        ];
    }
}
