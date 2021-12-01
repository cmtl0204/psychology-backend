<?php

namespace App\Traits;

use App\Models\Core\Email;

trait EmailTrait
{
    public function addEmails($emails)
    {
        if ($emails) {
            foreach ($emails as $email) {
//                $newEmail = $email['id'] ? $this->emails()->find($email['id']) : new Email();
                $newEmail = new Email();
                $newEmail->emailable()->associate($this);
                $newEmail->email = $email['email'];
                $newEmail->save();
            }
        }
    }

    public function hiddenStringEmail($email, $start = 3)
    {
        $end = strlen($email) - strpos($email, "@");
        $len = strlen($email);
        return substr($email, 0, $start) . str_repeat('*', $len - ($start + $end)) . substr($email, $len - $end, $end);
    }
}
