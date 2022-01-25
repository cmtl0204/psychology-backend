<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Auditable as Auditing;

class RegistrationRequirement extends Model
{
    use HasFactory;
    use Auditing;
    use SoftDeletes;

    protected $table = 'cecy.registration_requirements';

    protected $fillable = [
        'url',
    ];

    // Relationships
    public function registration()
    {
        return $this->belongsTo(Registration::class);
    }
    public function requirement()
    {
        return $this->belongsTo(Requirement::class);
    }
}
