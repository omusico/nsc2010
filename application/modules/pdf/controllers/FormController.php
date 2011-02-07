<?php
# 30-01-2011 by Vlad
class Pdf_FormController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
    }

    public function showFormAction(){

        $pdf_form = $this->_request->getParam('pdf-form');
        $dirver_id = (int)$this->_request->getParam('driver-id');

        include_once "/home/vlad/nsc2010/public/php/pdf/forge_fdf.php";
        include_once "/home/vlad/nsc2010/public/php/qr/qrlib.php";

        $date = new Zend_Date();

        if($pdf_form=="Annual Review of Driving Record.pdf"){
            $arr = Report_Model_ReportAnnualReviewOfMotorVehicle::getRecord($dirver_id);
            $date->set($arr[0]["d_Date_Of_Hire"],"yyyy-MM-dd");
            # KEY  -  name of the field in PDF form
            $array = array(
                "ANNUAL_Name" => $arr[0]["d_First_Name"] . " ". $arr[0]["d_Middle_Name"] ." " . $arr[0]["d_Last_Name"],
                "ANNUAL_Address" => $arr[0]["dah_Address1"] . ", ".$arr[0]["dah_City"] . ", ".$arr[0]["s_name"] . ", ".$arr[0]["dah_Postal_Code"],
                "ANNUAL_SSN" => preg_replace("/^([0-9]{3})([0-9]{2})([0-9]{4})/","$1-$2-$3",$arr[0]["d_Driver_SSN"]),
                "ANNUAL_DateOfHire" => $date->toString("MM/dd/yyyy"));
            for($i=0;$i<sizeof($arr);$i++){
                $date->set($arr[$i]["raromv_review_date"],"yyyy-MM-dd");
                $array["ANNUAL_Date".($i+1)] = $date->toString("MM/dd/yyyy");
                $array["ANNUAL_Person".($i+1)] = $arr[$i]["raromv_name_of_person_reviewing"];
                ($arr[$i]["raromv_driver_info"]==1) ? $array["ANNUAL_Req".($i+1)] = "Yes" : $array["ANNUAL_Req".($i+1)] = "Off";
                ($arr[$i]["raromv_driver_info"]==2) ? $array["ANNUAL_Disqualif".($i+1)] = "Yes" : $array["ANNUAL_Disqualif".($i+1)] = "Off";
            }
        }
        if($pdf_form=="Certificate of Compliance.pdf"){
            $arr = Report_Model_ReportAnnualReviewOfMotorVehicle::getRecord($dirver_id);
            $date->set($arr[0]["d_Date_Of_Hire"],"yyyy-MM-dd");
            # KEY  -  name of the field in PDF form
            $array = array(
                "ANNUAL_Name" => $arr[0]["d_First_Name"] . " ". $arr[0]["d_Middle_Name"] ." " . $arr[0]["d_Last_Name"],
                "ANNUAL_Address" => $arr[0]["dah_Address1"] . ", ".$arr[0]["dah_City"] . ", ".$arr[0]["s_name"] . ", ".$arr[0]["dah_Postal_Code"],
                "ANNUAL_SSN" => preg_replace("/^([0-9]{3})([0-9]{2})([0-9]{4})/","$1-$2-$3",$arr[0]["d_Driver_SSN"]),
                "ANNUAL_DateOfHire" => $date->toString("MM/dd/yyyy"));
            for($i=0;$i<sizeof($arr);$i++){
                $date->set($arr[$i]["raromv_review_date"],"yyyy-MM-dd");
                $array["ANNUAL_Date".($i+1)] = $date->toString("MM/dd/yyyy");
                $array["ANNUAL_Person".($i+1)] = $arr[$i]["raromv_name_of_person_reviewing"];
                ($arr[$i]["raromv_driver_info"]==1) ? $array["ANNUAL_Req".($i+1)] = "Yes" : $array["ANNUAL_Req".($i+1)] = "Off";
                ($arr[$i]["raromv_driver_info"]==2) ? $array["ANNUAL_Disqualif".($i+1)] = "Yes" : $array["ANNUAL_Disqualif".($i+1)] = "Off";
            }
        }
        if($pdf_form=="APPLICATIONFOREMPLOYMENT.pdf"){
            $driverInfo = Driver_Model_Driver::getFullDriverInfo($dirver_id);
            if($driverInfo['d_Date_Of_Birth']!=""){
                $date->set($driverInfo['d_Date_Of_Birth'],"yyyy-MM-dd");
                $App_DOB = $date->toString("MM/dd/yyyy");
            }else{ $App_DOB = ""; }
            $driverHistoryList = new Driver_Model_DriverAddressHistory();
            $driverAddressHistoryInfo = $driverHistoryList->getList($dirver_id);
            $hb = new Homebase_Model_Homebase();
            $homeBaseInfo = $hb->getHomebase($driverInfo['d_homebase_ID']);
            $companyInfo = Company_Model_Company::getRecord($homeBaseInfo['h_Company_Account_Number']);
            $driverLicenceInfo = Driver_Model_License::getList($dirver_id);
            $driverEmploymentInfo = Driver_Model_DriverPreviousEmployment::getList($dirver_id);
            $userCompanyInfo = Company_Model_Company::getRecord($_SESSION['user_data']['u_Company_ID']);
            $pdfFormInfo = Documents_Model_CustomDocumentFormName::getRecordByName($pdf_form);


            # TODO: do it.
            #$driverIncidentAndViolationInfo = Incident_Model_Incident::getFullList($dirver_id);
            #print_r($driverIncidentAndViolationInfo);

            #$PNG_TEMP_DIR = "/home/vlad/nsc2010/public/documents/_tmp/qr/";
            $PNG_TEMP_DIR = "documents/_tmp/qr/";
            #$PNG_WEB_DIR =  '/home/vlad/nsc2010/public/documents/_tmp/qr/';
            $PNG_WEB_DIR =  'documents/_tmp/qr/';
            if (!file_exists($PNG_TEMP_DIR))
                mkdir($PNG_TEMP_DIR);
            $filename = $PNG_TEMP_DIR.'test.png';

            # KEY  -  name of the field in PDF form
            $array = array();
            $array["Logo"] = "";
            $array["App_Barcodefield_page1"] = "" ;
            $array["FormTitle"] = "APPLICATION FOR ".strtoupper($driverInfo["det_type"]) ;
            $array["App_CompanyName"] = $companyInfo[0]["c_Name"] ;
            $array["App_CompanyHBAdress"] = $companyInfo[0]["ct_Address1"] . " " . $companyInfo[0]["ct_City"] . " " . $companyInfo[0]["s_name"] . " " . $companyInfo[0]['ct_Postal_Code'] ;
            $array["App_DriversFirstName"] = $driverInfo["d_First_Name"] ;
            $array["App_DriversMiddleName"] = $driverInfo["d_Middle_Name"] ;
            $array["App_DriversLastName"] = $driverInfo["d_Last_Name"] ;
            $array["App_SSN"] = preg_replace("/^([0-9]{3})([0-9]{2})([0-9]{4})/","$1-$2-$3",$driverInfo["d_Driver_SSN"]);
            $array["App_DOB]"] = $App_DOB ;

            /* CURRENT/PREVIOUS ADDRESSES (Must Be Listed For Past 3 Years): */
            $array["AddCurrentAddresses"] = null;

            $fromDate = explode("-",$driverAddressHistoryInfo[0]['dah_Start_Date']);
            $toDate = explode("-",$driverAddressHistoryInfo[0]['dah_End_Date']);
            $fromTo = "";
            $fromTo = $fromTo . ($toDate[0]-$fromDate[0]). " yrs ";
            $fromTo = $fromTo .($toDate[1]-$fromDate[1])." mos ";
            $array["APP_DIWAddress"] = $driverAddressHistoryInfo[0]["dah_Address1"] ;
            $array["APP_DIWAddressCity"] = $driverAddressHistoryInfo[0]["dah_City"] ;
            $array["APP_DIWAddressState"] = $driverAddressHistoryInfo[0]["s_name"] ;
            $array["APP_DIWAddressZIP"] = $driverAddressHistoryInfo[0]["dah_Postal_Code"] ;
            $array["APP_DriverPhone"] = $driverAddressHistoryInfo[0]["dah_Phone"] ;
            $array["APP_AddressFromTo"] = $fromTo;


            for($i=1;$i<sizeof($driverAddressHistoryInfo);$i++){
                $fromDate = explode("-",$driverAddressHistoryInfo[$i]['dah_Start_Date']);
                $toDate = explode("-",$driverAddressHistoryInfo[$i]['dah_End_Date']);
                $fromTo = "";
                $fromTo = $fromTo . ($toDate[0]-$fromDate[0]). " yrs ";
                $fromTo = $fromTo .($toDate[1]-$fromDate[1])." mos ";

                $array["APP_PrevAddress".$i] = $driverAddressHistoryInfo[$i]["dah_Address1"] ;
                $array["APP_PrevAddressCity".$i] = $driverAddressHistoryInfo[$i]["dah_City"] ;
                $array["APP_PrevAddressState".$i] = $driverAddressHistoryInfo[$i]["s_name"] ;
                $array["APP_PrevAddressZIP".$i] = $driverAddressHistoryInfo[$i]["dah_Postal_Code"] ;
                $array["APP_PrevAddressPhone".$i] = $driverAddressHistoryInfo[$i]["dah_Phone"] ;
                $array["APP_PrevAddress".$i."FromTo"] = $fromTo ;

            }


            /* Do you have the legal right to work in the United States?: */
            $array["Check Box12"] = false;
            $array["Text130"] = "Yes" ;
            $array["Check Box13"] = false ;
            $array["Text140"] = "No" ;

            /* DRIVER LICENSE HISTORY (Must list any license you had for the previous 3 years in all states): */
            for($i=0;$i<sizeof($driverLicenceInfo);$i++){
                $date->set($driverLicenceInfo[$i]['l_Expiration_Date'],"yyyy-MM-dd");
                $App_CDLExp = $date->toString("MM/dd/yyyy");
                $array["App_State".($i+1)] =  $driverLicenceInfo[$i]["s_name"] ;
                $array["App_CDL".($i+1)] =  $driverLicenceInfo[$i]["l_Driver_License_Number"] ;
                $array["App_CDL".($i+1)."Class"] =  $driverLicenceInfo[$i]["l_Class"] ;
                $array["App_CDL".($i+1)."Exp"] =  $App_CDLExp;
            }

            $array["App_DeniedCDL"] =  "" ;
            $array["App_SuspendedCDL"] =  "" ;

            /* DRIVING EXPERIENCE (if none, write none): */
            $array["App_DrivExpNone"] =  null ;

            $array["App_STType"] =  "" ; /* straight truck */
            $array["App_STTypeFrom"] =  "" ;
            $array["App_STTypeTo"] =  "" ;
            $array["App_STTypeMiles"] = "" ;

            $array["App_TSType"] = "" ; /* tractor and semi-trailer */
            $array["App_TSTypeFrom"] = "" ;
            $array["App_TSTypeTo"] =  "";
            $array["App_TSTypeMiles"] = "" ;

            $array["App_TTType"] =  ""; /* tractor or two trailers */
            $array["App_TTTypeFrom"] =  "" ;
            $array["App_TTTypeTo"] =  "" ;
            $array["App_TTTypeMiles"] =  "" ;

            $array["App_BusType"] =  ""; /* motor coach / school bus */
            $array["App_BusTypeFrom"] =  "";
            $array["App_BusTypeTo"] =  "" ;
            $array["App_BusTypeMiles"] =  "";

            $array["App_OtherType"] =  "" ; /* other */
            $array["App_OtherTypeFrom"] =  "" ;
            $array["App_OtherTypeTo"] =  "" ;
            $array["App_OtherTypeMiles"] = "";
            /* end DRIVING EXPERIENCE */

            $array["Text1"] =  "" ;
            /* ----->8------ 1st page ends here */

            $array["App_barcodefield_page2"] = "";

            /* Employment history: */

            if(sizeof($driverEmploymentInfo)<1){
                $array["App_Employer_None"] =  "NONE" ;
            }else{
                $array["Text7"] = "Yes" ;
                $array["Text8"] = "No" ;
                $from = new Zend_Date();
                $to = new Zend_Date();
                for($i=0;$i<sizeof($driverEmploymentInfo);$i++){
                    $from->set($driverEmploymentInfo[$i]["dpe_Employment_Start_Date"],"yyyy-MM-dd");
                    $to->set($driverEmploymentInfo[$i]["dpe_Employment_Stop_Date"],"yyyy-MM-dd");

                    $array["App_Employer".($i+1)] =  $driverEmploymentInfo[$i]["emp_Employer_Name"] ;
                    $array["App_EmpAddress".($i+1)] =  $driverEmploymentInfo[$i]["emp_Address1"] ;
                    $array["App_EmpAddress".($i+1)."City"] =  $driverEmploymentInfo[$i]["emp_City"] ;
                    $array["App_EmpAddress".($i+1)."State"] =  $driverEmploymentInfo[$i]["s_name"] ;
                    $array["App_EmpAddress".($i+1)."Zip"] =  $driverEmploymentInfo[$i]["emp_Postal_Code"] ;
                    $array["App_EmpAddress".($i+1)."Contact"] =  "" ;
                    $array["App_EmpAddress".($i+1)."Phone"] = Custom_View_Helper_Transformation::convertNumber($driverEmploymentInfo[$i]["emp_Phone"]) ;
                    $array["App_EmpAddress".($i+1)."Fax"] =  Custom_View_Helper_Transformation::convertNumber($driverEmploymentInfo[$i]["emp_Fax"]);
                    $array["App_EmpFrom".($i+1)] =  $from->toString("MM,yyyy") ;
                    $array["App_EmpTo".($i+1)] =  $to->toString("MM,yyyy") ;
                    $array["App_EmpJob".($i+1)] =  $driverEmploymentInfo[$i]["dpe_Position"] ;
                    $array["t".($i+1)] =  $driverEmploymentInfo[$i]["dpe_Salary"] ; /* salary */
                    $array["App_EmpReason".($i+1)] =  $driverEmploymentInfo[$i]["dpe_Reason_for_Leaving"] ;
                }
                $array["Check Box6"] = false ; /* DOT_Safety_Sensitive_Function  Yes */
                $array["Check Box61"] = false ;/* DOT_Safety_Sensitive_Function  No */
                $array["Check Box62"] = false ; /* FMCSR Yes */
                $array["Check Box63"] = false ; /* FMCSR No */

                $array["Check Box64"] = false ; /* DOT_Safety_Sensitive_Function  Yes */
                $array["Check Box65"] = false ;/* DOT_Safety_Sensitive_Function  No */
                $array["Check Box79"] = false ; /* FMCSR Yes */
                $array["Check Box7"] = false ; /* FMCSR No */

                $array["Check Box68"] = false ; /* DOT_Safety_Sensitive_Function  Yes */
                $array["Check Box9"] = false ;/* DOT_Safety_Sensitive_Function  No */
                $array["Check Box8"] = false ; /* FMCSR Yes */
                $array["Check Box71"] = false ; /* FMCSR No */

                $array["Check Box72"] = false ; /* DOT_Safety_Sensitive_Function  Yes */
                $array["Check Box73"] = false ;/* DOT_Safety_Sensitive_Function  No */
                $array["Check Box74"] = false ; /* FMCSR Yes */
                $array["Check Box75"] = false ; /* FMCSR No */

            }

            $array["Footer"] = "" ;
            /* ----->8------ 2nd page ends here */
            $array["App_barcodefield_page3"] =  "" ;

            /* ACCIDENT RECORDS for past 3 years (attache sheet if nessesary, if none, write NONE): */

            $array["App_AccNone"] =  null;
            for($i=0;$i<6;$i++){
                /* x6 */
                $array["App_AccDate".($i+1)] = "" ;
                $array["App_AccType".($i+1)] = "" ;
                $array["App_Fatalies".($i+1)] = "" ;
                $array["App_Injuries".($i+1)] = "" ;
                /* x6 */
            }
            /* TRAFFIC CONVICTIONS and forfeitures for past 3 years (if none, write NONE): */ /* VIOLITATIONS */
            $array["App_ViolationNone"] =  null;

            for($i=0;$i<6;$i++){
                /* x6 */
                $array["App_Location".($i+1)] =  "" ;
                $array["App_ViolationDate".($i+1)] = "" ;
                $array["App_Offense".($i+1)] = "" ;
                $array["App_Penalty".($i+1)] =  "" ;
                /* x6 */
            }


            $array["NameCompanyOnly"] =  $userCompanyInfo[0]['c_Name'] ;
            $array["Text4"] = "" ;
            $array["Text3"] = "" ;


            $array["Footer"] = "";


            /* Creating empty PDF document with barcodes */
            $page_number = 3;
            $pdf = new Zend_Pdf();
            for($i=0;$i<$page_number;$i++){

                # время-форма-водила-страница-ранд
                $code = mktime(date("H"),date("i"),date("s"),date("n"),date("j"),date("Y"))."-".$pdfFormInfo[0]['cdfn_ID']."-".$dirver_id."-".($i+1)."-".rand(0,9999);
                $filename = $PNG_TEMP_DIR.$code.'.png';
                QRcode::png($code, $filename, 'Q', 4, 2);
                $QRBarcode =  $PNG_WEB_DIR.basename($filename);


                $barcode_image = Zend_Pdf_Image::imageWithPath($QRBarcode);
                $page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_A4);
                $page->drawImage($barcode_image, 479, 720, 595, 842);
                $pdf->pages[$i] = $page;
            }
            $pdf->save('documents/_tmp/filled_pdf/example'.$code."__empty".'.pdf');

        # WTF???
        $one = array();
        $two = array();
        $three = array();
        
        # creating temp file which contains fields for empty PDF-form:
        $md5rand = rand(1000,9999)."_".rand(1000,9999);
        $file_name = "documents/_tmp/pdf_fdf/data_".$md5rand. "___" . date("Y-m-d").".fdf";
        @unlink("/home/vlad/nsc2010/public/$file_name");
        $fdf = forge_fdf("localhost", $array, $one, $two, $three);
        $file = fopen("/home/vlad/nsc2010/public/" . $file_name,"a+");
        fwrite($file,$fdf);
        fclose($file);

        # creating filled temporary PDF-form:
        $pfile = $md5rand . "__" . str_replace(".pdf","",$pdf_form) . "__" . date("Y-m-d").".pdf";
        @unlink("/home/vlad/nsc2010/public/documents/_tmp/filled_pdf/$pfile");
        # for Linux:
        $cmd = "/home/vlad/nsc2010/public/shell/pdftk '/home/vlad/nsc2010/public/documents/pdf/$pdf_form' fill_form '/home/vlad/nsc2010/public/$file_name' output '/home/vlad/nsc2010/public/documents/_tmp/filled_pdf/$pfile'";

        shell_exec($cmd);
        # remove temp files:
        #@unlink("/home/vlad/nsc2010/public/$file_name");

        # show document to user:
        header("Content-type: application/pdf");
        readfile("/home/vlad/nsc2010/public/documents/_tmp/filled_pdf/$pfile");
        #@unlink("/home/vlad/nsc2010/public/documents/_tmp/filled_pdf/$pfile");

    }

}