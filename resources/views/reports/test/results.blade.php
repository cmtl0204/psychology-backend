@extends('reports.index')

@section('content')
    <div class="text-right">
        <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner" width="150px" height="50px">
    </div>
    <div class="row">
        <div class="col-12">
            <br>
            <h4 class="text-center items">Reporte de resultados de tamizaje de Chatbot: TEMI, te escucha</h4>
        </div>
    </div>
    <br>
    {{-- 1. --}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">1. Sobre TEMI, te escucha:</h5>
            <p style="text-align: justify"><b>TEMI, te escucha</b> es un servicio de tamizaje gratuito en salud mental
                facilitado a través de una página web que permite levantar indicadores sobre el estado de salud mental
                del usuario participante. El servicio es parte del componente de salud mental del área de Salud y
                Desarrollo de Fundación Esquel como una respuesta a las necesidades de salud mental en población
                adolescente y adulta del país.
            </p>
            <p style="text-align: justify">
                El servicio de tamizaje es un <b>dispositivo de prevención secundaria</b>, es decir que a través de la
                aplicación y llenado del participante de herramientas de identificación de indicadores sobre su estado
                de ánimo, se busca <b>prevenir</b> la presencia y cronificación de posibles problemáticas de salud
                mental.
            </p>
            <p style="text-align: justify">
                <b>
                    La información detallada en el presente reporte busca informarle a usted y al usuario participante
                    sobre su estado de salud mental en las últimas dos semanas de manera exploratoria. El presente
                    reporte no refleja de ninguna manera un diagnóstico definitivo.
                </b>
            </p>
        </div>
    </div>
    <br>

    {{-- 2. --}}
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

    {{-- 3. --}}
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
    <div class="text-right">
        <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner" width="150px" height="50px">
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
    <div class="text-right">
        <img src="{!! public_path('images/pdf/banner.png') !!}" alt="Imagen banner" width="150px" height="50px">
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
    @if($data->type=='phq9')
        <div class="row">
            <div class="col-10 offset-1">
                <h5>PHQ - 9A (Presencia de sintomatología depresiva)</h5>
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
    @if($data->type=='srq18')
        <div class="row">
            <div class="col-10 offset-1">
                <h5>SRQ - 18 (Presencia de sintomatología depresiva o ansiosa)</h5>
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
                        <th class="column-left text-center">0-4 puntos</th>
                        <td
                            @class(['column-right','text-priority-1'=>$data->priority->level===4])>
                            No presenta sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">5-7 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===3])>
                            Baja intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">8-11 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===2])>
                            Media - moderada intensidad en sintomatología
                        </td>
                    </tr>
                    <tr>
                        <th class="column-left text-center">12-13 puntos</th>
                        <td @class(['column-right','text-priority-1'=>$data->priority->level===1])>
                            Alta intensidad en sintomatología
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
    @endif

    {{-- 6. --}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">6. Atenciones psicológicas:</h5>
            <p style="text-align: justify">El servicio cuenta con un primer momento de identificación y tamizaje de
                necesidades de salud mental en las áreas de depresión y ansiedad, a través de la aplicación de los
                instrumentos PHQ-2, PHQ-9 y SRQ-18 mediante el Chatbot. En función de los resultados, se asigna la
                atención psicológica gratuita en las estrategias de intervención de: <b>Primeros Auxilios Psicológicos o
                    Contención Emocional que van de 1 a 7 sesiones</b>, previo a las autorización del participante y en
                el caso
                de menores de edad, previa la autorización de los representantes legales y la firma del consentimiento
                informado correspondiente.
            </p>
            <p style="text-align: justify">
                En caso de ser parte del servicio de atención psicológica, el presente apartado incluye el número de
                sesiones en que el participante ha asistido.
            </p>
            <p style="text-align: justify">
                En este sentido, a través del presente se corrobora que el <b>paciente referido ha asistido a un total
                    de {{$sessions}} sesiones de atención psicológica
                    según la estrategia de intervención asignada.</b>
            </p>
        </div>
    </div>
    <br>

    {{-- 7. --}}
    <div class="row">
        <div class="col-10 offset-1">
            <h5 class="items">7. Acciones:</h5>
            <p style="text-align: justify">Se ha extendido el presente reporte de tamizaje y atención psicológica por
                solicitud propia del participante para que pueda hacer uso del mismo según desee bajo su responsabilidad
                personal.
            </p>
            <p style="text-align: justify">
                Para mayor información sobre los resultados, por favor ponerse en contacto el Fundación Esquel a través
                del siguiente correo electrónico: <a>fundacion@esquel.org.ec</a>
            </p>
            <p style="text-align: right; color: #085EB9">
                Servicio desarrollado por el Área de Salud y Desarrollo y el Área de Tecnologías Cívicas de Fundación
                Esquel con la autorización del Ministerio de Salud Pública
            </p>
        </div>
    </div>
    <br>
@endsection
