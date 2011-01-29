<?php
class Incident_AutocompleteController extends Zend_Controller_Action
{
    public function  preDispatch()
    {
        $this->_helper->layout->setLayout('incidentLayout');
    }

    public function init()
    {
        $auth = Zend_Auth::getInstance();

        if ($auth->hasIdentity()) {
            $this->view->identity = $auth->getIdentity();
        }
    }

    public function getAutocompletePersonCityAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_city';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }

                    $result['result'] = 1;
                }
            }

            print json_encode($result);
        }
    }

    public function getAutocompletePersonZipAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_postal_code';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }

    public function getAutocompletePersonFirstNameAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;
            
            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_first_name';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }

    public function getAutocompletePersonLastNameAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_last_name';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }

    public function getAutocompletePersonAddress1Action()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_address1';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }

    public function getAutocompletePersonAddress2Action()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_address2';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }

    public function getAutocompletePersonTelephoneAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isXmlHttpRequest()) {
            $term = $this->_request->getParam('term');

            $result = array();
            $result['result'] = 0;

            if (!empty($term)) {
                $personModel = new Person_Model_Person();
                $field = 'per_telephone_number';
                $fieldList = $personModel->getFieldListByValuePart($field, trim($term));
                if (is_array($fieldList) && count($fieldList)) {
                    foreach($fieldList as $value){
                        $arrayPart = array();
                        $arrayPart['label'] = $value[$field];
                        $result['items'][] = $arrayPart;
                    }
                    $result['result'] = 1;
                }

                print json_encode($result);
            }
        }
    }
}

