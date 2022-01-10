<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\AdditionalInformation;
use Illuminate\Http\Request;

class AdditionalInformationController extends Controller
{
    public function index(IndexAdditionalInformationRequest $request)
    {

        $sorts = explode(',', $request->sort);

        $additionalInformations = AdditionalInformation::customOrderBy($sorts)
            ->companyActivity($request->input('company_activity'))
            ->companyAddress($request->input('company_address'))
            ->companyEmail($request->input('company_email'))
            ->companyName($request->input('company_name'))
            ->companyPhone($request->input('company_phone'))
            ->contactName($request->input('contactName'))
            ->levelInstruction($request->input('levelInstruction'))
            ->paginate($request->per_page);

        return (new AdditionalInformationCollection($additionalInformations))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAdditionalInformationRequest $request)
    {
        $additionalInformation = new AdditionalInformation();

        $additionalInformation->company_activity = $request->input('companyActivity');
        $additionalInformation->company_address = $request->input('companyAddress');
        $additionalInformation->company_email = $request->input('companyEmail');
        $additionalInformation->company_name = $request->input('companyName');
        $additionalInformation->company_phone = $request->input('companyPhone');
        $additionalInformation->company_sponsor = $request->input('companySponsor');
        $additionalInformation->contact_name = $request->input('contactName');
        $additionalInformation->level_instruction = $request->input('levelInstruction');
        $additionalInformation->course_know = $request->input('courseKnow');
        $additionalInformation->course_follow = $request->input('courseFollow');
        $additionalInformation->worked = $request->input('worked');

        $additionalInformation->save();

        return (new AdditionalInformationResource($additionalInformation))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Creado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(AdditionalInformation $additionalInformation)
    {
        return (new AdditionalInformationResource($additionalInformation))
            ->additional([
                'msg' => [
                    'summary' => 'success',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAdditionalInformationRequest $request, AdditionalInformation $additionalInformation)
    {
        //db
        $additionalInformation->company_activity = $request->input('companyActivity');
        $additionalInformation->company_address = $request->input('companyAddress');
        $additionalInformation->company_email = $request->input('companyEmail');
        $additionalInformation->company_name = $request->input('companyName');
        $additionalInformation->company_phone = $request->input('companyPhone');
        $additionalInformation->company_sponsor = $request->input('companySponsor');
        $additionalInformation->contact_name = $request->input('contactName');
        $additionalInformation->level_instruction = $request->input('levelInstruction');
        $additionalInformation->course_know = $request->input('courseKnow');
        $additionalInformation->course_follow = $request->input('courseFollow');
        $additionalInformation->worked = $request->input('worked');

        $additionalInformation->save();

        return (new AdditionalInformationResource($additionalInformation))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Actualizado',
                    'detail' => '',
                    'code' => '200'
                ]
            ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(AdditionalInformation $additionalInformation)
    {
        $additionalInformation->delete();
        return (new AdditionalInformationResource($additionalInformation))
            ->additional([
                'msg' => [
                    'summary' => 'Registro Eliminado',
                    'detail' => '',
                    'code' => '201'
                ]
            ]);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroys(DestroysAdditionalInformationRequest $request)
    {
        $additionalInformations = Application::whereIn('id', $request->input('ids'))->get();
        AdditionalInformation::destroy($request->input('ids'));

        return (new AdditionalInformationCollection($additionalInformations))
            ->additional([
                'msg' => [
                    'summary' => 'Registros Eliminados',
                    'detail' => '',
                    'code' => '201'
                ]
            ]);
    }
}
