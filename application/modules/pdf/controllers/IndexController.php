<?php
# 30-01-2011 by Vlad
class Pdf_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction(){
        $page_number = $_GET['pages'];
        $pdf = new Zend_Pdf();
        $font = Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA);
        $image = Zend_Pdf_Image::imageWithPath('documents/_tmp/uploads/test17057c8af7a4de39125c5b21bae4ef43.png');
        for($i=0;$i<$page_number;$i++){
            $page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_A4);
            $page->drawImage($image, 479, 720, 595, 842);
            $pdf->pages[$i] = $page;
        }
        $pdf->save('documents/_tmp/example'.rand(0,888).'.pdf');
        echo 'SUCCESS: Document saved!';

    }

}