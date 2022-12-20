<?php

namespace App\Mail\Psychology;

use App\Models\Authentication\System;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;

class TestResultsExcelMailable extends Mailable implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $subject;
    private $data;
    private $pathAttaches;
    private $system;

    public function __construct($data, $pathAttaches = null, $system = null)
    {
        $this->subject = 'Gracias por participar | TEMI, te escucha';
        $this->data = $data;
        $this->pathAttaches = $pathAttaches;
        $this->system = System::find(1);
    }

    public function build()
    {
        if (Storage::exists('reporte_tests.xlsx')) {
            $this->attachData(Storage::disk('private')->get('reporte_tests.xlsx'), 'reporte_tests.xlsx');
        }

        return $this->view('mails.psychology.test-results-excel')
            ->with(['system' => $this->system, 'data' => json_decode($this->data)]);
    }
}
