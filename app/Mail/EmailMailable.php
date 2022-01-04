<?php

namespace App\Mail;

use App\Models\Authentication\System;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EmailMailable extends Mailable
{
    use Queueable, SerializesModels;

    public $subject;
    private $data;
    private $pathAttaches;

    public function __construct($subject, $data, $pathAttaches = null)
    {
        $this->subject = $subject;
        $this->data = $data;
        $this->pathAttaches = $pathAttaches;
    }

    public function build()
    {
        $catalogues = json_decode(file_get_contents(storage_path() . "/catalogues.json"), true);
        $system = System::firstWhere('code', $catalogues['system']['code']);

        if (!is_null($this->pathAttaches)) {
            foreach ($this->pathAttaches as $pathAttach) {
                $this->attachFromStorage('public/'.$pathAttach);
            }
        }

        return $this->view('mails.blank')
            ->from($this->data->from,$this->data->from_name)
            ->with(['data' => $this->data, 'system' => $system]);
    }
}
