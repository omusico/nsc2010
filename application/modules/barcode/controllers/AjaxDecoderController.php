<?php
# 27-01-2011 by Vlad
class Barcode_AjaxDecoderController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction()
    {

    }

    # call shell program, which will try to read QR-barcode and return value of it
    # 28-01-2011 by Vlad
    # param $scan = 
    public function decodeAction(){
        if(isset($_REQUEST['scan'])){
            $scan = preg_replace("/\?.+$/","",$_REQUEST['scan']);
            echo "<h2>".shell_exec("/home/vlad/nsc2010/public/shell/zxing '/home/vlad/workspace/nsc2010/public".$scan."'")."</h2>";
        }else{
            echo "No document provided";
        }
        echo "<img src='".$scan."' />";
    }
}

