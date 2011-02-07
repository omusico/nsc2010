<?php
class Driver_Model_DriverAddressHistory extends Zend_Db_Table_Abstract
{
  protected $_name = 'driver_address_history';


    public function getList($iDriverID=null)
    {
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        if((int)$iDriverID==null){
            $stmt = $db->query('
                          SELECT
                           *
                          FROM driver_address_history
                            LEFT JOIN state on state.s_id = dah_State
                          WHERE dah_ID <> 0
                          ORDER BY dah_row_created DESC
            ');
        }else{
            $stmt = $db->query('
                          SELECT
                           *
                          FROM driver_address_history
                            LEFT JOIN state on state.s_id = dah_State
                          WHERE dah_Driver_ID = '.$iDriverID.' 
                          ORDER BY dah_row_created DESC
            ');
        }
        return $stmt->fetchAll();
    }

    public function getRecord($dah_ID)
    {
        $row = $this->fetchRow($this->select()->where('dah_id = ?',$dah_ID));
        if($row==null){return false;}
        return $row->toArray();
    }

    public function createRecord($mData)
    {
        $table = new Driver_Model_DriverAddressHistory();
        return $table->insert($mData);
    }

    public function deleteRecord($iRecord)
    {
        $table = new Driver_Model_DriverAddressHistory();
        return $table->delete("dah_ID =".$iRecord);
    }

    public function updateRecord($mData)
    {
        unset($mData['PHPSESSID']);
        $db = new Driver_Model_DriverAddressHistory();
        $w = 'dah_ID = '.$mData['dah_ID'];
        return $db->update($mData,$w);
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
     /**
     * @author Vlad Skachkov 25.12.2010
     *
     * count total living time for current driver.
     * @int $dah_Driver_ID
     * @return integer
     */
    public static function getTotalAddressHistoryTime($dah_Driver_ID)
    {
        if(isset($dah_Driver_ID)){
         $db = Zend_Db_Table_Abstract::getDefaultAdapter();
         $stmt = $db->query('
                SELECT sum( unix_timestamp( `dah_End_Date` ) - unix_timestamp( `dah_Start_Date` ) ) /60 /60 /24 /365 AS `total_living_time`
                FROM `driver_address_history`
                WHERE dah_Driver_ID = '.$dah_Driver_ID.'
        ');
         return $stmt->fetchAll();
        }else{
            return 0;
        }
    }
}