<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;    
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationResource;
use App\Http\Resources\V1\Cecy\Detailregistrations\DetailregistrationCollection;
use App\Models\Cecy\DetailRegistration;

class QuemagDetailRegistrationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store')->only(['store']);
        $this->middleware('permission:update')->only(['update']);
        $this->middleware('permission:delete')->only(['destroy', 'destroys']);
    }

    public function index()
    {
        return (new DetailregistrationCollection($detailRegistration))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function store(Request $request)
    {
        return (new TopicResource($topic))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show(DetailRegistration $detailRegistration)
    {
        return (new DetailRegistrationResource($detailRegistration))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,DetailRegistration $detailRegistration )
    {
        return (new DetailRegistrationResource($detailRegistration))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(detailRegistration $detailRegistration)
    {
        $topic->delete();
        return (new DetailRegistrationResource($detailRegistration))
            ->additional([
                'msg' => [
                    'summary' => 'Tema o subtema Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
