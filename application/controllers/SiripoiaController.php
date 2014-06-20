<?php

class SiripoiaController extends Zend_Controller_Action
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
        
        
        $this->modelSiripoia = new Application_Model_Siripoia();
        $this->modelMonitoramento = new Application_Model_Monitoramento();
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelSiripoia = new Application_Model_Siripoia();
        $this->modelPescador = new Application_Model_Pescador();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelEspecie = new Application_Model_Especie();
        $this->modelMare = new Application_Model_Mare();
        $this->modelIsca = new Application_Model_Isca();

    }

    public function indexAction()
    {
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select();
        $especies = $this->modelEspecie->select();
        $mare = $this->modelMare->select();
        
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('mare', $mare);
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
            $dados = $this->modelSiripoia->selectEntrevistaSiripoia("sir_id>=". $ent_id, array('sir_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelSiripoia->selectEntrevistaSiripoia("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'sir_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelSiripoia->selectEntrevistaSiripoia("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'sir_id'), 20);
          }
         else {
            $dados = $this->modelSiripoia->selectEntrevistaSiripoia(null, array( 'fd_id', 'tp_nome'), 20);
        }
        
        $this->view->assign("dados", $dados);
    }
    
    public function editarAction(){
         //$avistamentoSiripoia = new Application_Model_DbTable_VSiripoiaHasAvistamento();
        $entrevista = $this->modelSiripoia->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        //$avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');
        $mare = $this->modelMare->select();
        
        $idEntrevista = $this->_getParam('id');
        $datahoraSaida[] = split(" ",$entrevista['sir_dhsaida']);
        $datahoraVolta[] = split(" ",$entrevista['sir_dhvolta']);
        
        $vSiripoia = $this->modelSiripoia->selectSiripoiaHasPesqueiro('sir_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelSiripoia->selectSiripoiaHasEspCapturadas('sir_id='.$idEntrevista);
        
        //$vArrastoAvistamento = $this->modelSiripoia->selectSiripoiaHasAvistamento('sir_id='.$idEntrevista);
        
        //$this->view->assign('avistamentos', $avistamentos);
        //$this->view->assign('vArrastoAvistamento', $vArrastoAvistamento);
        $this->view->assign('mare', $mare);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('vSiripoia', $vSiripoia);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign('dataSaida', $datahoraSaida[0][0]);
        $this->view->assign('horaSaida', $datahoraSaida[0][1]);
        $this->view->assign('dataVolta', $datahoraVolta[0][0]);
        $this->view->assign('horaVolta', $datahoraVolta[0][1]);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);
    }
    public function criarAction(){
        $idSiripoia = $this->modelSiripoia->insert($this->_getAllParams());
        
        
        $this->_redirect('siripoia/editar/id/'.$idSiripoia);
    }
    public function atualizarAction(){
        $idSiripoia = $this->_getParam('id_entrevista');
        $this->modelSiripoia->update($this->_getAllParams());
        
        $this->_redirect('siripoia/editar/id/'.$idSiripoia);
    }
     public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        
        $pesqueiro = $this->_getParam("nomePesqueiro");
        
        $tempoapesqueiro = $this->_getParam("tempoAPesqueiro"); 
        
        $distanciapesqueiro = $this->_getParam("distAPesqueiro");
        
        $idEntrevista = $this->_getParam("id_entrevista");
        
        $backUrl = $this->_getParam("back_url");
       
        
        $this->modelSiripoia->insertPesqueiro($idEntrevista, $pesqueiro, $tempoapesqueiro, $distanciapesqueiro);

        $this->redirect("/siripoia/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasPesqueiro = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelSiripoia->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/siripoia/editar/id/" . $backUrl);
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
       
        
        $this->modelSiripoia->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/siripoia/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasEspecie = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelSiripoia->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/siripoia/editar/id/" . $backUrl);
    }

}

