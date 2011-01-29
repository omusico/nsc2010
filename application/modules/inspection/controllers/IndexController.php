<?php

class Inspection_IndexController extends Zend_Controller_Action
{
    public function preDispatch()
    {
        Zend_Controller_Action_HelperBroker::addPrefix('NSC_Helper_Validation');
    }

    public function createAction()
    {
        $this->saveInspectionEquipmentAction();
    }

    public function indexAction()
    {
        
    }

    public function getEquipmentInspectionsAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $result = array();
        $result['errorMessage'] = '';
        $result['result'] = 0;

        if ($this->_request->isXmlHttpRequest()) {
            $equipmentId = $this->_request->getParam('equipmentId');

            if (!empty($equipmentId)) {
                $inspectionModel = new Inspection_Model_Inspection();
                $inspections = $inspectionModel->getListByEquipment($equipmentId);

                $dateFieldArray = array('ins_start_date', 'ins_entry_date', 'ins_next_date', 'ins_reinspection_date');
                if (!is_null($inspections)) {
                    foreach ($inspections as &$row) {
                        foreach ($row as $key => &$value) {
                            if (in_array($key, $dateFieldArray)) {
                                try {
                                    if (empty($value) || $value == '0000-00-00') {
                                        throw new Exception;
                                    }
                                    $dateZend = new Zend_Date($value, 'yyyy-MM-dd');
                                    $value = $dateZend->toString('MM/dd/yyyy');
                                } catch (Exception $e) {
                                    $value = '';
                                }
                            }
                        }
                    }
                }

                $layout = new Zend_Layout();
                $layout->setLayoutPath(APPLICATION_PATH . '/modules/inspection/views/scripts/partials/index/');
                $layout->header = 'Inspection List';


                if (!is_null($inspections)) {
                    $layout->setLayout('_inspection-equipment-list');
                    $layout->inspectionList = $inspections;
                } else {
                    $layout->setLayout('_empty-inspection-equipment-list');
                    $layout->message = "There is no inspection records";
                }

                $insTypeModel = new Inspection_Model_InspectionType();
                $list = $insTypeModel->getList();
                $selectArray = array('' => '-');
                foreach ($list as $item) {
                    $selectArray[$item['it_id']] = $item['it_type'];
                }
                $layout->inspectionTypeList = $selectArray;

                $insResultModel = new Inspection_Model_InspectionResult();
                $list = $insResultModel->getList();
                $selectArray = array('' => '-');
                foreach ($list as $item) {
                    $selectArray[$item['ir_id']] = $item['ir_result'];
                }
                $layout->inspectionResultList = $selectArray;

                $inspectorModel = new Inspector_Model_Inspector();
                $list = $inspectorModel->getList();
                $selectArray = array('' => '-');
                foreach ($list as $item) {
                    $selectArray[$item['in_id']] = $item['in_first_name'] . ' ' . $item['in_last_name'];
                }
                $layout->inspectorList = $selectArray;

                $spModel = new ServiceProvider_Model_ServiceProvider();
                $list = $spModel->getList(array('spt_type' => 'Inspection'));
                $selectArray = array('' => '-');
                foreach ($list as $item) {
                    $selectArray[$item['sp_id']] = $item['sp_name'];
                }
                $layout->spList = $selectArray;

                $auth = Zend_Auth::getInstance();
                if ($auth->hasIdentity()) {
                    $layout->identity = $auth->getIdentity();
                }


                $result['result'] = 1;
                $result['markup'] = $layout->render();
            } else {
                $result['errorMessage'] = 'Equipment is undefined';
            }

            print json_encode($result);
        }
    }

    public function saveInspectionEquipmentAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $result = array();
        $result['errorMessage'] = '';
        $result['result'] = 0;

        if ($this->_request->isXmlHttpRequest()) {
            $data = array();
            $data = $this->_request->getQuery();

            $equipmentId = $data['ins_equipment_id'];
            if (!empty($equipmentId)) {
                $dateFieldArray = array('ins_start_date', 'ins_entry_date', 'ins_next_date', 'ins_reinspection_date');
                foreach ($data as $key => &$value) {
                    if (in_array($key, $dateFieldArray)) {
                        try {
                            if (empty($value)) {
                                throw new Exception;
                            }
                            $dateZend = new Zend_Date($value, 'MM/dd/yyyy');
                            $value = $dateZend->toString('yyyy-MM-dd');
                        } catch (Exception $e) {
                            $value = '';
                        }
                    }
                }

                $inspectionModel = new Inspection_Model_Inspection();
                $saveResult = $inspectionModel->saveInspection($data);

                if (isset($saveResult['row']) && is_array($saveResult['row'])) {
                    $result['result'] = 1;
                    foreach ($saveResult['row'] as $key => &$value) {
                        if (in_array($key, $dateFieldArray)) {
                            try {
                                if (empty($value) || $value == '0000-00-00') {
                                    throw new Exception;
                                }
                                $dateZend = new Zend_Date($value, 'yyyy-MM-dd');
                                $value = $dateZend->toString('MM/dd/yyyy');
                            } catch (Exception $e) {
                                $value = '';
                            }
                        }
                    }
                    $result['row'] = $saveResult['row'];
                } else if (isset($saveResult['validationError'])) {
                    $result['errorMessage'] = $this->_helper->buildValidateError($saveResult['validationError']);
                } else if (isset($saveResult['saveError'])) {
                    $result['errorMessage'] = $saveResult['saveError'];
                } else {
                    $result['errorMessage'] = "Error is occurred during a inspection storing.";
                }
            } else {
                $result['errorMessage'] = "Equipment is required.";
            }

            print json_encode($result);
        }
    }

    public function deleteInspectionAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $result = array();
            $inspectionId = $this->_request->getParam('ins_id');

            $inspectionModel = new Inspection_Model_Inspection();
            $countDeletedInspection = $inspectionModel->deleteInspection($inspectionId);

            if (1 === $countDeletedInspection) {
                $result['result'] = 1;
            } else {
                $result['errorMessage'] = "Can not delete this inspection";
            }

            print json_encode($result);
        }
    }
}

