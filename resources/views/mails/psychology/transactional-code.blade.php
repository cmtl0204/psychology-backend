@extends('mails.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted">
            <p>
                Estimado/a representante legal del participante de TEMI, te escucha,
            </p>
            <p>
                Gracias por participar en este servicio de salud mental. En vista a que su representado legal es menor
                de edad necesitamos confirmar que contamos con su consentimiento informado para que su representado
                legal participe de este servicio.
            </p>
            <p>
                Al ingresar el siguiente código de verificación, <b>usted confirma que acepta libre y voluntariamente que
                su representado participe del servicio de tamizaje de salud mental.</b> También entiende que este
                procedimiento permite cuidar de los derechos de su representado/a, que su representado/a posterior al
                llenado de este servicio de tamizaje cuenta con la posibilidad de acceder a servicios de atención
                psicológica gratuitos previo consentimiento del representante legal, y que su representado puede
                retirarse del proceso iniciado cuando lo desee, sin ningún prejuicio para su persona.
            </p>
            <h3 class="text-center">El código de verificación es: <b>{{$data->token}}</b></h3>
            <br>
            <br>
            <p>Este código de seguridad tiene tiempo de duración de
                <b>{{\App\Models\Authentication\User::DECAY_MINUTES_TRANSACTIONAL_CODE}} min.</b>
                y es válido por
                <b>una sola ocasión</b>.
            </p>
            <br>
            <p>Si no ha solicitado este servicio, repórtelo a su Institución.</p>
        </div>
    </div>
@endsection
