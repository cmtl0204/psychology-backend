@extends('mails.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted" style="text-align: justify">
            Estimado {{$data->user->name}}
        </div>

        <p>
            El reporte de casos solicitado en la consola TEMI, te escucha se encuentra listo. Por favor proceda con la
            descarga.
        </p>
    </div>
@endsection
