<?php

namespace App\Http\Resources\V1\Psychology;

use Illuminate\Http\Resources\Json\JsonResource;

class ResultResource extends JsonResource
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
            'answer' => AnswerResource::make($this->answer),
            'question' => QuestionResource::make($this->question),
            'createdAt' => $this->created_at,
        ];
    }
}
