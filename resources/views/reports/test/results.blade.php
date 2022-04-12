@extends('reports.index')

@section('content')
    <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner">

    <div class="row">
        <div class="col-12">
            <br>
            <h4 class="text-center items">Reporte de resultados de tamizaje de Chatbot: TEMI, te escucha</h4>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">1. Sobre TEMI, te escucha:</h5>
            <p style="text-align: justify">TEMI, te escucha es un servicio de tamizaje gratuito en salud mental
                facilitado a través de una página
                web que permite levantar indicadores sobre el estado de salud mental del usuario participante. El
                servicio es parte del programa de salud mental del proyecto
                <span style="font-style: oblique">“Oxígeno para Salvar Vidas”</span>
                implementado por
                Fundación Esquel con el apoyo de USAID para dar respuesta a las necesidades de salud mental causadas por
                la pandemia por COVID-19 en población adolescente del país.</p>
            <p style="text-align: justify">
                El servicio de tamizaje es un <b>dispositivo de prevención secundaria</b>, es decir que a través de la
                aplicación y llenado del participante de herramientas de identificación de indicadores sobre su estado
                de ánimo, se busca prevenir la presencia de posibles problemáticas de salud mental. <b>La información
                    detallada en el presente reporte busca informarle a usted y al usuario participante sobre su estado
                    de
                    salud mental en las últimas dos semanas de manera exploratoria. El presente reporte no refleja de
                    ninguna manera un diagnóstico definitivo.</b>
            </p>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">2. Datos informativos:</h5>
            <table border="1">
                <tr>
                    <th width="300px" class="column-left">Número de Chatbot:</th>
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
            <h5 class="items">3. Resultados:</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-10 offset-1">
            <table border="1">
                <tr>
                    <th width="300px" class="column-left">Tests Aplicados:</th>
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
    <hr>
    {{--Header--}}
    <div class="row">
        <div class="col-12">
            <table>
                <tr>
                    <td>
                        <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-5 offset-1">
            <h5 class="items">4. Desglose de resultados:</h5>
        </div>
    </div>
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
                            <td width="400px" class="column-left">{{$result->question->value}}</td>
                            <td width="250px" class="column-right">{{$result->answer->value}}</td>
                        </tr>
                    @endif
                @endforeach
            </table>
        </div>
    </div>
    {{--Type Test--}}
    <br>
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
                            <td width="400px" class="column-left">{{$result->question->value}}</td>
                            <td width="250px" class="column-right">{{$result->answer->value}}</td>
                        </tr>
                    @endif
                @endforeach
            </table>
        </div>
    </div>
    <hr>
    {{--Header--}}
    <div class="row">
        <div class="col-12">
            <table>
                <tr>
                    <td>
                        <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    {{--Interpretation Range--}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">5. Rangos de interpretación:</h5>
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
                        <th width="400px" class="column-right">Severidad {{$data->priority->level==0}}</th>
                    </tr>
                    <tr>
                        <th class="column-left text-center">0-4 puntos</th>
                        <td
                            @class(['column-right','text-priority-1'=>$data->priority->level===4])>
                            No presenta sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">5-9 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===3])>
                            Baja intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">10-19 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===2])>
                            Media - moderada intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">20-27 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===1])>
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
                        <th width="400px" class="column-right">
                            Severidad
                        </th>
                    </tr>
                    <tr>
                        <th class="column-left text-center">0-13 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===4])>
                            No presenta sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">14-21 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===2])>
                            Media - moderada intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">22-34 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===1])>
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
            <p style="text-align: justify">Le agradecemos su participación en TEMI, te escucha. Recuerda que si
                presentas sintomatología depresiva o ansiosa según este reporte exploratorio puedes hacer uso de
                nuestros servicios de atención psicológica gratuitos cuando lo desees. Un psicólogo o psicóloga se
                comunicará contigo en los próximos días en un rango de 72 horas. Recuerda que tu bienestar es una
                prioridad.</p>
            <br>
            <p style="text-align: justify">
                Para mayor información sobre los resultados, por favor ponerse en contacto con Psc. Samia García, al
                correo electrónico <b style="color: blue">sgarcia@esquel.org.ec</b>
            </p>
            <br>
            <p style="text-align: right;color: #085EB9;font-style: oblique">
                Programa desarrollado por el Área de Salud y Desarrollo y el Área de Tecnologías Cívicas de Fundación
                Esquel con el apoyo de USAID y la autorización del Ministerio de Salud Pública
            </p>
        </div>
    </div>
@endsection
