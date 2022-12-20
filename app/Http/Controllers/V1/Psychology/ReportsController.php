<?php

namespace App\Http\Controllers\V1\Psychology;

use App\Exports\TestsMultiSheetExport;
use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Psychology\TestResource;
use App\Jobs\SendReport;
use App\Models\Psychology\Test;
use Illuminate\Http\Request;
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
//        $tests = Test::get();
//        return new TestCollection($tests);
//        return $this->excel->download(new TestsMultiSheetExport($request->input('dates')), now() . '-tests.xlsx');

//        return \Excel::download(new TestsMultiSheetExport($request->input('dates')), now() . '-tests.xlsx');
//        Mail::to('cesar.tamayo0204@gmail.com');
//        SendReport::dispatch($request->input('dates'),$request->user());
        return response()->json([
            'data' => true,
            'msg' => [
                'summary' => 'El reporte fue enviad a su correo electrónico',
                'detail' => 'Revise su correo por favor',
                'code' => '201'
            ]], 200);
//        return $this->excel->download((new TestsMultiSheetExport)->queue('test.xlsx'), now() . '-tests.xlsx');
    }
}
