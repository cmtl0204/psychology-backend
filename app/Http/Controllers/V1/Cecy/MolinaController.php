<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Cecy\Attendance\GetAttendanceByParticipantRequest;
use App\Http\Requests\V1\Cecy\Attendance\SaveDetailAttendanceRequest;
use App\Http\Requests\V1\Cecy\Certificates\DowloadCertificateByParticipantRequest;
use App\Http\Requests\V1\Cecy\Participants\GetCoursesByParticipantRequest;
use App\Http\Requests\V1\Cecy\Registrations\ShowGradesByParticipantRequest;
use App\Http\Resources\V1\Cecy\Attendances\GetAttendanceByParticipantCollection;
use App\Http\Resources\V1\Cecy\Attendances\SaveDetailAttendanceResource;
use App\Http\Resources\V1\Cecy\DetailAttendances\DetailAttendanceResource;
use App\Http\Resources\V1\Cecy\Participants\CoursesByParticipantCollection;
use App\Http\Resources\V1\Cecy\Registrations\ShowGradeByParticipantCollection;
use App\Models\Cecy\Attendance;
use App\Models\Cecy\Participant;
use App\Models\Cecy\Registration;
use Illuminate\Http\Client\Request;

class MolinaController extends Controller
{
   /*public function __construct()
    {
        $this->middleware('permission:view-courses')->only(['view']);
        $this->middleware('permission:view-attendances')->only(['view']);
        $this->middleware('permission:view-grades')->only(['view']);
    }*/

    //Ver todas las asistencias del estudiante
    public function getAttendacesByParticipant(GetAttendanceByParticipantRequest $request)
    {
        $participant = Participant::where('user_id', $request->user()->id)->get();
        $registrations = $participant->registrations();
        $detailAttendances = $registrations->detailAttendances();
        $registrations = $detailAttendances->registrations();
        $attendances = $detailAttendances->attendance();

        return (new GetAttendanceByParticipantCollection($attendances))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //Ver todos los cursos del estudiante en el cual esta matriculado
    public function getCoursesByParticipant(GetCoursesByParticipantRequest $request)
    {
        $participant = Participant::where('user_id', $request->user()->id)->get();
        $registrations = $participant->registrations();
        $detailPlanifications = $registrations->detailPlanification();
        $planifications = $detailPlanifications->planification();
        $courses = $planifications->course();

        return (new CoursesByParticipantCollection($courses))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //Ver las notas del estudiante en curso que se encuentra
    public function showGradesByParticipant(ShowGradesByParticipantRequest $request)
    {
        $participant = Participant::where('user_id', $request->user()->id)->get();
        $registrations = $participant->registrations();
        $registrations = $registrations->registrations();
        $grades = $registrations->grade();

        return (new ShowGradeByParticipantCollection($grades))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
    //Descargar certificado del curso
    public function dowloadCertificateByParticipant(DowloadCertificateByParticipantRequest $request)
    {
        $participant = Participant::where('user_id', $request->user()->id)->get();
        $registrations = $participant->registrations();
        $certificates=  $registrations->state();
        $certificates = $registrations->certificate();


        return (new DetailAttendanceResource ($certificates))
        ->additional([
            'msg' => [
                'sumary' => 'consulta exitosa',
                'detail' => '',
                'code' => '200'
            ]
        ]);
    }
    // Guardar asistencia
    public function saveDetailAttendances(SaveDetailAttendanceRequest $request)
    {
        $attendance = Attendance::find($request->input('attendance.id'));
        $registration = Registration::find($request->input('registration.id'));
        $attendance->registration()->attach($registration);

        return (new SaveDetailAttendanceResource($attendance))
            ->additional([
                'msg' => [
                    'sumary' => 'consulta exitosa',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }
}
