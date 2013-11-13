<?php

/** 
 * Controller da página Equipe
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class EquipeController extends Zend_Controller_Action
{

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

