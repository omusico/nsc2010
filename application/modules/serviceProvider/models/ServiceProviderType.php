<?php
class ServiceProvider_Model_ServiceProviderType extends Zend_Db_Table_Abstract
{
    protected $_name = 'service_provider_types';

    public function getList()
    {
        $select = $this->select()
                    ->order('spt_id');
        return $this->fetchAll($select);
    }
}