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

        $sheets[] = new TestsExport('phq9a', $this->dates[0], $this->dates[1]);
        $sheets[] = new TestsExport('psc17', $this->dates[0], $this->dates[1]);
        return $sheets;
    }
}
