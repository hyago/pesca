<?php

class UsuariosController extends Zend_Controller_Action
{

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
    }

    public function indexAction()
    {
        
    }


}

