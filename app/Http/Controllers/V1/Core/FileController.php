<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Resources\V1\Core\Authentications\FileCollection;
use App\Http\Resources\V1\Core\Authentications\FileResource;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Models\Core\File;

class FileController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin')->only(['destroyTrashed']);

        $this->middleware('permission:download-files')->only(['download']);
        $this->middleware('permission:upload-files')->only(['upload']);
        $this->middleware('permission:view-files')->only(['index', 'show']);
        $this->middleware('permission:update-files')->only(['update']);
        $this->middleware('permission:delete-files')->only(['destroy', 'destroys']);
    }

    public function download(File $file)
    {
        if (!Storage::exists($file->full_path)) {
            return (new FileCollection([]))->additional(
                [
                    'msg' => [
                        'summary' => 'Archivo no encontrado',
                        'detail' => 'Intente de nuevo',
                        'code' => '404'
                    ]
                ]);
        }

        return Storage::download($file->full_path);
    }

    public function show(File $file)
    {
        return (new FileResource($file))->additional(
            [
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]
        );
    }

    public function update(UpdateFileRequest $request, File $file)
    {
        $file->name = $request->input('name');
        $file->description = $request->input('description');
        $file->save();
        return (new FileResource($file))->additional(
            [
                'msg' => [
                    'summary' => 'Archivo actualizado',
                    'detail' => 'El archivo fue actualizado correctamente',
                    'code' => '201'
                ]
            ]);
    }

    public function destroy(File $file)
    {
        try {
            Storage::delete($file->full_path);
            $file->delete();
            return (new FileResource($file))->additional(
                [
                    'msg' => [
                        'summary' => 'Archivo eliminado',
                        'detail' => 'Su petición se procesó correctamente',
                        'code' => '201'
                    ]
                ]
            );
        } catch (\Exception $exception) {
            return (new FileResource(null))->additional(
                [
                    'msg' => [
                        'summary' => 'Surgió un error al eliminar',
                        'detail' => 'Intente de nuevo',
                        'code' => '500'
                    ]
                ]
            );
        }
    }

    public function destroys(DestroysFileRequest $request)
    {
        foreach ($request->input('ids') as $id) {
            $file = File::find($id);
            if ($file) {
                $file->delete();
                Storage::delete($file->full_path);
            }
        }

        return (new FileCollection([]))
            ->additional(
                [
                    'msg' => [
                        'summary' => 'Archivo(s) eliminado(s)',
                        'detail' => 'Su petición se procesó correctamente',
                        'code' => '201'
                    ]
                ]
            );
    }

    public function destroyTrashed()
    {
        $filesDeleted = File::onlyTrashed()->get();

        foreach ($filesDeleted as $file) {
            if ($file) {
                $file->forceDelete();
                Storage::delete($file->full_path);
            }
        }
        return (new FileCollection($filesDeleted))->additional(
            [
                'msg' => [
                    'summary' => 'Archivo(s) eliminado(s)',
                    'detail' => 'Su petición se procesó correctamente',
                    'code' => '201'
                ]
            ]);
    }
}
