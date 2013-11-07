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

    public function init()
    {
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;        
    }

    public function indexAction()
    {
        
    }


}

