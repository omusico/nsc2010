<?php
class Inspector_Model_Inspector extends NSC_Model_Validate
{
    protected $_name = 'inspector';

    protected $_fieldsValidationArray = array (
        'in_id' => array(
            'label' => 'Inspector Identifier',
            'required' => true
        ),
        'in_first_name' => array(
            'label' => 'First Name',
            'required' => true
        ),
        'in_last_name' => array(
            'label' => 'Last Name',
            'required' => true
        ),
        'in_certificate' => array(
            'label' => 'Certificate',
            'required' => false
        ),
        'in_service_provider_id' => array(
            'label' => 'Service Provider',
            'required' => true
        )
    );

    public function getList()
    {
        $select = $this->select();
        return $this->fetchAll($select);
    }

    private function getRow($inspectorId)
    {
        $result = null;

        if (!empty($inspectorId)) {
            $select = "SELECT *
                    FROM inspector
                    LEFT JOIN service_provider ON in_service_provider_id = sp_id
                    WHERE in_id = {$this->getDefaultAdapter()->quote($inspectorId)}
                ";
            $stmt = $this->getDefaultAdapter()->query($select);

            $rows = $stmt->fetchAll();

            if (is_array($rows) &&  1 === count($rows)) {
                $result = $rows[0];
            }
        }

        return $result;
    }

    public function saveInspector($saveRow)
    {
        $validate_result = null;

        if (isset($saveRow['in_id'])) {
            $rowTable = $this->fetchRow("in_id = {$this->getDefaultAdapter()->quote($saveRow['in_id'])}");
            if ($rowTable) {
                unset($saveRow['in_id']);
            }
        } else {
            $rowTable = $this->createRow();
        }

        $validate_result = $this->validateFields($saveRow);
        $result = null;
        if (is_null($validate_result)) {
            foreach ($saveRow as $key => $value) {
                $rowTable[$key] = $value;
            }

            try {
                $rowTable->save();
                $result['row'] = $this->getRow($rowTable->in_id);
            } catch (Exception $e){
                $result['saveError'] = $e->getMessage();
            }
        } else {
            $result['validationError'] = $validate_result;
        }

        return $result;
    }
}