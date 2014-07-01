<?php

class AmostraCamaraoController extends Zend_Controller_Action
{

    public function init()
    {
               $this->modelUsuario = new Application_Model_Usuario();
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');


        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $ArrayIdentity = get_object_vars($identity);

        }


        $this->usuario = $this->modelUsuario->selectLogin($ArrayIdentity['tl_id']);
        $this->view->assign("usuario",$this->usuario);

    }

    public function indexAction()
    {
        // action body
    }
    public function novoAction()
    {
        // action body
    }
    public function editarAction(){
        
    }

}

