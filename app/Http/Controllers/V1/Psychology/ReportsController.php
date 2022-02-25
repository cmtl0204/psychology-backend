<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Psychology\TestResource;
use App\Models\Psychology\Test;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ReportsController extends Controller
{
    public function resultsTest(Test $test)
    {
        $data = new TestResource($test);
//        return $data;

        $pdf = \PDF::loadView('reports.test.results', ['data' => $data]);
        return $pdf->stream('resultado-' . $data->username . '.pdf');
    }
}
