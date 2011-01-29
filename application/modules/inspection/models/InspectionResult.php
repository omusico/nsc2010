<?php
class Inspection_Model_InspectionResult extends Zend_Db_Table_Abstract
{
    protected $_name = 'inspection_result';

    public function getList()
    {
        $select = $this->select()
                    ->order('ir_id');
        return $this->fetchAll($select);
    }
}