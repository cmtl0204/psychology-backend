<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\DetailPlanification;
use Illuminate\Http\Request;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationResource;
use App\Http\Resources\V1\Cecy\DetailPlanifications\DetailPlanificationCollection;

class PastranaDetailPlanificationsController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }

    public function index()
    {

        return (new DetailPlanificationsCollection($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function store(DetailPlanification $detailPlanification)
    {
        $detailPlanification = new DetailPlanification ();
        $detailPlanification->course()->associate(Course::find($request->input('course.id')));
        $detailPlanification->parent()->associate(Topic::find($request->input('parent.id')));
        $detailPlanification->nivel()->associate(Catalogue::find($request->input('nivel.id')));
        $detailPlanification->description = $request->input('description');

        return (new DetailPlanificationResource($detailPlanification))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Creado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function show(DetailPlanification $detailPlanification)
    {
        return (new DetailPlanificationResource($detailPlanification))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function update(Request $request,DetailPlanification $detailPlanification )
    {
        $detailPlanification->course()->associate(Course::find($request->input('course.id')));
        $detailPlanification->parent()->associate(Topic::find($request->input('parent.id')));
        $detailPlanification->nivel()->associate(Catalogue::find($request->input('nivel.id')));
        $detailPlanification->description = $request->input('description');
        $detailPlanification->save();

        return (new DetailPlanificationResource($detailPlanification))
        ->additional([
            'msg' => [
                'summary' => 'Tema o subtema Actualizado',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function destroy(DetailPlanification $detailPlanification)
    {
        $topic->delete();
        return (new DetailPlanificationResource($detailPlanification))
            ->additional([
                'msg' => [
                    'summary' => 'Tema o subtema Eliminado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
