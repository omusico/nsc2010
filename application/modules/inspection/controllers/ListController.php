<?php
class Inspection_ListController extends Zend_Controller_Action
{
    private $_filterFields = array(
        'it_type' => array(
            'text' => 'Type'
        ),
        'ins_id' => array(
            'text' => 'Number'
        ),
        'e_Number' => array(
            'text' => 'Equipment'
        ),
        'ir_result' => array(
            'text' => 'Result'
        ),
        'in_name' => array(
            'text' => 'Inspector'
        ),
        'ins_start_date' => array(
            'text' => 'Date'
        )
    );

    private $_statuses = array(
        'All' => array(
            'text' => 'All'
        )
    );

    public function preDispatch()
    {
        $this->_helper->layout->setLayout('inspectionLayout');
        $auth = Zend_Auth::getInstance();

        if ($auth->hasIdentity()) {
            $this->_helper->layout->identity = $auth->getIdentity();
        }
    }

    public function init()
    {
        $auth = Zend_Auth::getInstance();

        if ($auth->hasIdentity()) {
            $this->view->identity = $auth->getIdentity();
        }
    }

    public function indexAction()
    {
        $this->view->breadcrumbs = '<a href="/inspection/index">Inspection Managment</a>';
        $this->view->breadcrumbs .= "&nbsp;&gt;&nbsp;Inspection List";

        // Set parameters for paginator and db-query
        $this->view->status = $options['Status'] = $this->_getParam('Status', 'All');
        $this->view->from = $from = $this->_getParam('from', 0);
        $this->view->from = $step = $this->_getParam('step', 20);
        $this->view->orderBy = $options['orderBy'] = $this->_getParam('orderBy', 'ir_result');
        $this->view->orderWay = $options['orderWay'] = $this->_getParam('orderWay', 'ASC');
        $options['SearchBy'] = $this->_getParam('SearchBy', 'ir_result');
        $options['SearchText'] = $this->_getParam('SearchText', '');

        if (!empty($options['SearchBy']) && $options['SearchBy'] == 'in_name') {
            $options['SearchBy'] = array('in_first_name', 'in_last_name');
        }

        $inspectionModel = new Inspection_Model_Inspection();
        $inspectionList = $inspectionModel->getInspectionList($from, $step, $options);

        if (count($inspectionList)) {
            $this->view->inspectionList = $inspectionList['limitList'];
            $this->view->allInspections = $inspectionList['totalCount'];
        } else {
            $this->view->inspectionList = null;
        }

        if (!empty($options['SearchText'])) {
            foreach ($this->_filterFields as $key => &$value) {
                if ($options['SearchBy'] == $key) {
                    $value['selected'] = true;
                    $this->view->searchText = $options['SearchText'];
                    break;
                }
            }
        } else {
            $this->_filterFields['ir_result']['selected'] = 'true';
        }
        $this->view->filterFields = $this->_filterFields;

        foreach ($this->_statuses as $key => &$value) {
            if ($options['Status'] == $key) {
                $value['selected'] = true;
                break;
            }
        }
        $this->view->statuses = $this->_statuses;

        $this->view->pageTitle = 'LIST OF INSPECTIONS';
        $this->view->headScript()->appendFile('/js/jquery.url.js', 'text/javascript');
        $this->view->headScript()->appendFile('/js/sp/list.js', 'text/javascript');
    }
}



