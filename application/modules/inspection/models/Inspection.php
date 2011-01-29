<?php
class Inspection_Model_Inspection extends NSC_Model_Validate
{
    protected $_name = 'inspection';

    protected $_fieldsValidationArray = array (
        'ins_id' => array(
            'label' => 'Inspection Identifier',
            'required' => true
        ),
        'ins_equipment_id' => array(
            'label' => 'Equipment',
            'required' => true
        ),
        'ins_start_date' => array(
            'label' => 'Start Date',
            'required' => true
        ),
        'ins_start_time' => array(
            'label' => 'Start Time',
            'required' => true
        ),
        'ins_entry_date' => array(
            'label' => 'Entry Date',
            'required' => true
        ),
        'ins_inspector_id' => array(
            'label' => 'Inspector',
            'required' => true
        ),
        'ins_type_id' => array(
            'label' => 'Type',
            'required' => true
        ),
        'ins_result_id' => array(
            'label' => 'Result',
            'required' => true
        ),
        'ins_next_date' => array(
            'label' => 'Next Date',
            'required' => true
        ),
        'ins_reinspection_date' => array(
            'label' => 'Reinspection Date',
            'required' => false
        ),
        'ins_diesel_inspection_information' => array(
            'label' => 'Diesel Inspection Information',
            'required' => false
        ),
        'ins_dot_regulated' => array(
            'label' => 'DOT Regulated',
            'required' => true
        )
    );

    public function getListByEquipment($equipmentId)
    {
        $result = null;

        if (!empty($equipmentId)) {
            $select = "SELECT *
                    FROM inspection
                    LEFT JOIN equipment ON ins_equipment_id = e_id
                    LEFT JOIN inspector ON ins_inspector_id = in_id
                    LEFT JOIN inspection_result ON ins_result_id = ir_id
                    LEFT JOIN inspection_types ON ins_type_id = it_id
                    WHERE ins_equipment_id = {$this->getDefaultAdapter()->quote($equipmentId)}
                ";

            $stmt = $this->getDefaultAdapter()->query($select);

            $rows = $stmt->fetchAll();

            if (is_array($rows) && count($rows)) {
                $result = $rows;
            }
        }

        return $result;
    }

    public function saveInspection($saveRow)
    {
        $validate_result = null;

        if (isset($saveRow['ins_id'])) {
            $rowTable = $this->fetchRow("ins_id = {$this->getDefaultAdapter()->quote($saveRow['ins_id'])}");
            if ($rowTable) {
                unset($saveRow['ins_id']);
            }
        } else {
            $rowTable = $this->createRow();
            $dateZend = new Zend_Date();
            $saveRow['ins_entry_date'] = $dateZend->toString('yyyy-MM-dd');
        }

        $validate_result = $this->validateFields($saveRow);
        $result = null;
        if (is_null($validate_result)) {
            foreach ($saveRow as $key => $value) {
                $rowTable[$key] = $value;
            }

            try {
                $rowTable->save();
                $result['row'] = $this->getRow($rowTable->ins_id);
            } catch (Exception $e){
                $result['saveError'] = $e->getMessage();
            }
        } else {
            $result['validationError'] = $validate_result;
        }

        return $result;
    }

    public function equipmentIsInspected($equipmentId)
    {
        $result = false;

        $select = "SELECT *
                    FROM inspection
                    LEFT JOIN equipment ON ins_equipment_id = e_id
                    LEFT JOIN inspection_types ON ins_type_id = it_id
                    WHERE ins_equipment_id = {$this->getDefaultAdapter()->quote($equipmentId)}
                    AND (it_type = 'Federal' OR it_type = 'State')
                ";
        $stmt = $this->getDefaultAdapter()->query($select);

        $rows = $stmt->fetchAll();

        if (is_array($rows) &&  count($rows)) {
             $result = true;
        }

        return $result;
    }

    /**
     * @author Andriy Ilnytskyi 19.11.2010
     *
     * Get all incpections from a storing.
     *
     * @return mixed
     */
    public function getList()
    {
        $select = $this->select();
        return $this->fetchAll($select);
    }

    private function getRow($inspectionId)
    {
        $result = null;

        if (!empty($inspectionId)) {
            $select = "SELECT *
                    FROM inspection
                    LEFT JOIN equipment ON ins_equipment_id = e_id
                    LEFT JOIN inspector ON ins_inspector_id = in_id
                    LEFT JOIN inspection_result ON ins_result_id = ir_id
                    LEFT JOIN inspection_types ON ins_type_id = it_id
                    WHERE ins_id = {$this->getDefaultAdapter()->quote($inspectionId)}
                ";
            $stmt = $this->getDefaultAdapter()->query($select);

            $rows = $stmt->fetchAll();

            if (is_array($rows) &&  1 === count($rows)) {
                $result = $rows[0];
            }
        }

        return $result;
    }

    public function deleteInspection($inspectionId)
    {
        $result = 0;

        if (!empty($inspectionId)) {
            $rowTable = $this->fetchRow("ins_id = {$this->getDefaultAdapter()->quote($inspectionId)}");
            if ($rowTable) {
                $result = $rowTable->delete();
            }
        }

        return $result;
    }

    public function getInspectionList($offset = 0, $count = 20, $filterOptions = null)
    {
        $limit = "LIMIT $offset, $count";
        $select  = "SELECT SQL_CALC_FOUND_ROWS *, CONCAT(in_first_name, ' ', in_last_name) as in_name FROM inspection";
        $join = " LEFT JOIN equipment ON ins_equipment_id = e_id
                    LEFT JOIN inspector ON ins_inspector_id = in_id
                    LEFT JOIN inspection_result ON ins_result_id = ir_id
                    LEFT JOIN inspection_types ON ins_type_id = it_id";
        $where = "";
        $orderBy = " ORDER BY ";

//        if (isset($filterOptions['Status'])) {
//            if ($filterOptions['Status'] != 'All') {
//                $where .= "WHERE sp_status = {$this->getDefaultAdapter()->quote($filterOptions['Status'])}";
//            }
//        }

        if (isset($filterOptions['SearchBy']) &&  $filterOptions['SearchBy'] != '-'
                && isset($filterOptions['SearchBy'])
                && isset($filterOptions['SearchText']) && !empty($filterOptions['SearchText'])) {

            $where .= empty($where) ? "WHERE " : " AND ";
            if (is_array($filterOptions['SearchBy'])) {
                for ($i = 0; $i < count($filterOptions['SearchBy']); $i++) {
                    if ($i > 0) {
                        $where .= ' OR ';
                    }
                    $where .= " {$filterOptions['SearchBy'][$i]} LIKE '%{$filterOptions['SearchText']}%' ";
                }
            } else {
                $where .= " {$filterOptions['SearchBy']} LIKE '%{$filterOptions['SearchText']}%' ";
            }
        }


        if (!isset($filterOptions['orderBy'])) {
            $filterOptions['orderBy'] = 'i_Status';
        }

        if (!isset($filterOptions['orderWay'])) {
            $filterOptions['orderWay'] = 'ASC';
        }

        if (is_array($filterOptions['orderBy'])) {
            for ($i = 0; $i < count($filterOptions['orderBy']); $i++) {
                if ($i > 0) {
                    $orderBy .= ' , ';
                }
                $orderBy .= " {$filterOptions['orderBy'][$i]} {$filterOptions['orderWay']}";
            }
        } else {
            $orderBy .= "{$filterOptions['orderBy']} {$filterOptions['orderWay']}";
        }

        $select .= " $join $where $orderBy $limit";

        $stmt = $this->getDefaultAdapter()->query($select);

        $result['limitList'] = $stmt->fetchAll();

        $select = 'SELECT FOUND_ROWS()';
        $stmt = $this->getDefaultAdapter()->query($select);
        $totalCount = $stmt->fetchAll();
        $result['totalCount'] = (isset($totalCount[0]['FOUND_ROWS()'])) ? $totalCount[0]['FOUND_ROWS()'] : $count;

        return $result;
    }
    
}