<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Institution;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\Institution\InstitutionResource;
use App\Http\Resources\V1\Cecy\Institution\InstitutionCollection;

class MatangoInstitution extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new InstitutionCollection($institution))
        ->additional([
            'msg' => [
                'summary' => 'Informacion traida exitosamente',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }
    public function store(Request $request)
    {
        return (new Institution($institution))
        ->additional([
            'msg' => [
                'summary' => 'Institucion Creada',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show(Institution $institution)
    {
        return (new InstitutionResource($institution))
        ->additional([
            'msg' => [
                'summary' => 'Informacion exitosa',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,Institution $institution )
    {
        return (new InstitutionResource($institution))
        ->additional([
            'msg' => [
                'summary' => 'Institucion Actualizada!',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(Institution $institution)
    {
        $institution->delete();
        return (new InstitutionResource($institution))
            ->additional([
                'msg' => [
                    'summary' => 'Institucion eliminada',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
