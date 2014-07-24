<?php

class AdministradorController extends Zend_Controller_Action
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
        
        $this->modelPescador = new Application_Model_Pescador();
    }

    public function indexAction()
    {
       if($this->usuario['tp_id']!=1){
            $this->_redirect('index');
        }
        else{
            $pescadorDeletado = $this->modelPescador->selectDeletado();
            
            
            $this->view->assign("pescadorDeletado", $pescadorDeletado);
        }
    }


}

