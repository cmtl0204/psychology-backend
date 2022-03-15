<?php

namespace App\Mail\Psychology;

use App\Models\Authentication\System;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TestResultsHighIntensityMailable extends Mailable
{
    use Queueable, SerializesModels;

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
        if (!is_null($this->pathAttaches)) {
            foreach ($this->pathAttaches as $pathAttach) {
                $this->attachFromStorage('public/temp_files/' . $pathAttach);
            }
        }

        return $this->view('mails.psychology.test-high-intensity-results')
            ->with(['data' => json_decode($this->data), 'system' => $this->system]);
    }
}
