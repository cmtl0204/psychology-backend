<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class TestsMultiSheetExport implements WithMultipleSheets
{
    public function sheets(): array
    {
        $sheets = [];

        $sheets[] = new TestsExport('phq9a');
        $sheets[] = new TestsExport('psc17');
        return $sheets;
    }
}
