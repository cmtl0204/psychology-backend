@extends('reports.index')

@section('content')
    <br>
    <div class="row">
        <div class="col-11 offset-1">
            <table>
                <tr>
                    <td>
                        <img src="{!! public_path('images/pdf/bot.png') !!}" width="200px" alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/esquel.jpg') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/oxigeno.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/usaid.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                </tr>
            </table>
        </div>
        <br>
        <div class="col-12">
            <br>
            <h4 class="text-center">Reporte de resultados de tamizaje de Chatbot: TEMI, te escucha</h4>
        </div>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                <tr>
                    <th width="250px" class="column-left">Número de Chatbot:</th>
                    <td width="350px" class="column-right">{{$data->code}}</td>
                </tr>
                <tr>
                    <th class="column-left">Nombres Completos:</th>
                    <td class="column-right">{{$data->user->name}} {{$data->user->lastname}}</td>
                </tr>
                <tr>
                    <th class="column-left">Cédula:</th>
                    <td class="column-right">{{$data->user->username}}</td>
                </tr>
                <tr>
                    <th class="column-left">Edad:</th>
                    <td class="column-right">{{$data->age}}</td>
                </tr>
                <tr>
                    <th class="column-left">Fecha de registro:</th>
                    <td class="column-right">{{$data->created_at}}</td>
                </tr>
                <tr>
                    <th class="column-left">Nombres de representante:</th>
                    @if($data->age<18)
                        <td class="column-right">{{$data->agent->name}} {{$data->agent->lastname}}</td>
                    @else
                        <td class="column-right">No Aplica</td>
                    @endif
                </tr>
                <tr>
                    <th class="column-left">Teléfono de contacto:</th>
                    @if($data->age<18)
                        <td class="column-right">{{$data->agent->phone}}</td>
                    @else
                        <td class="column-right">{{$data->user->phone}}</td>
                    @endif
                </tr>
                <tr>
                    <th class="column-left">Correo electrónico:</th>
                    @if($data->age<18)
                        <td class="column-right">{{$data->agent->email}}</td>
                    @else
                        <td class="column-right">{{$data->user->email}}</td>
                    @endif
                </tr>
                <tr>
                    <th class="column-left">Provincia:</th>
                    <td class="column-right">{{$data->province->name}}</td>
                </tr>
                <tr>
                    <th class="column-left">Cantón:</th>
                    <td class="column-right">{{$data->canton->name}}</td>
                </tr>
            </table>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <h4>- Resultados:</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                <tr>
                    <th width="250px" class="column-left">Tests Aplicados:</th>
                    <td width="350px" class="column-right">PHQ-2 - {{strtoupper($data->type)}}</td>
                </tr>
                <tr>
                    <th class="column-left">Puntuación Total:</th>
                    <td class="column-right">{{$data->score}}</td>
                </tr>
                <tr>
                    <th class="column-left">Severidad:
                        (Ver cuadro de interpretación
                        al final del reporte)
                    </th>
                    <td class="column-right">{{$data->priority->name}}</td>
                </tr>
            </table>
        </div>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-5    offset-1">
            <h4>- Desglose de resultados:</h4>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <h5>PHQ-2:</h5>
        </div>
    </div>

    {{--Table PHQ2--}}
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                @foreach($data->results as $result)
                    @if($result->question->type=='phq2')
                        <tr>
                            <td width="350px" class="column-left">{{$result->question->value}}</td>
                            <td width="200" class="column-right">{{$result->answer->value}}</td>
                        </tr>
                    @endif
                @endforeach
            </table>
        </div>
    </div>
    {{--Header--}}
    <div class="row">
        <div class="col-11 offset-1">
            <table>
                <tr>
                    <td>
                        <img src="{!! public_path('images/pdf/bot.png') !!}" width="200px" alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/esquel.jpg') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/oxigeno.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/usaid.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br>
    {{--Type Test--}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5>{{strtoupper($data->type)}}:</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                @foreach($data->results as $result)
                    @if($result->question->type!='phq2a')
                        <tr>
                            <td width="350px" class="column-left">{{$result->question->value}}</td>
                            <td width="200" class="column-right">{{$result->answer->value}}</td>
                        </tr>
                    @endif
                @endforeach
            </table>
        </div>
    </div>
    <br>
    {{--Header--}}
    <div class="row">
        <div class="col-11 offset-1">
            <table>
                <tr>
                    <td>
                        <img src="{!! public_path('images/pdf/bot.png') !!}" width="200px" alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/esquel.jpg') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/oxigeno.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                    <td>
                        <img src="{!! public_path('images/pdf/usaid.png') !!}" width="200px"
                             alt="Imagen PNG alternativa">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br>
    {{--Interpretation Range--}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5>- Rangos de interpretación:</h5>
        </div>
    </div>
    <br>
    @if($data->type=='phq9a')
        <div class="row">
            <div class="col-10 offset-1">
                <h5>PHQ-9A (Presencia de sintomatología depresiva)</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-10 offset-1">
                <table border="1">
                    <tr>
                        <th width="250px">Puntuación</th>
                        <th width="350px" class="column-right">Severidad {{$data->priority->level==0}}</th>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">0-4 puntos</th>
                        <td width="350px"
                            @class(['column-right','text-priority-1'=>$data->priority->level===4])>
                            No presenta sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">5-9 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===3])>
                            Baja intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">10-19 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===2])>
                            Media - moderada intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">20-27 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===1])>
                            Alta intensidad en sintomatología
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
    @endif
    @if($data->type=='psc17')
        <div class="row">
            <div class="col-10 offset-1">
                <h5>PSC - 17 (Presencia de sintomatología depresiva o ansiosa)</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-10 offset-1">
                <table border="1">
                    <tr>
                        <th width="250px">Puntuación</th>
                        <th width="350px" class="column-right">
                            Severidad
                        </th>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">0-13 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===4])>
                            No presenta sintomatología
                        </td>
                    </tr>
{{--                    <tr>--}}
{{--                        <th width="250px" class="column-left">14-21 puntos</th>--}}
{{--                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===3])>--}}
{{--                            Baja intensidad en sintomatología--}}
{{--                        </td>--}}
{{--                    </tr>--}}
                    <tr>
                        <th width="250px" class="column-left">14-21 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===2])>
                            Media - moderada intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th width="250px" class="column-left">22-34 puntos</th>
                        <td width="350px" @class(['column-right','text-priority-1'=>$data->priority->level===1])>
                            Alta intensidad en sintomatología
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
    @endif
    <div class="row">
        <div class="col-10 offset-1">
            <p style="text-align: justify">Le agradecemos su participación en el presente Chatbot. Recuerda que si
                cuentas con
                alguna problemática de salud mental o deseas contactarte con un psicólogo, puedes hacer
                uso de nuestros servicios de atención psicológica gratuita cuando lo desees. Un psicólogo o
                psicóloga se comunicará contigo en estos días. Recuerda que tu bienestar es una prioridad.</p>
            <br>
            <p style="text-align: justify">
                Para mayor información sobre los resultados, por favor ponerse en contacto con Psc. Samia
                García, al correo electrónico <b style="color: blue">sgarcia@esquel.org.ec</b>
            </p>
            <br>
            <p style="text-align: justify;color: blue">
                Programa desarrollado por el Área de Salud y Desarrollo y el Área de Tecnologías Cívicas
                de Fundación Esquel con el apoyo de USAID y el aval del Ministerio de Salud Pública
            </p>
        </div>
    </div>
@endsection
