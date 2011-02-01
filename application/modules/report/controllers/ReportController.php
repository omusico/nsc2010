<?php

class Report_ReportController extends Zend_Controller_Action

{

    public function init()
    {
        # For menu highlighting:
        $this->view->currentPage = "DriverFiles";

        $this->auth = Zend_Auth::getInstance();
        if ($this->auth->hasIdentity()) {
            $this->identity = $this->auth->getIdentity();
            $this->view->identity = $this->auth->getIdentity();
        }
    }

    public function indexAction()
    {
        // action body
    }

    # Show page http://nsc.lcl/report/report/annual-review-of-motor-vehicle-report/driver_id/1
    # request param driver_id
    # Vlad, 27-01-2011
    public function annualReviewOfMotorVehicleReportAction()
    {
        if ($this->auth->hasIdentity()) {
            $this->view->headScript()->appendFile('/js/driver/index.js', 'text/javascript');
            $this->view->headScript()->appendFile('/js/driver/driver_dqf.js', 'text/javascript');
            // DRIVER QUALIFICATION FILE
            $driverID = (int)$this->_request->getParam('driver_id');
            # Breadcrumbs & page title goes here:
            $this->view->breadcrumbs = "<a href='/driver/driver/view-driver-Information/id/".$driverID."'>Driver</a>&nbsp;&gt;&nbsp;<a href='/driver/driver/dqf/driver_id/".$driverID."'>DQF</a>&nbsp;&gt;&nbsp;Annual Review of Motor Vehicle Report";
            $this->view->pageTitle = "ANNUAL REVIEW OF MOTOR VEHICLE REPORT";
            $driverID = (int)$this->_request->getParam('driver_id');
            $driverInfo = Driver_Model_Driver::getDriverInfo($driverID);
            if (isset($this->identity->permissions->see_non_crypt_ssn_permission)){
                $driverInfo['d_Driver_SSN'] = preg_replace("/^([0-9]{3})([0-9]{2})([0-9]{4})/","$1-$2-$3",$driverInfo['d_Driver_SSN']);
            }else{
                $driverInfo['d_Driver_SSN'] = preg_replace("/^([0-9]{4})([0-9]{1})([0-9]{4})/","XXX-X$2-$3",$driverInfo['d_Driver_SSN']);
            }
            $this->view->auth = $this->auth;
            $this->view->driverInfo = $driverInfo;
            $this->view->documentsFormList = Documents_Model_CustomDocument::getList($driverID);
        }
    }

    # write annual report to database
    # Vlad, 27-01-2011
    public function ajaxAddAnnualReviewOfMotorVehicleReportAction()
    {
        if ($this->auth->hasIdentity()) {
            $this->_helper->viewRenderer->setNoRender();
            $this->_helper->layout()->disableLayout();
            $raromv_driver_id = $_REQUEST['raromv_driver_id'];
            $raromv_review_person_id = $_REQUEST['raromv_review_person_id'];
            $raromv_review_date = $_REQUEST['raromv_review_date'];
            $raromv_name_of_person_reviewing = $_REQUEST['raromv_name_of_person_reviewing'];
            $raromv_confirm_review = $_REQUEST['raromv_confirm_review'];
            $raromv_driver_info = $_REQUEST['raromv_driver_info'];
            $raromv_remarks = addslashes($_REQUEST['raromv_remarks']);

            $data = array();

            $date = new Zend_Date();
            $date->set($raromv_review_date,'MM/dd/yyyy');
            $raromv_review_date = $date->toString("yyyy-MM-dd");

            $data['raromv_driver_id'] = $raromv_driver_id;
            $data['raromv_review_person_id'] = $raromv_review_person_id;
            $data['raromv_review_date'] = $raromv_review_date;
            $data['raromv_name_of_person_reviewing'] = $raromv_name_of_person_reviewing;
            $data['raromv_confirm_review'] = $raromv_confirm_review;
            $data['raromv_driver_info'] = $raromv_driver_info;
            $data['raromv_remarks'] = $raromv_remarks;



            try{
                echo Report_Model_ReportAnnualReviewOfMotorVehicle::createRecord($data);
                }catch(Exception $e){
                echo "Error creating record in DB!";
            }


        }
    }


}

