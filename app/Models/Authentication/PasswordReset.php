<?php

namespace App\Models\Authentication;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;

/**
 * @property BigInteger id
 * @property string username
 * @property boolean is_valid
 * @property string token
 */

class PasswordReset extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'authentication.password_resets';

    protected $fillable = [
        'username',
        'token',
        'used'
    ];
}

