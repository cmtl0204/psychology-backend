@extends('reports.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted ">
            <h5 class="text-center">Reporte de resultados de tamizaje de Chatbot: TEMI, te escuch</h5>
            <br>
            <div class="text-center">
                {{--                <img src="{!! asset('qr/'.$data->id.'.png') !!}" alt="Imagen PNG alternativa">--}}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                <tr>
                    <th width="70%">Número de Chatbot:</th>
                    <td width="30%">{{$data->code}}</td>
                </tr>
                <tr>
                    <th>Nombres Completos:</th>
                    <td>{{$data->user->name}} {{$data->user->lastname}}</td>
                </tr>
                <tr>
                    <th>Cédula:</th>
                    <td>{{$data->user->username}}</td>
                </tr>
                <tr>
                    <th>Edad:</th>
                    <td>{{$data->age}}</td>
                </tr>
                <tr>
                    <th>Fecha de registro:</th>
                    <td>{{$data->createdAt}}</td>
                </tr>
                <tr>
                    <th>Nombres de representante:</th>
                    @if($data->age<18)
                        <td>{{$data->agent->name}} {{$data->agent->lastname}}</td>
                    @else
                        <td>{{$data->user->name}} {{$data->user->lastname}}</td>
                    @endif
                </tr>
                <tr>
                    <th>Teléfono de contacto:</th>
                    @if($data->age<18)
                        <td>{{$data->agent->phone}}</td>
                    @else
                        <td>{{$data->user->phone}}</td>
                    @endif
                </tr>
                <tr>
                    <th>Correo electrónico:</th>
                    @if($data->age<18)
                        <td>{{$data->agent->email}}</td>
                    @else
                        <td>{{$data->user->email}}</td>
                    @endif
                </tr>
                <tr>
                    <th>Provincia:</th>
                    <td>{{$data->province->name}}</td>
                </tr>
                <tr>
                    <th>Cantón:</th>
                    <td>{{$data->canton->name}}</td>
                </tr>
            </table>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            - Resultados
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                <tr>
                    <th>Tests Aplicados:</th>
                    <td>PHQ-2 - {{$data->type}}</td>
                </tr>
                <tr>
                    <th>Puntuación Total:</th>
                    <td>{{$data->score}}</td>
                </tr>
                <tr>
                    <th>Severidad:
                        (Ver cuadro de interpretación
                        al final del reporte)
                    </th>
                    <td>{{$data->priority->name}}</td>
                </tr>
            </table>
        </div>
    </div>
@endsection
