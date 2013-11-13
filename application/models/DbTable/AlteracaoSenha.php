<?php

/** 
 * Model DbTable AlteracaoSenha
 * 
 * @package Pesca
 * @subpackage Models/DbTable
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_DbTable_AlteracaoSenha extends Zend_Db_Table_Abstract
{

    protected $_name = 'T_AlteracaoSenha';
    protected $_primary = 'TAS_Token';
    
}

