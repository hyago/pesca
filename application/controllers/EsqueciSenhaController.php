<?php

class EsqueciSenhaController extends Zend_Controller_Action
{

    public function init()
    {
        
    }

    public function indexAction()
    {
        
    }
    
    public function solicitarAction()
    {
        $email = $this->_getParam('email');
        
        $data = date('dmYHisu');
        $token = sha1($data);
    }
}

