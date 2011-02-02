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
        if($pdf_form=="APPLICATIONFOREMPLOYMENT.pdf"){
            $arr = Report_Model_ReportAnnualReviewOfMotorVehicle::getRecord($dirver_id);
            $date->set($arr[0]["d_Date_Of_Hire"],"yyyy-MM-dd");

            $PNG_TEMP_DIR = "/home/vlad/nsc2010/public/documents/_tmp/qr/";
            $PNG_WEB_DIR =  '/home/vlad/nsc2010/public/documents/_tmp/qr/';
            if (!file_exists($PNG_TEMP_DIR))
                mkdir($PNG_TEMP_DIR);
            $filename = $PNG_TEMP_DIR.'test.png';
            //processing form input
            //remember to sanitize user input in real-life solution !!!
            # время-форма-водила-ранд
            $filename = $PNG_TEMP_DIR.md5("1234567890-10-1231-1231").'.png';
            QRcode::png("1234567890-1231-21-2324", $filename, 'Q', 4, 2);


            $QRBarcode =  $PNG_WEB_DIR.basename($filename);

            
            # KEY  -  name of the field in PDF form
            $array = array(
                "Logo" => "/home/vlad/nsc2010/public/images/logo-bg.jpg",
                "App_Barcodefield_page1" => '$QRBarcode' ,
                "FormTitle" => $arr[0]["d_First_Name"] ,
                "App_CompanyName" => $arr[0]["d_First_Name"] ,
                "App_CompanyHBAdress" => $arr[0]["d_First_Name"] ,
                "App_DriversFirstName" => $arr[0]["d_First_Name"] ,
                "App_DriversMiddleName" => $arr[0]["d_First_Name"] ,
                "App_DriversLastName" => $arr[0]["d_First_Name"] ,
                "App_SSN" => preg_replace("/^([0-9]{3})([0-9]{2})([0-9]{4})/","$1-$2-$3",$arr[0]["d_Driver_SSN"]),
                "App_DOB" => $arr[0]["d_First_Name"] ,

                /* CURRENT/PREVIOUS ADDRESSES (Must Be Listed For Past 3 Years): */
                "AddCurrentAddresses" => null,

                "APP_DIWAddress" => $arr[0]["d_First_Name"] ,
                "APP_DIWAddressCity" => $arr[0]["d_First_Name"] ,
                "APP_DIWAddressState" => $arr[0]["d_First_Name"] ,
                "APP_DIWAddressZIP" => $arr[0]["d_First_Name"] ,
                "APP_DriverPhone" => $arr[0]["d_First_Name"] ,
                "APP_AddressFromTo" => $arr[0]["d_First_Name"] ,

                "APP_PrevAddress1" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressCity1" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressState1" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressZIP1" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressPhone1" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddress1FromTo" => $arr[0]["d_First_Name"] ,

                "APP_PrevAddress2" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressCity2" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressState2" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressZIP2" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddressPhone2" => $arr[0]["d_First_Name"] ,
                "APP_PrevAddress2FromTo" => $arr[0]["d_First_Name"] ,

                /* Do you have the legal right to work in the United States?: */
                "Check Box12" => true ,
                "Text130" => "Yes" ,
                "Check Box13" => false ,
                "Text140" => "No" ,

                /* DRIVER LICENSE HISTORY (Must list any license you had for the previous 3 years in all states): */
                "App_State1" =>  $arr["d_First_Name"] ,
                "App_CDL1" =>  $arr["d_First_Name"] ,
                "App_CDL1Class" =>  $arr["d_First_Name"] ,
                "App_CDL1Exp" =>  $arr["d_First_Name"] ,

                "App_State2" =>  $arr["d_First_Name"] ,
                "App_CDL2" =>  $arr["d_First_Name"] ,
                "App_CDL2Class" =>  $arr["d_First_Name"] ,
                "App_CDL2Exp" =>  $arr["d_First_Name"] ,

                "App_State3" =>  $arr["d_First_Name"] ,
                "App_CDL3" =>  $arr["d_First_Name"] ,
                "App_CDL3Class" =>  $arr["d_First_Name"] ,
                "App_CDL3Exp" =>  $arr["d_First_Name"] ,

                "App_DeniedCDL" =>  $arr["d_First_Name"] ,
                "App_SuspendedCDL" =>  $arr["d_First_Name"] ,

                /* DRIVING EXPERIENCE (if none, write none): */
                "App_DrivExpNone" =>  null ,

                "App_STType" =>  $arr["d_First_Name"] , /* straight truck */
                "App_STTypeFrom" =>  $arr["d_First_Name"] ,
                "App_STTypeTo" =>  $arr["d_First_Name"] ,
                "App_STTypeMiles" =>  $arr["d_First_Name"] ,

                "App_TSType" =>  $arr["d_First_Name"] , /* tractor and semi-trailer */
                "App_TSTypeFrom" =>  $arr["d_First_Name"] ,
                "App_TSTypeTo" =>  $arr["d_First_Name"] ,
                "App_TSTypeMiles" =>  $arr["d_First_Name"] ,

                "App_TTType" =>  $arr["d_First_Name"] , /* tractor or two trailers */
                "App_TTTypeFrom" =>  $arr["d_First_Name"] ,
                "App_TTTypeTo" =>  $arr["d_First_Name"] ,
                "App_TTTypeMiles" =>  $arr["d_First_Name"] ,

                "App_BusType" =>  $arr["d_First_Name"] , /* motor coach / school bus */
                "App_BusTypeFrom" =>  $arr["d_First_Name"] ,
                "App_BusTypeTo" =>  $arr["d_First_Name"] ,
                "App_BusTypeMiles" =>  $arr["d_First_Name"] ,

                "App_OtherType" =>  $arr["d_First_Name"] , /* other */
                "App_OtherTypeFrom" =>  $arr["d_First_Name"] ,
                "App_OtherTypeTo" =>  $arr["d_First_Name"] ,
                "App_OtherTypeMiles" =>  $arr["d_First_Name"] ,
                /* end DRIVING EXPERIENCE */

                "Text1" =>  $arr["d_First_Name"] ,
                /* ----->8------ 1st page ends here */

                "App_barcodefield_page2" =>  $arr["d_First_Name"] ,

                /* Employment history: */
                "App_Employer_None" =>  null ,

                "App_Employer1" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1City" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1State" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1Zip" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1Contact" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1Phone" =>  $arr["d_First_Name"] ,
                "App_EmpAddress1Fax" =>  $arr["d_First_Name"] ,
                "App_EmpFrom1" =>  $arr["d_First_Name"] ,
                "App_EmpTo1" =>  $arr["d_First_Name"] ,
                "App_EmpJob1" =>  $arr["d_First_Name"] ,
                "t1" =>  $arr["d_First_Name"] , /* salary */
                "App_EmpReason1" =>  $arr["d_First_Name"] ,
                "Text7" => "Yes" ,
                "Text8" => "No" ,
                "Check Box6" => false , /* DOT_Safety_Sensitive_Function  Yes */
                "Check Box61" => false ,/* DOT_Safety_Sensitive_Function  No */
                "Check Box62" => false , /* FMCSR Yes */
                "Check Box63" => false , /* FMCSR No */

                "App_Employer2" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2City" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2State" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2Zip" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2Contact" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2Phone" =>  $arr["d_First_Name"] ,
                "App_EmpAddress2Fax" =>  $arr["d_First_Name"] ,
                "App_EmpFrom2" =>  $arr["d_First_Name"] ,
                "App_EmpTo2" =>  $arr["d_First_Name"] ,
                "App_EmpJob2" =>  $arr["d_First_Name"] ,
                "t2" =>  $arr["d_First_Name"] , /* salary */
                "App_EmpReason2" =>  $arr["d_First_Name"] ,
                "Text7" => "Yes" ,
                "Text8" => "No" ,
                "Check Box64" => false , /* DOT_Safety_Sensitive_Function  Yes */
                "Check Box65" => false ,/* DOT_Safety_Sensitive_Function  No */
                "Check Box79" => false , /* FMCSR Yes */
                "Check Box7" => false , /* FMCSR No */

                "App_Employer3" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3City" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3State" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3Zip" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3Contact" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3Phone" =>  $arr["d_First_Name"] ,
                "App_EmpAddress3Fax" =>  $arr["d_First_Name"] ,
                "App_EmpFrom3" =>  $arr["d_First_Name"] ,
                "App_EmpTo3" =>  $arr["d_First_Name"] ,
                "App_EmpJob3" =>  $arr["d_First_Name"] ,
                "t3" =>  $arr["d_First_Name"] , /* salary */
                "App_EmpReason3" =>  $arr["d_First_Name"] ,
                "Text7" => "Yes" ,
                "Text8" => "No" ,
                "Check Box68" => false , /* DOT_Safety_Sensitive_Function  Yes */
                "Check Box9" => false ,/* DOT_Safety_Sensitive_Function  No */
                "Check Box8" => false , /* FMCSR Yes */
                "Check Box71" => false , /* FMCSR No */

                "App_Employer4" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4City" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4State" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4Zip" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4Contact" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4Phone" =>  $arr["d_First_Name"] ,
                "App_EmpAddress4Fax" =>  $arr["d_First_Name"] ,
                "App_EmpFrom4" =>  $arr["d_First_Name"] ,
                "App_EmpTo4" =>  $arr["d_First_Name"] ,
                "App_EmpJob4" =>  $arr["d_First_Name"] ,
                "t4" =>  $arr["d_First_Name"] , /* salary */
                "App_EmpReason4" =>  $arr["d_First_Name"] ,
                "Text7" => "Yes" ,
                "Text8" => "No" ,
                "Check Box72" => false , /* DOT_Safety_Sensitive_Function  Yes */
                "Check Box73" => false ,/* DOT_Safety_Sensitive_Function  No */
                "Check Box74" => false , /* FMCSR Yes */
                "Check Box75" => false , /* FMCSR No */

                "Footer" =>  $arr["d_First_Name"] ,
                /* ----->8------ 2nd page ends here */
                "App_barcodefield_page3" =>  $arr["d_First_Name"] ,

                /* ACCIDENT RECORDS for past 3 years (attache sheet if nessesary, if none, write NONE): */
                "App_AccNone" =>  null,

                /* x6 */
                "App_AccDate1" =>  $arr["d_First_Name"] ,
                "App_AccType1" =>  $arr["d_First_Name"] ,
                "App_Fatalies1" =>  $arr["d_First_Name"] ,
                "App_Injuries1" =>  $arr["d_First_Name"] ,
                /* x6 */

                /* TRAFFIC CONVICTIONS and forfeitures for past 3 years (if none, write NONE): */ /* VIOLITATIONS */
                "App_ViolationNone" =>  null,

                /* x6 */
                "App_Location1" =>  $arr["d_First_Name"] ,
                "App_ViolationDate1" =>  $arr["d_First_Name"] ,
                "App_Offense1" =>  $arr["d_First_Name"] ,
                "App_Penalty1" =>  $arr["d_First_Name"] ,
                /* x6 */


                "NameCompanyOnly" =>  $arr["d_First_Name"] ,
                "Text4" =>  $arr["d_First_Name"] ,
                "Text3" =>  $arr["d_First_Name"] ,


                "Footer" => $date->toString("MM/dd/yyyy")
            );

        }

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