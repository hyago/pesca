<?php

class ContatoController extends Zend_Controller_Action
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

