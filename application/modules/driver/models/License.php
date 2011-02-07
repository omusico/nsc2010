<?php
class Driver_Model_License extends Zend_Db_Table_Abstract
{
  protected $_name = 'license';

    public function getList($iDriverID=null)
    {
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        if((int)$iDriverID==null){
            $stmt = $db->query('
                          SELECT
                           *
                          FROM license
                            LEFT JOIN state on state.s_id = l_Driver_Issue_State_id
                          WHERE l_Driver_ID <> 0
                          ORDER BY l_Expiration_Date DESC
            ');
        }else{
            $stmt = $db->query('
                          SELECT
                           *
                          FROM license
                            LEFT JOIN state on state.s_id = l_Driver_Issue_State_id
                          WHERE l_Driver_ID = '.$iDriverID.'
                          ORDER BY l_Expiration_Date DESC
            ');
        }
        return $stmt->fetchAll();
    }
    
    public function getRecord($l_ID)
    {
        $row = $this->fetchRow($this->select()->where('l_id = ?',$l_ID));
        if($row==null){return false;}
        return $row->toArray();
    }

    public function createRecord($mData)
    {
        $table = new Driver_Model_License();
        return $table->insert($mData);
    }

    public function deleteRecord($iRecord)
    {
        if(isset($iRecord)){
            $table = new Driver_Model_License();
            return $table->delete("l_ID =".$iRecord);
        }else{
            return null;
        }

    }
    public function updateRecord($mData)
    {
        $db = new Driver_Model_License();
        $w = 'l_ID = '.$mData['l_ID'];
        return $db->update($mData,$w);
    }
}