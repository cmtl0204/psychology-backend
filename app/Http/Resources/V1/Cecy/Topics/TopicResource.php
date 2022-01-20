<?php

namespace App\Http\Resources\V1\Cecy\Topics;

use App\Http\Resources\V1\Cecy\Catalogues\CatalogueResource;
use Illuminate\Http\Resources\Json\JsonResource;

class TopicResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'children' => TopicResource::make($this->children),
            'level' => CatalogueResource::make($this->level),
            'description' => $this->description,
        ];
    }
}
