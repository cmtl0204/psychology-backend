<?php

namespace App\Models\Authentication;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
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
    use SoftDeletes;

    protected $table = 'authentication.password_resets';

    protected $fillable = [
        'username',
        'token',
        'used'
    ];
}

