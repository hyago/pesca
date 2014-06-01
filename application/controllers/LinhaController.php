<?php

class LinhaController extends Zend_Controller_Action
{

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelMonitoramento = new Application_Model_Monitoramento();
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelLinha = new Application_Model_Linha();
        $this->modelPescador = new Application_Model_Pescador();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelEspecie = new Application_Model_Especie();
        $this->modelIsca = new Application_Model_Isca();
        
    }

    public function indexAction()
    {
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select();
        $especies = $this->modelEspecie->select();
        $iscas = $this->modelIsca->select();
        
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('iscas', $iscas);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);
    
    }

    public function visualizarAction(){
        
    }
    
     
    public function editarAction(){
        $entrevistaHasPesqueiro = new Application_Model_DbTable_LinhaHasPesqueiro();
        $entrevista = $this->modelLinha->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        
        $idEntrevista = $this->_getParam('id');
        
        $vLinha = $this->modelLinha->selectLinhaHasPesqueiro('lin_id='.$idEntrevista);
        
        $this->view->assign('entrevisstaHasPesqueiro', $entrevistaHasPesqueiro);
        $this->view->assign('vLinha', $vLinha);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);
        
    }
    
    public function criarAction(){
        
        $this->modelLinha->insert($this->_getAllParams());
        $id = $this->modelLinha->selectId();
        $this->_redirector = $this->_helper->getHelper('Redirector');

        $value = array_shift($id);
        $this->_redirector->gotoSimple('editar', 'linha', null, array('id' => $value));
    }
    
    public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        
        $pesqueiro = $this->_getParam("nomePesqueiro");
        
        $tempoapesqueiro = $this->_getParam("tempoAPesqueiro"); 
        
        $idEntrevista = $this->_getParam("id_entrevista");
        
        $backUrl = $this->_getParam("back_url");
       
        
        $this->modelLinha->insertPesqueiro($idEntrevista, $pesqueiro, $tempoapesqueiro);

        $this->redirect("/linha/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasPesqueiro = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelLinha->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/linha/editar/id/" . $backUrl);
    }

}

