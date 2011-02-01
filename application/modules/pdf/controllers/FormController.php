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
        $report_id = $this->_request->getParam('report_id');

        include_once "/php/pdf/forge_fdf.php";

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
                if($arr[$i]["raromv_name_of_person_reviewing"]==1){
                    $array["ANNUAL_Req".($i+1)] = "Yes";
                }else{
                    $array["ANNUAL_Req".($i+1)] = "Off";
                }
                if($arr[$i]["raromv_name_of_person_reviewing"]==1){
                    $array["ANNUAL_Disqualif".($i+1)] = "Yes";
                }else{
                    $array["ANNUAL_Disqualif".($i+1)] = "Off";
                }

            }

        }

        $one = array();
        $two = array();
        $three = array();

        # creating temp file which contains fields for empty PDF-form:
        $file_name = "/documents/_tmp/pdf_fdf/data_".(preg_replace("/[^A-Za-z0-9\-]/","", $array["ANNUAL_Name"]). "___" . date("Y-m-d")).".fdf";
        $fdf = forge_fdf("localhost", $array, $one, $two, $three);
        $file = fopen(APPLICATION_PATH . "/../public/" . $file_name,"a+");
        fwrite($file,$fdf);
        fclose($file);

        # creating filled temporary PDF-form:
        $pfile = preg_replace("/[^A-Za-z0-9\-]/","",$array['ANNUAL_Name']) . "__" . str_replace(".pdf","",$pdf_form) . "__" . date("Y-m-d").".pdf";
        #@unlink(APPLICATION_PATH . "/../consortium_enrollment_pdf/$pfile");
        # for Linux:
        $cmd = SHELL_PATH . "pdftk " . APPLICATION_PATH."/../public_html/documents/_tmp/pdf_fdf/$pdf_form fill_form ".APPLICATION_PATH."/../public/$file_name output ".APPLICATION_PATH."/../public/documents/_tmp/filled_pdf/$pfile";
        # for Windows:
        #$cmd = "/php/pdftk/bin/pdftk.exe ".APPLICATION_PATH."/../public_html/pdf_templates/Enrollment_Package_Renewal.pdf fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";
        shell_exec($cmd);

        
    }

}