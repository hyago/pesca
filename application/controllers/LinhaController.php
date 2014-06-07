<?php

class LinhaController extends Zend_Controller_Action
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
        $this->usuario = $this->modelUsuario->find($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        
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
        
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        
    
    }

    public function editarAction(){
        $entrevistaHasPesqueiro = new Application_Model_DbTable_LinhaHasPesqueiro();
        $entrevista = $this->modelLinha->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        
        
        $idEntrevista = $this->_getParam('id');
        
        $vLinha = $this->modelLinha->selectLinhaHasPesqueiro('lin_id='.$idEntrevista);
        
        $vEspecieCapturadas = $this->modelLinha->selectLinhaHasEspCapturadas('lin_id='.$idEntrevista);
        
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('entrevisstaHasPesqueiro', $entrevistaHasPesqueiro);
        $this->view->assign('vLinha', $vLinha);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);
    }

    public function visualizarAction(){
        $ent_id = $this->_getParam("ent_id");
        $ent_pescador = $this->_getParam("tp_nome");
        $ent_barco = $this->_getParam("bar_nome");
        
        if ( $ent_id > 0 ) {
            $dados = $this->modelLinha->selectEntrevistaLinha("lin_id>=". $ent_id, array('lin_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelLinha->selectEntrevistaLinha("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'lin_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelLinha->selectEntrevistaLinha("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'lin_id'), 20);
          }
         else {
            $dados = $this->modelLinha->selectEntrevistaLinha(null, array( 'fd_id', 'tp_nome'), 20);
        }
        
        $this->view->assign("dados", $dados);
    }
    
    public function criarAction(){
        $idLinha = $this->modelLinha->insert($this->_getAllParams());
        
        
        $this->_redirect('linha/editar/id/'.$idLinha);
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
    public function insertespeciecapturadaAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        
        $especie = $this->_getParam("selectEspecie");
        
        $quantidade = $this->_getParam("quantidade"); 
        
        $peso = $this->_getParam("peso");
        
        $preco = $this->_getParam("precokg");
        
        $idEntrevista = $this->_getParam("id_entrevista");
        
        $backUrl = $this->_getParam("back_url");
       
        
        $this->modelLinha->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/linha/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasEspecie = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelLinha->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/linha/editar/id/" . $backUrl);
    }
}

