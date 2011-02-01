<?php

class Report_Model_ReportAnnualReviewOfMotorVehicle extends Zend_Db_Table_Abstract
{
    protected $_name = 'report__annual_review_of_motor_vehicle';

    public static function getList($iDriverID=null)
    {
        $table = new Report_Model_ReportAnnualReviewOfMotorVehicle();
        if((int)$iDriverID==null){
            return null;
        }else{
            $row = $table->fetchAll("raromv_driver_id = ".$iDriverID," raromv_review_date ASC ");
        }
        $rowsetArray = $row->toArray();
        return $rowsetArray;
    }

    public function createRecord($mData)
    {
        $table = new Report_Model_ReportAnnualReviewOfMotorVehicle();
        return $table->insert($mData);
    }
    
    public static function getRecord($raromv_id)
    {
         $db = Zend_Db_Table_Abstract::getDefaultAdapter();
         $stmt = $db->query("
                SELECT
                    raromv_review_date,raromv_name_of_person_reviewing,raromv_driver_info,raromv_remarks,
                    d_Driver_SSN,d_First_Name,d_Middle_Name,d_Last_Name,d_Date_Of_Hire,
                    dah_Address1,dah_City,dah_Postal_Code,
                    s_name
                    FROM `report__annual_review_of_motor_vehicle`
                    LEFT JOIN driver ON report__annual_review_of_motor_vehicle.`raromv_driver_id` = driver.d_ID
                    LEFT JOIN driver_address_history ON report__annual_review_of_motor_vehicle.`raromv_driver_id` = driver_address_history.dah_Driver_ID AND dah_Current_Address = 'YES'
                    LEFT JOIN state ON driver_address_history.dah_State = state.s_id
                      WHERE raromv_driver_id = " . $raromv_id . "
                      ORDER BY raromv_review_date ASC

        ");
         $row = $stmt->fetchAll();
         return $row;
    }
}
