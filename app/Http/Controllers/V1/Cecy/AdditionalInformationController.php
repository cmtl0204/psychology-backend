<?php

namespace App\Http\Controllers\V1\Cecy;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\Core\Files\DestroysFileRequest;
use App\Http\Requests\V1\Core\Files\IndexFileRequest;
use App\Http\Requests\V1\Core\Files\UpdateFileRequest;
use App\Http\Requests\V1\Core\Files\UploadFileRequest;
use App\Models\Cecy\AdditionalInformation;
use App\Models\Core\File;
use Illuminate\Http\Request;

class AdditionalInformationController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:store-additionalInformations')->only(['store']);
        $this->middleware('permission:update-additionalInformations')->only(['update']);
        $this->middleware('permission:delete-additionalInformations')->only(['destroy', 'destroys']);
    }

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

    // Files
    public function indexFiles(IndexFileRequest $request, AdditionalInformation $additionalInformation)
    {
        return $additionalInformation->indexFiles($request);
    }

    public function uploadFile(UploadFileRequest $request, AdditionalInformation $additionalInformation)
    {
        return $additionalInformation->uploadFile($request);
    }

    public function downloadFile(AdditionalInformation $additionalInformation, File $file)
    {
        return $additionalInformation->downloadFile($file);
    }

    public function showFile(AdditionalInformation $additionalInformation, File $file)
    {
        return $additionalInformation->showFile($file);
    }

    public function updateFile(UpdateFileRequest $request, AdditionalInformation $additionalInformation, File $file)
    {
        return $additionalInformation->updateFile($request, $file);
    }

    public function destroyFile(AdditionalInformation $additionalInformation, File $file)
    {
        return $additionalInformation->destroyFile($file);
    }

    public function destroyFiles(AdditionalInformation $additionalInformation, DestroysFileRequest $request)
    {
        return $additionalInformation->destroyFiles($request);
    }
}
