<table>
    <thead>
    <tr>
        <th>Test</th>
        <th>Usuario</th>
        <th>Provincia</th>
        <th>Cantón</th>
        <th>Institución</th>
        <th>Prioridad</th>
        <th>Puntaje</th>
        <th>Estado</th>
        <th>Fecha</th>
        <th>Pregunta 1</th>
        <th>Pregunta 2</th>
        <th>Pregunta 3</th>
        <th>Pregunta 4</th>
        <th>Pregunta 5</th>
        <th>Pregunta 6</th>
        <th>Pregunta 7</th>
        <th>Pregunta 8</th>
        <th>Pregunta 9</th>
        <th>Pregunta 10</th>
        <th>Pregunta 11</th>
        <th>Pregunta 12</th>
    </tr>
    </thead>
    <tbody>
    @foreach($testsPhq9a as $test)
        <tr>
            <td>{{$test->code}}</td>
            <td>{{$test->user?$test->user->lastname.' '.$test->user->name:''}}</td>
            <td>{{$test->province->name}}</td>
            <td>{{$test->canton->name}}</td>
            <td>{{$test->assignment?$test->assignment->institution->name:''}}</td>
            <td>{{$test->priority->name}}</td>
            <td>{{$test->state->name}}</td>
            <td>{{$test->score}}</td>
            <td>{{$test->created_at}}</td>
            @foreach($test->results as $result)
                <td>{{$result->answer->value}}</td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>Test</th>
        <th>Usuario</th>
        <th>Provincia</th>
        <th>Cantón</th>
        <th>Institución</th>
        <th>Prioridad</th>
        <th>Puntaje</th>
        <th>Estado</th>
        <th>Fecha</th>
        <th>Pregunta 1</th>
        <th>Pregunta 2</th>
        <th>Pregunta 3</th>
        <th>Pregunta 4</th>
        <th>Pregunta 5</th>
        <th>Pregunta 6</th>
        <th>Pregunta 7</th>
        <th>Pregunta 8</th>
        <th>Pregunta 9</th>
        <th>Pregunta 10</th>
        <th>Pregunta 11</th>
        <th>Pregunta 12</th>
        <th>Pregunta 13</th>
        <th>Pregunta 14</th>
        <th>Pregunta 15</th>
        <th>Pregunta 16</th>
        <th>Pregunta 17</th>
        <th>Pregunta 18</th>
        <th>Pregunta 19</th>
        <th>Pregunta 20</th>
    </tr>
    </thead>
    <tbody>
    @foreach($testsPsc17 as $test)
        <tr>
            <td>{{$test->code}}</td>
            <td>{{$test->user?$test->user->lastname.' '.$test->user->name:''}}</td>
            <td>{{$test->province->name}}</td>
            <td>{{$test->canton->name}}</td>
            <td>{{$test->assignment?$test->assignment->institution->name:''}}</td>
            <td>{{$test->priority->name}}</td>
            <td>{{$test->state->name}}</td>
            <td>{{$test->score}}</td>
            <td>{{$test->created_at}}</td>
            @foreach($test->results as $result)
                <td>{{$result->answer->value}}</td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>
