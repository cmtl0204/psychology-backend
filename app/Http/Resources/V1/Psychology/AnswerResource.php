<?php

namespace App\Http\Resources\V1\Psychology;

use Illuminate\Http\Resources\Json\JsonResource;

class AnswerResource extends JsonResource
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
            'question' => AnswerResource::make($this->question),
            'class' => $this->class,
            'icon' => $this->icon,
            'order' => $this->order,
            'score' => $this->score,
            'value' => $this->value,
        ];
    }
}
