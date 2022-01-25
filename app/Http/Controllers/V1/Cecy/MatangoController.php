<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Courses\getCoursesByResponsibleRequest;
use App\Http\Requests\V1\Cecy\Courses\UpdateCourseGeneralDataRequest;
use App\Http\Resources\V1\Cecy\Courses\CourseCollection;
use App\Models\Cecy\Catalogue;
use App\Http\Resources\V1\Cecy\Planifications\CoursesByResponsibleResource;
use App\Http\Resources\V1\Cecy\Prerequisites\CoursesByResponsibleCollection;
use App\Http\Resources\V1\Core\CareerCollection;
use App\Models\Cecy\Course;
use App\Models\Core\Career;
use App\Models\Core\Image;

class MatangoController extends Controller
{
    public function __construct()
    {

    }

    //obtener los cursos asignados a un docente logueado
    public function getCoursesByResponsibleCourse(getCoursesByResponsibleRequest $request)
    {
        $courses = Course::where([
            ['responsible_id', $request->input('responsible.id')]
        ]);

        return (new CoursesByResponsibleCollection($courses))
            ->additional([
                'msg' => [
                    'summary' => 'Consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }


   //obtener todas las carreras
    public function getCarrers(Career $careers)
    {
        return (new CareerCollection($careers))
            ->additional([
                'msg' => [
                    'summary' => 'Consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    //trae toda la info de un curso seleccionado

    public function show(Course $course)
    {
        $course = Course::find($course);

        return (new CourseCollection($course))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }


    //actualiza datos generales de un curso seleccionado
    
    public function updateGeneralData(UpdateCourseGeneralDataRequest $request, Course $course)
    {
        $course->carrerId()->associate(Career::find($request->input('carrer.id')));
        $course->category()->associate(Catalogue::find($request->input('category.id')));
        $course->certifiedTypeId()->associate(Catalogue::find($request->input('certifiedType.id')));
        $course->courseTypeId()->associate(Catalogue::find($request->input('courseType.id')));
        $course->modalityId()->associate(Catalogue::find($request->input('modality.id')));
        $course->specialityId()->associate(Catalogue::find($request->input('speciality.id')));
        $course->abbreviation = $request->input('abbreviation');
        $course->duration = $request->input('duration');
        $course->needs = $request->input('needs');
        $course->project = $request->input('project');
        $course->sumary = $request->input('sumary');
        $course->save();

        return (new CoursesByResponsibleResource($course))
        ->additional([
            'msg' => [
                'summary' => 'success',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }

    public function showImage(Course $course, Image $image)
    {
        return $course->showImage($image);
    }
}
