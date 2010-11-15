<?php

/**
 * @author Andryi Ilnytskiy 07.11.2010
 *
 * Handle of the equipment searching.
 */
class Equipment_SearchController extends Zend_Controller_Action
{

    public function init()
    {

    }

    /**
     * @author Andryi Ilnytskyi 07.11.2010
     *
     * Create new equipment only with VIN value
     *
     * @param string $valueVIN Value of the Vehicle Identification Number
     *
     */
    public function indexAction()
    {
        if ($this->_request->isPost()) {
            if (isset($_REQUEST['VIN'])) {
                $equipment = new Equipment_Model_Equipment();
                $vin = $_POST['VIN'];
                $searchResult = $equipment->findEquipmentByVIN($vin);

                $this->view->VIN = $vin;
                
                if (is_null($searchResult)) {
                    $this->view->pageTitle = 'NEW APPLICATION - VEHICLE';
                    $this->render('not_exist');
                } else {
                    $this->view->pageTitle = 'NEW APPLICATION - VEHICLE';
                    $this->render('exist');
                }
                return;
            }
        }
        $this->view->headScript()->appendFile('/js/equipment_validate.js', 'text/javascript');
        $this->view->formAction = '/equipment/search';
        $this->view->breadcrumbs = '<a href="/equipment/list/index">Equipments</a>&nbsp;&gt;&nbsp;New Equipment Search';
        $this->view->pageTitle = 'NEW VEHICLE';
    }
}

