<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Catalogues\IndexCatalogueRequest;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Requests\V1\Core\Images\DownloadImageRequest;
use App\Http\Requests\V1\Core\Images\IndexImageRequest;
use App\Http\Requests\V1\Core\Images\UploadImageRequest;
use App\Http\Resources\V1\Core\Catalogues\CatalogueCollection;
use App\Models\Cecy\Catalogue;
use App\Models\Core\File;
use App\Models\Core\Image;

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

    public function all(IndexCatalogueRequest $request)
    {
        $catalogues = Catalogue::orderBy('name')
            ->type($request->input('type'))
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

    /*******************************************************************************************************************
     * FILES
     ******************************************************************************************************************/
    public function indexFiles(IndexFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->indexFiles($request);
    }

    public function uploadFile(UploadFileRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadFile($request);
    }

    public function downloadFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->downloadFile($file);
    }

    public function downloadFiles(Catalogue $catalogue)
    {
        return $catalogue->downloadFiles();
    }

    public function showFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, Catalogue $catalogue, File $file)
    {
        return $catalogue->updateFile($request, $file);
    }

    public function destroyFile(Catalogue $catalogue, File $file)
    {
        return $catalogue->destroyFile($file);
    }

    public function destroyFiles(Catalogue $catalogue, DestroysFileRequest $request)
    {
        return $catalogue->destroyFiles($request);
    }

    /*******************************************************************************************************************
     * IMAGES
     ******************************************************************************************************************/
    public function indexImages(IndexImageRequest $request, Catalogue $catalogue)
    {
        return $catalogue->indexImages($request);
    }

    public function uploadImage(UploadImageRequest $request, Catalogue $catalogue)
    {
        return $catalogue->uploadImage($request);
    }

    public function downloadImage(DownloadImageRequest $request, Catalogue $catalogue, Image $image)
    {
        return $catalogue->downloadImage($request, $image);
    }

    public function showImage(Catalogue $catalogue, Image $image)
    {
        return $catalogue->showImage($image);
    }

}
