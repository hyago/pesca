<?php

/** 
 * Controller da página Index
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class IndexController extends Zend_Controller_Action
{
private $usuario;
    public function init()
    {   
        if(Zend_Auth::getInstance()->hasIdentity()){
            $this->_helper->layout->setLayout('admin');
        }      
    }

    public function indexAction()
    {
        
    }


}

