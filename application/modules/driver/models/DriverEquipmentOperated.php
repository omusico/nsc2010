<?php
class Driver_Model_DriverEquipmentOperated extends Zend_Db_Table_Abstract
{
  protected $_name = 'driver__equipment_operated';


    public function getList($iDriverID=null)
    {
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        if((int)$iDriverID==null){
            return "ERROR: No Driver ID passed.";
        }else{
            $stmt = $db->query('
                          SELECT
                           *
                          FROM driver__equipment_operated
                            LEFT JOIN equipment_types on equipment_types.et_id = deo_Equipment_Type_ID
                          WHERE deo_Driver_ID = '.$iDriverID.'
                          ORDER BY deo_Equipment_Type_ID ASC
            ');
        }
        return $stmt->fetchAll();
    }

    public function getRecord($deo_ID)
    {
        $row = $this->fetchRow($this->select()->where('deo_ID = ?',$deo_ID));
        if($row==null){return null;}
        return $row->toArray();
    }

    public static function createRecord($mData)
    {
        if(isset($mData)){
            try
            {
                $table = new Driver_Model_DriverEquipmentOperated();
                $table->insert($mData);
            }catch(Exception $e)
            {
                return $e->getMessage();
            }
            return true;
        }else{
            return false;
        }
    }

    public static function deleteRecord($iRecord)
    {
        $table = new Driver_Model_DriverEquipmentOperated();
        return $table->delete("deo_ID =".$iRecord);
    }
    public function updateRecord($mData)
    {
        try
            {
                $db = new Driver_Model_DriverEquipmentOperated();
                $w = 'deo_ID = '.$mData['deo_ID'];
                $db->update($mData,$w);
            }catch(Exception $e)
            {
                return $e->getMessage();
            }
            return true;
    }

    public static function getRecordByQuery($sQuery,$sField)
    {
        if(isset($sQuery)){
         $db = Zend_Db_Table_Abstract::getDefaultAdapter();
         $stmt = $db->query('
                      SELECT
                       distinct '.$sField.'
                      FROM driver_address_history
                      WHERE '.$sField.' like "%'.$sQuery.'%"
        ');
         return $stmt->fetchAll();
        }else{
            return null;
        }
    }
}