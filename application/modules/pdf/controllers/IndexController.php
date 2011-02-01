<?php
# 30-01-2011 by Vlad
class Pdf_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
    }


}