
<?php
class Documents_Model_CustomDocumentFormName extends Zend_Db_Table_Abstract
{
    protected $_form_name = 'custom_document__form_name';


    public function init()
    {

    }

    public static function getRecordByName($cdfn_pdf)
    {
        if(!isset($cdfn_pdf)){
            return null;
        }
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $stmt = $db->query('
            SELECT
                *
                FROM custom_document__form_name
                WHERE cdfn_pdf ="'.$cdfn_pdf.'"
            ');

        $row = $stmt->fetchAll();
        return $row;
    }

}