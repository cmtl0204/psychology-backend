<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Core\Catalogue;

class CatalogueController extends Controller
{
    public function __construct()
    {
//        $this->middleware('role:admin')->only(['destroyTrashed']);
//
//        $this->middleware('permission:download-files')->only(['download']);
//        $this->middleware('permission:upload-files')->only(['upload']);
//        $this->middleware('permission:view-files')->only(['index', 'show']);
//        $this->middleware('permission:update-files')->only(['update']);
//        $this->middleware('permission:delete-files')->only(['destroy', 'destroys']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return CatalogueCollection
     */
    public function index(IndexCatalogueRequest $request)
    {
        $sorts = explode(',', $request->sort);

        $catalogues = Catalogue::customOrderBy($sorts)
            ->type($request->input('type'))
            ->paginate();

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function all(IndexCatalogueRequest $request)
    {
        $catalogues = Catalogue::orderBy('name')
            ->type($request->input('type'))
//            ->paginate();
            ->paginate($request->input('per_page'));

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
