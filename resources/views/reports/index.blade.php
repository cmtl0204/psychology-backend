<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Resultados</title>
    <style>

    </style>
</head>
<body>
<div class="content">
    <div class="row">
        <div class="col-12 text-center">
{{--            <img src="{!! asset('images/logo.png') !!}" alt="logo PNG alternativa">--}}
        </div>
    </div>
    @yield('content')
    <footer class="text-center text-muted">
        <hr size="3">
        <small><b>Nota de descargo:</b></small>
        <small>La información contenida en este documento es responsabilidad única del titular.</small>
        <small>Cualquier alteración de dicha información puede ocasionar sanciones.
        </small>
    </footer>
</div>
</body>
</html>
