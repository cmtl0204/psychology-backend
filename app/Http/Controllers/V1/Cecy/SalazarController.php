<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\Cecy\ProfileInstructorCourses\ProfileInstructorCourseCollection;
use App\Http\Resources\V1\Cecy\ProfileInstructorCourses\ProfileInstructorCourseResource;
use Illuminate\Http\Request;
use App\Models\Cecy\ProfileInstructorCourse;
use App\Models\Cecy\Course;    


class SalazarController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:show')->only(['show']);
    }

      public function showCurricularDesign()
      {
        // trae la informacion de diseño curricular 
      }

      public function showAttendenceEvaluationRecord()
      {
         // trae la informacion de registro asistencia-evaluacion
      }
  
      public function showFinalCourseReport()
      {
       // trae la informacion del informe final del curso   
      }

  
    }