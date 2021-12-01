<?php

namespace App\Http\Resources\V1\Core\Authentications;

use Illuminate\Http\Resources\Json\JsonResource;

class FileResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'extension' => $this->extension,
            'fullName' => "{$this->name}.{$this->extension}",
            'fullPath' => "files/{$this->id}.{$this->extension}",
        ];
    }
}
