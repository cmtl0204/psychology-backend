@extends('reports.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted ">
            <h4 class="text-center">Usted se encuentra registrado en el sistema de Bolsa de Empleo
            </h4>
            <br>
            <div class="text-center">
                <img src="{!! asset('qr/'.$data->id.'.png') !!}" alt="Imagen PNG alternativa">
            </div>
        </div>
    </div>
@endsection
