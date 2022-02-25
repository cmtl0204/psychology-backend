<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var string[]
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var string[]
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    public function render($request, Throwable $e)
    {
//        return parent::render($request, $e);
        if ($e instanceof HttpException) {
            if ($e->getStatusCode() === 403) {
                return response()->json([
                    'data' => $e->getMessage(),
                    'msg' => [
                        'summary' => 'No tiene permisos para realizar esta acción',
                        'detail' => '',
                        'code' => '403-email'
                    ]], 403);
            }
            if ($e->getStatusCode() === 404) {
                return response()->json([
                    'data' => $e->getMessage(),
                    'msg' => [
                        'summary' => 'Recurso no encontrado',
                        'detail' => 'La ruta o recurso al que intenta acceder no existe o fue removido',
                        'code' => $e->getCode()
                    ]], 404);
            }
            if ($e->getStatusCode() === 405) {
                $supportMethods = implode(', ', $e->getHeaders());
                return response()->json([
                    'data' => $e->getMessage(),
                    'msg' => [
                        'summary' => "El método [{$request->getMethod()}] no está soportado por esta ruta",
                        'detail' => "Métodos soportados: [{$supportMethods}]",
                        'code' => $e->getCode()
                    ]], 405);
            }
            if ($e->getStatusCode() === 503) {
                return response()->json([
                    'data' => $e->getMessage(),
                    'msg' => [
                        'summary' => 'El sistema se encuentra fuera de servicio',
                        'detail' => 'Lamentamos las molestias causadas',
                        'code' => $e->getCode()
                    ]], 503);
            }
        }

        if ($e instanceof QueryException) {
            return response()->json([
                'data' => $e->errorInfo,
                'msg' => [
                    'summary' => 'Error en la consulta',
                    'detail' => 'Comuníquese con el administrador',
                    'code' => $e->getCode()
                ]], 400);
        }

        if ($e instanceof ModelNotFoundException) {
            return response()->json([
                'data' => $e->getModel(),
                'msg' => [
                    'summary' => 'Error en la consulta',
                    'detail' => 'Comunicate con el administrador',
                    'code' => $e->getCode()
                ]], 404);
        }

        if ($e instanceof ValidationException) {
            return response()->json([
                'data' => $e->errors(),
                'msg' => [
                    'summary' => 'Error en la validación de campos',
                    'detail' => $e->errors(),
                    'code' => $e->getCode()
                ]], 422);
        }

        if ($e instanceof \Error) {
            return response()->json([
                'data' => $e->getMessage(),
                'msg' => [
                    'summary' => 'Oops! Tuvimos un problema con el servidor',
                    'detail' => 'Comnicate con el administrador',
                    'code' => $e->getCode(),
                ]], 500);
        }

        return response()->json([
            'data' => $e->getMessage(),
            'msg' => [
                'summary' => $e->getMessage(),
                'detail' => 'Comnicate con el administrador',
                'code' => $e->getCode()
            ]], 500);
    }
}
