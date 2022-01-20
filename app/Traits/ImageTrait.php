<?php

namespace App\Traits;

use App\Http\Requests\V1\Core\Images\DownloadImageRequest;
use App\Http\Resources\V1\Core\ImageCollection;
use App\Http\Resources\V1\Core\ImageResource;
use App\Models\Core\Image;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as InterventionImage;
use App\Http\Requests\V1\Core\Images\IndexImageRequest;
use App\Http\Requests\V1\Core\Images\UpdateImageRequest;
use App\Http\Requests\V1\Core\Images\UploadImageRequest;

trait ImageTrait
{
    public function downloadImage(DownloadImageRequest $request, Image $image)
    {
        $path = $image->directory;

        $size = strtolower($request->input('size'));
        $compression = strtolower($request->input('compression'));

        switch ($size) {
            case 'sm':
                $path = "$path$image->id-sm";
                break;
            case 'md':
                $path = "$path$image->id-md";
                break;
            case 'lg':
                $path = "$path$image->id-lg";
                break;
            default:
                $path = "$path$image->id";
        }

        if ($request->has('compression') && $compression === 'true') {
            $path = "$path.webp";
        } else {
            $path = "$path.jpg";
        }

        if (!Storage::exists($path)) {
            return (new ImageCollection([]))->additional(
                [
                    'msg' => [
                        'summary' => 'Imagen no encontrada',
                        'detail' => 'Intente de nuevo',
                        'code' => '404'
                    ]
                ]);
        }

        return Storage::download($path);
    }

    public function uploadImage(UploadImageRequest $request)
    {
        foreach ($request->file('images') as $image) {
            $newImage = new Image();
            $newImage->name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $newImage->description = $request->input('description');
            $newImage->extension = 'jpg';
            $newImage->imageable()->associate($this);
            $newImage->save();

            Storage::makeDirectory('images/' . $newImage->id);

            $storagePath = storage_path('app/private/images/');
            $this->uploadOriginal(InterventionImage::make($image), $newImage->id, $storagePath);
            $this->uploadLargeImage(InterventionImage::make($image), $newImage->id, $storagePath);
            $this->uploadMediumImage(InterventionImage::make($image), $newImage->id, $storagePath);
            $this->uploadSmallImage(InterventionImage::make($image), $newImage->id, $storagePath);

            $newImage->directory = 'images/' . $newImage->id;
            $newImage->save();
        }
        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Imagen subida',
                'detail' => 'Su petición se procesó correctamente',
                'code' => '201'
            ]], 201);
    }

    public function updateImage(UpdateImageRequest $request, Image $image)
    {
        if ($request->hasFile('images')) {
            $requestImage = $request->file('images')[0];
            Storage::delete($image->directory);
            $storagePath = storage_path('app/private/images/');
            $this->uploadOriginal(InterventionImage::make($requestImage), $image->id, $storagePath);
            $this->uploadLargeImage(InterventionImage::make($requestImage), $image->id, $storagePath);
            $this->uploadMediumImage(InterventionImage::make($requestImage), $image->id, $storagePath);
            $this->uploadSmallImage(InterventionImage::make($requestImage), $image->id, $storagePath);
        }

        $image->name = $request->input('name');
        $image->description = $request->input('description');
        $image->save();

        return (new ImageResource($image))->additional(
            [
                'msg' => [
                    'summary' => 'Imagen actualizada',
                    'detail' => 'Su petición se procesó correctamente',
                    'code' => '201'
                ]
            ]);
    }

    public function destroyImage(Image $image)
    {
        try {
            Storage::delete("$image->directory/$image->id.jpg");
            Storage::delete("$image->directory/$image->id.webp");
            Storage::delete("$image->directory/$image->id-lg.jpg");
            Storage::delete("$image->directory/$image->id-lg.webp");
            Storage::delete("$image->directory/$image->id-md.jpg");
            Storage::delete("$image->directory/$image->id-md.webp");
            Storage::delete("$image->directory/$image->id-sm.jpg");
            Storage::delete("$image->directory/$image->id-sm.webp");

            $image->delete();

            return (new ImageResource($image))->additional(
                [
                    'msg' => [
                        'summary' => 'Imagen eliminada',
                        'detail' => 'Su petición se procesó correctamente',
                        'code' => '201'
                    ]
                ]
            );
        } catch (\Exception $exception) {
            return (new ImageResource(null))->additional(
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

    public function indexImages(IndexImageRequest $request)
    {
        $images = $this->images()
            ->description($request->input('description'))
            ->name($request->input('name'))
            ->paginate($request->input('per_page'));

        return (new ImageCollection($images))->additional(
            [
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    public function showImage(Image $image)
    {
        return (new ImageResource($image))->additional(
            [
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]
        );
    }

    // Guarda imagenes con su tamaño original
    private function uploadOriginal($image, $name, $storagePath)
    {
        $path = $storagePath . $name . '/' . $name . '.jpg';
        $image->save($path, 75);

        $path = $storagePath . $name . '/' . $name . '.webp';
        $image->save($path, 75);
    }

    // Guarda imagenes con una resolución de 300px de ancho y el alto es ajustable para celulares
    private function uploadSmallImage($image, $name, $storagePath)
    {
        $path = $storagePath . $name . '/' . $name . '-sm.jpg';
        $image->widen(300, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $storagePath . $name . '/' . $name . '-sm.webp';
        $image->widen(300, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }

    // Guarda imagenes con una resolución de 750px de ancho y el alto es ajustable para tablets
    private function uploadMediumImage($image, $name, $storagePath)
    {
        $path = $storagePath . $name . '/' . $name . '-md.jpg';
        $image->widen(750, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $storagePath . $name . '/' . $name . '-md.webp';
        $image->widen(750, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }

    // Guarda imagenes con una resolución de 1250px de ancho y el alto es ajustable para pc
    private function uploadLargeImage($image, $name, $storagePath)
    {
        $path = $storagePath . $name . '/' . $name . '-lg.jpg';
        $image->widen(1250, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $storagePath . $name . '/' . $name . '-lg.webp';
        $image->widen(1250, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }
}
