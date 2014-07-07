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
        $this->modelUsuario = new Application_Model_Usuario();
    }

    public function indexAction()
    {
        // action body
    }
    public function novoAction()
    {
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $especies = $this->modelEspecies->selectCamarao(null, 'esp_nome_comum');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        
        $this->view->assign("pesqueiros", $pesqueiros);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
        $this->view->assign("barcos", $barcos);
        $this->view->assign("especies", $especies);
    }
    public function editarAction(){
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $especies = $this->modelEspecies->selectCamarao(null, 'esp_nome_comum');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        
        $this->view->assign("pesqueiros", $pesqueiros);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
        $this->view->assign("barcos", $barcos);
        $this->view->assign("especies", $especies);
    }

}

