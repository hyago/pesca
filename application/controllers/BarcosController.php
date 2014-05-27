<?php

class BarcosController extends Zend_Controller_Action
{

    public function init()
    {
       if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelBarcos = new Application_Model_Barcos();
    }

    public function indexAction()
    {
        $barcos = $this->modelBarcos->select();
        
        $this->view->assign("barcos", $barcos);
    }
    
    public function novoAction(){
        
    }
    public function criarAction(){
        $this->modelBarcos->insert($this->getAllParams());
        
        $this->_redirect("barcos/index");
    }

}

