<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class TestsMultiSheetExport implements WithMultipleSheets
{
    private $dates;

    public function __construct($dates)
    {
        $this->dates = $dates;
    }

    public function sheets(): array
    {
        $sheets = [];

        $sheets[] = new TestsExport('phq9a', $this->dates);
        $sheets[] = new TestsExport('psc17', $this->dates);
        $sheets[] = new TestsExport('phq9', $this->dates);
        $sheets[] = new TestsExport('srq18', $this->dates);
        return $sheets;
    }
}
