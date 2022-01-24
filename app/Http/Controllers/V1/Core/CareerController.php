<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Careers\CatalogueCareerRequest;
use App\Http\Resources\V1\Core\InstitutionCollection;
use App\Http\Resources\V1\Core\InstitutionResource;
use App\Models\Core\Career;

class CareerController extends Controller
{
    function catalogue(CatalogueCareerRequest $request)
    {
        $careers = Career::get();

        return (new InstitutionCollection($careers))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
