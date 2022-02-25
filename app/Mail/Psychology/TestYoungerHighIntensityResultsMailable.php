<?php

namespace App\Mail\Psychology;

use App\Models\Authentication\System;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TestYoungerHighIntensityResultsMailable extends Mailable
{
    use Queueable, SerializesModels;

    public $subject;
    private $data;
    private $pathAttaches;
    private $system;

    public function __construct($subject, $data, $pathAttaches = null, $system = null)
    {
        $this->subject = $subject;
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

        return $this->view('mails.psychology.test-younger-high-intensity-results')
            ->with(['data' => json_decode($this->data), 'system' => $this->system]);
    }
}
