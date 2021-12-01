<?php

namespace App\Models\Authentication;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as Auditing;

/**
 * @property BigInteger id
 * @property boolean is_valid
 * @property string token
 * @property string username
 */
class TransactionalCode extends Model implements Auditable
{
    use HasFactory;
    use Auditing;

    protected $table = 'authentication.transactional_codes';

    protected $fillable = [
        'username',
        'used',
        'token'
    ];
}
