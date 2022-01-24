<?php

namespace App\Http\Resources\V1\Cecy\Topics;

use Illuminate\Http\Resources\Json\JsonResource;

class TopicResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'children' => TopicResource::make($this->children),
            'level' => $this->level,
            'description' => $this->description,
        ];
    }
}
