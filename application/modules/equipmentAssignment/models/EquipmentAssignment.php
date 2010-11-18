<?php
class EquipmentAssignment_Model_EquipmentAssignment extends Zend_Db_Table_Abstract
{
    protected $_name = 'equipment_assignment';

    public function getAssignment($equipmentId)
    {
        $select = "SELECT *
            FROM equipment_assignment
            LEFT JOIN homebase ON ea_homebase_id = h_id
            LEFT JOIN company ON ea_company_id = c_id
            LEFT JOIN equipment ON ea_equipment_id = e_id
            LEFT JOIN equipment_owner ON ea_owner_id = eo_id
            LEFT JOIN driver ON ea_driver_id = d_ID
            LEFT JOIN service_provider__equipment_assignment ON e_id = spea_Equipment_id
            LEFT JOIN service_provider ON spea_Service_Provider_ID = sp_ID
            LEFT JOIN inspection ON e_id = i_Equipment_ID
            LEFT JOIN equipment_maintenance ON e_id = em_Equipment_ID
            LEFT JOIN incident__passenger ON e_id = ip_Equipment_Number
            where e_id = $equipmentId
        ";

        $stmt = $this->getDefaultAdapter()->query($select);
        $assignmentRow = $stmt->fetch();
        return $assignmentRow;
    }

    /**
     * @author Andriy Ilnytskyi 16.11.2010
     *
     * Get all equipment assignments from a storing.
     *
     * @return mixed
     */
    public function getList()
    {
        $select = $this->select();
        return $this->fetchAll($select);
    }
}
