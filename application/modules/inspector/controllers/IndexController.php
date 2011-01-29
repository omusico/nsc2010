<?php
class Inspector_IndexController extends Zend_Controller_Action
{
    const uploadPath = "upload/inspector/";

    public function preDispatch()
    {
        Zend_Controller_Action_HelperBroker::addPrefix('NSC_Helper_Validation');
    }

    public function init()
    {
    }

    public function createAction($equipmentId = null)
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $result = array();
        $result['errorMessage'] = '';
        $result['result'] = 0;

        if ($this->_request->isXmlHttpRequest()) {
            $data = array();
            $data = $this->_request->getQuery();


            $inspectionModel = new Inspector_Model_Inspector();
            $saveResult = $inspectionModel->saveInspector($data);

            if (isset($saveResult['row']) && is_array($saveResult['row'])) {
                $result['result'] = 1;
                $result['row'] = $saveResult['row'];
            } else if (isset($saveResult['validationError'])) {
                $result['errorMessage'] = $this->_helper->buildValidateError($saveResult['validationError']);
            } else if (isset($saveResult['saveError'])) {
                $result['errorMessage'] = $saveResult['saveError'];
            } else {
                $result['errorMessage'] = "Error is occurred during a inspection storing.";
            }
            

            print json_encode($result);
        }
    }

    public function uploadCertificateAction()
    {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isPost()) {
            if (isset($_FILES['uploadCertificate'])) {
                $inspectorSession = new Zend_Session_Namespace('Inspector');
                $inspectorId = $inspectorSession->Id;
                $fileName = $this->saveUploadData('uploadCertificate');
                if (!is_null($fileName)) {
                    $inspectorId['im_certificate'] = $fileName;
                    $inspectorSession->Id = $inspectorId;

                    //echo $fileName;
                    echo "{";
                    echo				"error: '" . '' . "',\n";
                    echo				"fileName: '" . $fileName . "'\n";
                    echo "}";
                }
            }
        }
    }

    private function saveUploadData($fieldName)
    {
        if ((($_FILES[$fieldName]["type"] == "image/tiff")
                || ($_FILES[$fieldName]["type"] == "image/jpeg")
                || ($_FILES[$fieldName]["type"] == "application/msword"))
                && ($_FILES[$fieldName]["size"] < 2097152)) {
            if ($_FILES[$fieldName]["error"] > 0) {
//                throw new Exception("Return Code: " . $_FILES[$fieldName]["error"] . "<br />");
                return null;
            } else {
                $extension = end(explode(".", $_FILES[$fieldName]['name']));

                $userId = '';
                $auth = Zend_Auth::getInstance();
                if ($auth->hasIdentity()) {
                    $identity = $auth->getIdentity();
                    $userId = $identity->vau_username;
                }

                $currentDate = new Zend_Date();
                $strDate = $currentDate->toString("dd") . "_" .
                        $currentDate->toString("MM") . "_" .
                        $currentDate->toString("YYYY") . "_" .
                        $currentDate->toString("HH") . "_" .
                        $currentDate->toString("mm") . "_" .
                        $currentDate->toString("ss");
                $randomVal = rand(0, 9999);
                $storeName = $userId . "_" . $strDate . "_" . $randomVal;
                if (!empty($extension)) {
                    $storeName .= ".$extension";
                }

                if (file_exists(self::uploadPath . $storeName)) {
//                    throw new Exception("$storeName already exists. ");
                    return null;
                } else {
                    $result = move_uploaded_file($_FILES[$fieldName]["tmp_name"],
                                    self::uploadPath . $storeName);
                    if ($result) {
                        return $storeName;
                    } else {
                        return null;
                    }
                }
            }
        } else {
            return null;
        }
    }
}

