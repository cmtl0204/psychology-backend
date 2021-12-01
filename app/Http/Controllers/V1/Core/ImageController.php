<?php

namespace App\Http\Controllers\V1\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Images\DownloadImageRequest;
use App\Http\Requests\V1\Core\Images\IndexImageRequest;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as InterventionImage;
use App\Http\Requests\V1\Core\Images\UpdateImageRequest;
use App\Http\Requests\V1\Core\Images\UploadImageRequest;
use App\Models\Core\Image;

class ImageController extends Controller
{
    private $storagePath;

    public function __construct()
    {
        $this->storagePath = storage_path('app\private\images\\');
    }

    public function download(DownloadImageRequest $request)
    {
        $path = $request->input('full_path');
        if (!Storage::exists($path)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Imagen no encontrada',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        return Storage::download($path);
    }

    public function upload(UploadImageRequest $request, $model)
    {
        foreach ($request->file('images') as $image) {
            $newImage = new Image();
            $newImage->name = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
            $newImage->description = $request->input('description');
            $newImage->extension = '.jpg';
            $newImage->imageable()->associate($model);
            $newImage->save();

            Storage::makeDirectory('images\\' . $newImage->id);

            $this->uploadOriginal(InterventionImage::make($image), $newImage->id);
            $this->uploadLargeImage(InterventionImage::make($image), $newImage->id);
            $this->uploadMediumImage(InterventionImage::make($image), $newImage->id);
            $this->uploadSmallImage(InterventionImage::make($image), $newImage->id);

            $newImage->directory = 'images';
            $newImage->save();
        }
        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Imagen subida',
                'detail' => 'La imagen fue subida correctamente',
                'code' => '201'
            ]], 201);
    }

    public function update(UpdateImageRequest $request, $imageId)
    {
        $image = Image::find($imageId);
        // Valida que exista la imagen, si no encuentra el registro en la base devuelve un mensaje de error
        if (!$image) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Imagen no encontrada',
                    'detail' => 'La imagen no pudo ser modificada',
                    'code' => '404'
                ]], 404);
        }

        $image->name = $request->input('name');
        $image->description = $request->input('description');
        $image->save();

        $this->uploadOriginal($request->file('image'), $imageId);
        $this->uploadLargeImage($request->file('image'), $imageId);
        $this->uploadMediumImage($request->file('image'), $imageId);
        $this->uploadSmallImage($request->file('image'), $imageId);

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Imagen actulizada',
                'detail' => 'La imagen fue actualizada correctamente',
                'code' => '201'
            ]], 201);
    }

    public function delete($imageId)
    {
        $image = Image::find($imageId);
        // Valida que exista la imagen, si no encuentra el registro en la base devuelve un mensaje de error
        if (!$image) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Imagen no encontrada',
                    'detail' => 'La imagen ya ha sido eliminada',
                    'code' => '404'
                ]], 404);
        }
        // Es una eliminación lógica
        $image->state = false;
        $image->save();

        // Elimina los archivos del servidoir
        Storage::deleteDirectory('images\\' . $imageId);

        return response()->json([
            'data' => null,
            'msg' => [
                'summary' => 'Imagen eliminada',
                'detail' => 'La imagen fue eliminada correctamente',
                'code' => '201'
            ]], 201);
    }

    public function index(IndexImageRequest $request, $model)
    {
        if ($request->has('search')) {
            $images = $model->images()
                ->name($request->input('search'))
                ->description($request->input('search'))
                ->get();
        } else {
            $images = $model->images()->paginate($request->input('per_page'));
        }

        if (sizeof($images) === 0) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'No se encontraron imagenes',
                    'detail' => 'Intente de nuevo',
                    'code' => '404'
                ]], 404);
        }

        return response()->json($images, 200);
    }

    public function show($imageId)
    {
        // Valida que el id se un número, si no es un número devuelve un mensaje de error
        if (!is_numeric($imageId)) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'ID no válido',
                    'detail' => 'Intente de nuevo',
                    'code' => '400'
                ]], 400);
        }
        $image = Image::firstWhere('id', $imageId);

        // Valida que exista el registro, si no encuentra el registro en la base devuelve un mensaje de error
        if (!$image) {
            return response()->json([
                'data' => null,
                'msg' => [
                    'summary' => 'Imagen no encontrado',
                    'detail' => 'Vuelva a intentar',
                    'code' => '404'
                ]], 404);
        }

        return response()->json([
            'data' => $image,
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]], 200);
    }

    // Guarda imagenes con una resolución de 300px de ancho y el alto es ajustable para celulares
    private function uploadSmallImage($image, $name)
    {
        $path = $this->storagePath . $name . '\\' . $name . '-sm.jpg';
        $image->widen(300, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $this->storagePath . $name . '\\' . $name . '-sm.webp';
        $image->widen(300, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }

    // Guarda imagenes con una resolución de 750px de ancho y el alto es ajustable para tablets
    private function uploadMediumImage($image, $name)
    {
        $path = $this->storagePath . $name . '\\' . $name . '-md.jpg';
        $image->widen(750, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $this->storagePath . $name . '\\' . $name . '-md.webp';
        $image->widen(750, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }

    // Guarda imagenes con una resolución de 1250px de ancho y el alto es ajustable para pc
    private function uploadLargeImage($image, $name)
    {
        $path = $this->storagePath . $name . '\\' . $name . '-lg.jpg';
        $image->widen(1250, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);

        $path = $this->storagePath . $name . '\\' . $name . '-lg.webp';
        $image->widen(1250, function ($constraint) {
            $constraint->upsize();
        })->save($path, 75);
    }

    // Guarda imagenes con su tamaño original
    private function uploadOriginal($image, $name)
    {
        $path = $this->storagePath . $name . '\\' . $name . '.jpg';
        $image->save($path, 75);

        $path = $this->storagePath . $name . '\\' . $name . '.webp';
        $image->save($path, 75);
    }
}
