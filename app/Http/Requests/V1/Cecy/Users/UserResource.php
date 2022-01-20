<?php

namespace App\Http\Resources\V1\Cecy\Users;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name'=> $this->name,
            'lastname'=> $this->lastname,
            'photoUrl'=> $this->photo_url,
            'email'=> $this->email,
        ];
    }
}