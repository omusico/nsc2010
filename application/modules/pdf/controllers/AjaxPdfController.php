<?php
# 30-01-2011 by Vlad
class Pdf_AjaxPdfController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction()
    {

    }

    # call shell program, which will try to fill empty fields in PDF-template
    # 30-01-2011 by Vlad
    # param $scan =
    public function decodeAction(){

        if(isset($_REQUEST['scan'])){
            $scan = $_REQUEST['scan'];
            echo shell_exec(SHELL_PATH . "zxing /home/vlad/nsc2010/public/".$scan);
        }else{
            echo "No document provided";
        }
    }
}

