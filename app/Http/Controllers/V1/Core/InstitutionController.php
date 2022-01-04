<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Institutions\CareersInstitutionRequest;
use App\Http\Requests\V1\Core\Institutions\CatalogueInstitutionRequest;
use App\Http\Resources\V1\Core\CareerCollection;
use App\Http\Resources\V1\Core\InstitutionCollection;
use App\Models\Core\Institution;

class InstitutionController extends Controller
{
    function catalogue(CatalogueInstitutionRequest $request)
    {
        $institutions = Institution::get();

        return (new InstitutionCollection($institutions))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    function careers(CareersInstitutionRequest $request, Institution $institution)
    {
        $careers = $institution->careers()->get();

        return (new CareerCollection($careers))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
