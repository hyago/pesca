<?php

class Application_Model_V_PescadorHasTelefoneModel
{
    private $db_V_PescadorHasTelefone;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->db_V_PescadorHasTelefone = new Application_Model_DbTable_V_PescadorHasTelefone();
        
        $select = $this->db_V_PescadorHasTelefone->select()->from($this->db_V_PescadorHasTelefone)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->db_V_PescadorHasTelefone->fetchAll($select)->toArray();
    }
    
}

