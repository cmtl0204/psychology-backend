<?php

namespace App\Http\Resources\V1\Psychology;

use Illuminate\Http\Resources\Json\JsonResource;
Use App\Http\Resources\V1\Psychology\AnswerResource;

class QuestionResource extends JsonResource
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
            'answers' => AnswerResource::collection($this->answers),
            'order' => $this->order,
            'type' => $this->type,
            'value' => $this->value,
        ];
    }
}
