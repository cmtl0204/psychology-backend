<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\CatalogueCatalogueRequest;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Core\Catalogue;

class CatalogueController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }

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

    public function catalogue(CatalogueCatalogueRequest $request)
    {
        $sorts = explode(',', $request->sort);
        $catalogues = Catalogue::customOrderBy($sorts)
            ->description($request->input('name'))
            ->name($request->input('name'))
            ->type($request->input('type'))
            ->paginate($request->input('per_page'));

        return (new CatalogueCollection($catalogues))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ])
            ->response()->setStatusCode(200);
    }
}
