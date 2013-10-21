<?php

class Application_Model_Usuario
{
    public function select($where = null, $order = null, $limit = null)
    {
        $dao = new Application_Model_DbTable_Usuario();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

}

