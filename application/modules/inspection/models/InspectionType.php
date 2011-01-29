<?php
class Inspection_Model_InspectionType extends Zend_Db_Table_Abstract
{
    protected $_name = 'inspection_types';

    public function getList()
    {
        $select = $this->select();
        return $this->fetchAll($select);
    }
}