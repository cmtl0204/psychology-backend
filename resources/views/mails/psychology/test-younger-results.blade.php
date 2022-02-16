@extends('mails.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted ">
            <h3 class="text-center">Test Finalizado</h3>
            <h3 class="text-center">{{$data->test->type}}</h3>
            <br>
            <p>Muchas gracias por tu participación. Recuerda que este es un servicio gratuito. Te animo a seguir
                cuidando de ti y recuerda que Jorgebot, tu amigo, estará disponible para cuando lo necesites. ¡Hasta
                pronto!.</p>
        </div>
    </div>
@endsection
