<?php

class Application_Model_Entrevistas
{
    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableEntrevista = new Application_Model_DbTable_VEntrevistas();
        $select = $this->dbTableEntrevista->select()
                ->from($this->dbTableEntrevista)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEntrevista->fetchAll($select)->toArray();
    }

}
