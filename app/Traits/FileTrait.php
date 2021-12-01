<?php

namespace App\Traits;

use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Http\Resources\V1\Core\Authentications\FileCollection;
use App\Http\Resources\V1\Core\Authentications\FileResource;
use App\Models\Core\File;
use Illuminate\Support\Facades\Storage;

trait FileTrait
{
    public function downloadFile(File $file)
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

    public function uploadFile(UploadFileRequest $request)
    {
        if ($request->hasFile('file')) {
            $this->saveFile($request, $request->file('file'));
        }
        if ($request->hasFile('files')) {
            foreach ($request->file('files') as $file) {
                $this->saveFile($request, $file);
            }
        }

        return (new FileCollection([]))->additional(
            [
                'msg' => [
                    'summary' => 'Archivo(s) subido(s)',
                    'detail' => 'Su petición se procesó correctamente',
                    'code' => '201'
                ]
            ]);
    }

    public function indexFiles(IndexFileRequest $request)
    {
        $files = $this->files()
            ->description($request->input('description'))
            ->name($request->input('name'))
            ->paginate($request->input('per_page'));


        return (new FileCollection($files))->additional(
            [
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function showFile(File $file)
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

    public function updateFile(UpdateFileRequest $request, File $file)
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

    public function destroyFile(File $file)
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

    public function destroyFiles(DestroysFileRequest $request)
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

    public function destroyTrashedFiles()
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

    private function saveFile($request, $file)
    {
        $newFile = new File();
        $newFile->name = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
        $newFile->description = $request->input('description');
        $newFile->extension = $file->getClientOriginalExtension();
        $newFile->fileable()->associate($this);
        $newFile->save();

        $file->storeAs(
            'files',
            $newFile->partial_path,
            'private'
        );

        $newFile->directory = 'files';
        $newFile->save();
    }
}
