<?php

namespace App\Exports;

use App\Http\Resources\V1\Psychology\TestCollection;
use App\Models\Psychology\Question;
use App\Models\Psychology\Test;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Events\AfterSheet;

class TestsExport implements FromCollection, ShouldAutoSize, WithMapping, WithHeadings, WithEvents, WithTitle
{
    private $testType;
    private $startDate;
    private $endDate;

    public function __construct($testType, $startDate, $endDate)
    {
        $this->testType = $testType;
        $this->startDate = $startDate;
        $this->endDate = $endDate;
    }

    public function collection()
    {
        return new TestCollection(Test::whereBetween('created_at', $this->startDate, $this->endDate)->where('type', $this->testType)
            ->orWhere('type', 'duel')
            ->orWhere('type', 'phq2')
            ->get());
    }

    public function map($row): array
    {
        $rows = [
            $row->code,
            $row->user ? $row->user->name : '',
            $row->province ? $row->province->name : '',
            $row->canton ? $row->canton->name : '',
            $row->assignment ? $row->assignment->institution->name : '',
            $row->priority ? $row->priority->name : '',
            $row->score,
            $row->state ? $row->state->name : '',
            $row->created_at
        ];
        $resultsRows = [];
        foreach ($row->results as $result) {
            $resultsRows[] = $result->answer->value;
        }
        return array_merge($rows, $resultsRows);
    }

    public function headings(): array
    {
        $questions = Question::select('value')
            ->where('type', $this->testType)
            ->orWhere('type', 'duel')
            ->orWhere('type', 'phq2')
            ->get()->pluck('value')->toArray();

        $headers = [
            'Test',
            'Usuario',
            'Provincia',
            'Cantón',
            'Institución',
            'Prioridad',
            'Puntaje',
            'Estado',
            'Fecha'
        ];

        return array_merge($headers, $questions);
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getStyle('A1:AC1')->applyFromArray([
                    'font' => [
                        'bold' => true
                    ]
                ]);
            }
        ];
    }

    public function title(): string
    {
        return $this->testType == 'phq9a' ? 'PHQ-9A' : 'PSC-17';
    }

}
