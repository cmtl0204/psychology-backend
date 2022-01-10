<?php

namespace App\Http\Resources\V1\Cecy\Authorities;

use Illuminate\Http\Resources\Json\ResourceCollection;

class AuthorityCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
