<?php

namespace App\Http\Requests\V1\Cecy\SchoolPeriods;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\V1\JobBoard\JobBoardFormRequest;

class IndexSchoolPeriodsRequest extends FormRequest
{
    public function authorize()
  {
    return true;
  }
  public function rules()
  {
    return [];
  }

  public function attributes()
  {
    return [];
  }
}
