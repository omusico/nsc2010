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

    public function annualReviewOfMotorVehicleReportAction()
    {
        if ($this->auth->hasIdentity()) {
            $this->view->headScript()->appendFile('/js/driver/index.js', 'text/javascript');
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
            $this->view->driverInfo = $driverInfo;
            $this->view->documentsFormList = Documents_Model_CustomDocument::getList($driverID);
        }
    }


}

