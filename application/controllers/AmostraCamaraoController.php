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
        
        $this->modelPorto = new Application_Model_Porto();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelAmostraCamarao = new Application_Model_AmostraCamarao();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelEspecies = new Application_Model_Especie();
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

