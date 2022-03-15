<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{$system->acronym}}</title>
    <style>

    </style>
</head>
<body>
<div class="content">
    <div class="row">
        <div class="col-7 offset-2">
            <img
                src="{{$message->embed(asset('images/email/bot.png'))}}"
                alt="Imagen PNG alternativa">
        </div>
    </div>
    <div class="row">
        <div class="col-6 offset-2 border">
            {{--            <h5 class="text-center bg-secondary text-white">{{$system->name}}</h5>--}}
            <p class="text-muted">
                Fecha: <b>{{\Carbon\Carbon::now()->toDateString()}}</b>
                <b class="ml-2">{{\Carbon\Carbon::now()->toTimeString()}}</b>
            </p>
            <p class="text-muted">
                <b>Alerta roja</b>
            </p>
            <p class="text-muted">
                <b>Caso de prioridad alta</b>
            </p>
            <p class="text-muted">
                Se han revisado los datos del chatbot #{{$data->code}} presenta signos de alarma que deben ser atendidos
                de urgencia
                por un profesional de la salud mental. Por favor revisar los resultados y derivar el caso.
            </p>
            <br>
            <p>
                Fundación Esquel
            </p>
            <div class="row">
                <div class="col-12">
                    <img
                        src="{{$message->embed(asset('images/email/esquel.jpg'))}}"
                        alt="Imagen PNG ESQUEL">
                    <img
                        src="{{$message->embed(asset('images/email/oxigeno.png'))}}"
                        alt="Imagen PNG OXIGEN">
                    <img
                        src="{{$message->embed(asset('images/email/usaid.png'))}}"
                        alt="Imagen PNG USAID">
                </div>
            </div>
            {{--            <h6 class="text-center bg-secondary text-white">&copy; {{(new \Carbon\Carbon($system->date))->format('Y')}}--}}
            {{--                Todos los--}}
            {{--                derechos reservados. {{$system->acronym}} v{{$system->version}}</h6>--}}
        </div>
    </div>
</div>
</body>
</html>
