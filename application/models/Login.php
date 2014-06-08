<?php

/** 
 * Model Login
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Login
{ 
     
    public function update($senha, $login)
    {
        $dbTableLogin = new Application_Model_DbTable_Login();
        
        $dadosLogin = array(
            'tl_hashsenha'  => $senha
        );
        
        $whereLogin = $dbTableLogin->getAdapter()->quoteInto('"tl_id" = ?', $login);
        
        $dbTableLogin->update($dadosLogin, $whereLogin);
    }
    
}