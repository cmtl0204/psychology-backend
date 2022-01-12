<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Participant;
use Illuminate\Http\Request;


class ParticipantController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-catalogues')->only(['store']);
        $this->middleware('permission:update-catalogues')->only(['update']);
        $this->middleware('permission:delete-catalogues')->only(['destroy', 'destroys']);
    }
    /*DDRC-C: Busca participantes de cursos por periodo */
    public function getCoursesByPeriod()
    {
    }
/*DDRC-C: busca participantes de un curso especifico*/
    public function getCourseParticipants()
    {
       
    }
    /*DDRC-C: busca informacion adicional de un participante  */

    
    public function getParticipantInfo()
    {
        
    }
/*DDRC-C: actualiza la informacion de una inscripcion de un participante a un curso especifico  */
    public function updateParticpantRegistration()
    {
       
    }

/*DDRC-C: notifica a un participante de una observacion en su inscripcion*/
    public function notifyParticipant()
    {
      
    }
/*DDRC-C: elimina una matricula de un participante en un curso especifico */
    public function nullifyRegistration()
    {
    }
}
