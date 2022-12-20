@extends('mails.index')
@section('content')
    <div class="row">
        <div class="col-12 text-muted" style="text-align: justify">
            Estimado {{$data->user->name}}
        </div>
    </div>
@endsection
