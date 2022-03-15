<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Exports\TestsExport;
use App\Exports\TestsMultiSheetExport;
use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Psychology\TestCollection;
use App\Http\Resources\V1\Psychology\TestResource;
use App\Models\Psychology\Test;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Maatwebsite\Excel\Excel;

class ReportsController extends Controller
{
    private $excel;

    public function __construct(Excel $excel)
    {
        $this->excel = $excel;
    }

    public function resultsTest(Test $test)
    {
        $data = new TestResource($test);
//        return $data;

        $pdf = \PDF::loadView('reports.test.results', ['data' => $data]);
        return $pdf->stream('resultado-' . $data->username . '.pdf');
    }

    public function resultsTests(Request $request)
    {
        $tests = Test::get();
//        return new TestCollection($tests);
        return $this->excel->download(new TestsMultiSheetExport(), now() . '-tests.xlsx');

    }
}
