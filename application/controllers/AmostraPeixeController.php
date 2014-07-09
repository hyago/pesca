<?php

class AmostraPeixeController extends Zend_Controller_Action
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
        $this->modelAmostraPeixe = new Application_Model_AmostraPeixe();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelEspecies = new Application_Model_Especie();
        $this->modelUsuario = new Application_Model_Usuario();
        $this->modelSubamostra = new Application_Model_Subamostra();
        $this->modelUnidadePeixe = new Application_Model_UnidadePeixe();
        
    }

    public function indexAction()
    {
        $vAmostraPeixe = $this->modelAmostraPeixe->selectView();
        
        $this->view->assign('vAmostraPeixe', $vAmostraPeixe);
    }
    public function novoAction(){
        
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        
        $subamostras = $this->modelSubamostra->select(null, 'tp_nome');
        
        $this->view->assign('subamostras', $subamostras);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
        
    }
    public function criarAction(){
        $idAmostra = $this->modelAmostraPeixe->insert($this->getAllParams());
        
        $this->redirect('amostra-peixe/editar/id/'.$idAmostra);
    }
    public function atualizarAction() {
        $idAmostra = $this->_getParam('id_amostra');
        $this->modelAmostraPeixe->update($this->_getAllParams());

        $this->_redirect('amostra-peixe/editar/id/' . $idAmostra);
    }

    public function editarAction(){
        $amostragem = $this->modelAmostraPeixe->find($this->_getParam('id'));
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        $subamostras = $this->modelSubamostra->select(null, 'tp_nome');
        $especies = $this->modelEspecies->select(null, 'esp_nome_comum');
        
        $idAmostra = $this->_getParam('id');
        $unidadePeixe = $this->modelUnidadePeixe->select('tamp_id = '.$idAmostra, 'tup_id');
        
        $this->view->assign('amostragem', $amostragem);
        $this->view->assign('unidadePeixe', $unidadePeixe);
        $this->view->assign("especies", $especies);
        $this->view->assign('subamostras', $subamostras);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
    }
    public function insertunidadeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idAmostra = $this->_getParam("id_amostragem");

        $sexo = $this->_getParam("SelectSexo");

        $especie = $this->_getParam("SelectEspecie");

        $comprimento = $this->_getParam("comprimento");
        
        $peso = $this->_getParam("peso");

        $backUrl = $this->_getParam("back_url");

        $this->modelAmostraPeixe->insertUnidade($idAmostra, $sexo, $especie, $comprimento, $peso);

        $this->redirect("/amostra-peixe/editar/id/" . $backUrl);
    }
    public function deleteAction(){
        $this->modelAmostraPeixe->delete($this->_getParam('id'));

        $this->_redirect('amostra-peixe/index');
        
    }
    public function deleteunidadeAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idUnidade = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelAmostraPeixe->deleteUnidade($idUnidade);

        $this->redirect("/amostra-peixe/editar/id/" . $backUrl);
        
    }
}

