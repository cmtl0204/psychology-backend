<?php

namespace App\Http\Resources\V1\Cecy\Catalogues;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CatalogueCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection
        ];
    }
}
