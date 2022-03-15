<?php

namespace App\Http\Resources\V1\Psychology;

use App\Http\Resources\V1\Core\LocationResource;
use App\Http\Resources\V1\Core\Users\UserResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class ExportTestResource extends JsonResource
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
            'agent' => AgentResource::make($this->agent),
            'assignment' => AssignmentResource::make($this->assignment),
            'canton' => LocationResource::make($this->canton),
            'priority' => PriorityResource::make($this->priority),
            'province' => LocationResource::make($this->province),
            'state' => StateResource::make($this->state),
            'results' => ResultResource::collection($this->results),
            'user' => UserResource::make($this->user),
            'age' => $this->age,
            'code' => $this->code,
            'score' => $this->score,
            'termsConditions' => $this->terms_conditions,
            'type' => strtoupper($this->type),
            'createdAt' => (Carbon::create($this->created_at))->toDateString(),
        ];
    }
}
