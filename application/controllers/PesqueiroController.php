<?php

class PesqueiroController extends Zend_Controller_Action
{

    public function init()
    {
         if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
    }

    public function indexAction()
    {
        // action body
    }
    public function novoAction(){
    
    }

}

