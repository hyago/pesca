<?php

class MergulhoController extends Zend_Controller_Action
{

    public function init()
    {
       if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
    }

    public function indexAction()
    {
        // action body
    }


}

