<?php

namespace App\Http\Resources\V1\Cecy\DetailRegistrations;

use Illuminate\Http\Resources\Json\ResourceCollection;

class DetailRegistrationCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
