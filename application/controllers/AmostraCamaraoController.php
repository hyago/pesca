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
        $this->modelSubamostra = new Application_Model_Subamostra();
        $this->modelUnidadeCamarao = new Application_Model_UnidadeCamarao();
        $this->modelMaturidade = new Application_Model_Maturidade();
    }

    public function indexAction()
    {
        $vAmostraCamarao = $this->modelAmostraCamarao->selectView();
        
        $this->view->assign('vAmostraCamarao', $vAmostraCamarao);
    }
    public function novoAction()
    {
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $especies = $this->modelEspecies->selectCamarao(null, 'esp_nome_comum');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $subamostras = $this->modelSubamostra->select(null, 'tp_nome');
        
        $this->view->assign('subamostras', $subamostras);
        $this->view->assign("pesqueiros", $pesqueiros);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
        $this->view->assign("barcos", $barcos);
        $this->view->assign("especies", $especies);
    }
    
    public function criarAction(){
        $idAmostra = $this->modelAmostraCamarao->insert($this->getAllParams());
        
        $this->redirect('amostra-camarao/editar/id/'.$idAmostra);
    }
    public function atualizarAction() {
        $idAmostra = $this->_getParam('id_amostra');
        $this->modelAmostraCamarao->update($this->_getAllParams());

        $this->_redirect('amostra-camarao/editar/id/' . $idAmostra);
    }
    public function editarAction(){
        $amostragem = $this->modelAmostraCamarao->find($this->_getParam('id'));
        $users = $this->modelUsuario->select(null, 'tu_nome');
        $portos = $this->modelPorto->select(null, 'pto_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $especies = $this->modelEspecies->selectCamarao(null, 'esp_nome_comum');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $subamostras = $this->modelSubamostra->select(null, 'tp_nome');
        $idAmostra = $this->_getParam('id');
        $unidadeCamarao = $this->modelUnidadeCamarao->select('tamc_id = '.$idAmostra);
        $maturidade = $this->modelMaturidade->select(null, 'tmat_tipo');
        
        $this->view->assign('maturidade', $maturidade);
        $this->view->assign('unidadeCamarao', $unidadeCamarao);
        $this->view->assign('subamostras', $subamostras);
        $this->view->assign("amostragem", $amostragem);
        $this->view->assign("pesqueiros", $pesqueiros);
        $this->view->assign("users", $users);
        $this->view->assign("dados_porto", $portos);
        $this->view->assign("barcos", $barcos);
        $this->view->assign("especies", $especies);
    }
    public function insertunidadeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idAmostra = $this->_getParam("id_amostragem");

        $sexo = $this->_getParam("SelectSexo");

        $maturidade = $this->_getParam("SelectMaturidade");

        $compCabeca = $this->_getParam("comprimentoCabeca");
        
        $peso = $this->_getParam("peso");

        $backUrl = $this->_getParam("back_url");

        $this->modelAmostraCamarao->insertUnidade($idAmostra, $sexo, $maturidade, $compCabeca, $peso);

        $this->redirect("/amostra-camarao/editar/id/" . $backUrl);
    }
    public function deleteAction(){
        $this->modelAmostraCamarao->delete($this->_getParam('id'));

        $this->_redirect('amostra-camarao/index');
        
    }
    public function deleteunidadeAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idUnidade = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelAmostraCamarao->deleteUnidade($idUnidade);

        $this->redirect("/amostra-camarao/editar/id/" . $backUrl);
    }
}

