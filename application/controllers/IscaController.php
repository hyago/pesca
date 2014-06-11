<?php

class IscaController extends Zend_Controller_Action
{
    private $usuario;
    public function init()
    {   
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $identity2 = get_object_vars($identity);
          
        }
        
        $this->modelUsuario = new Application_Model_Usuario();
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        $this->modelIsca = new Application_Model_Isca();
    }

    public function indexAction()
    {
        $dadosIsca = $this->modelIsca->select(NULL, 'isc_tipo', NULL);

        $this->view->assign("dadosIscas", $dadosIsca);
    }
    public function criarAction(){
        
    }
    public function excluirAction(){
        
    }

}

