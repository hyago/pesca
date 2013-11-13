<?php

/** 
 * Model Perfil
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Perfil
{
    public function select()
    {
        $dao = new Application_Model_DbTable_Perfil();
        $select = $dao->select()->from($dao);

        return $dao->fetchAll($select)->toArray();
    }
    
}

