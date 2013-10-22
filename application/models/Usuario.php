<?php

/** 
 * Model de usuários
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

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
    
    public function find($id)
    {
        $dao = new Application_Model_DbTable_Usuario();
        $arr = $dao->find($id)->toArray();
        return $arr[0];
    }

}