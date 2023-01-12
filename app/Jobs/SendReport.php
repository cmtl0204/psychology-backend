<?php

namespace App\Jobs;

use App\Exports\TestsMultiSheetExport;
use App\Mail\Psychology\TestResultsExcelMailable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Excel;

class SendReport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    protected $dates;
    protected $auth;

    public function __construct($dates, $auth)
    {
        $this->dates = $dates;
        $this->auth = $auth;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
//        \Excel::store(new TestsMultiSheetExport($this->dates), 'reporte_tests.xlsx', 'private');
        (new TestsMultiSheetExport($this->dates))->store('tests.xlsx');
//        \Excel::store((new TestsMultiSheetExport($this->dates))->('reporte_tests.xlsx'), 'private');
//        $a = new TestsMultiSheetExport($this->dates);
        $email = new TestResultsExcelMailable(json_encode(['user' => $this->auth]));

        Mail::to($this->auth->email)->send($email);
    }
}
