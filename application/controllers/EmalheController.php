<?php

class EmalheController extends Zend_Controller_Action
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
        
        
        
        $this->modelMonitoramento = new Application_Model_Monitoramento();
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelEmalhe = new Application_Model_Emalhe();
        $this->modelPescador = new Application_Model_Pescador();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelEspecie = new Application_Model_Especie();
    }

    public function indexAction()
    {
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select(null, 'tte_tipoembarcacao');
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);

    
    }

    public function visualizarAction(){
        $ent_id = $this->_getParam("ent_id");
        $ent_pescador = $this->_getParam("tp_nome");
        $ent_barco = $this->_getParam("bar_nome");
        
        if ( $ent_id > 0 ) {
            $dados = $this->modelEmalhe->selectEntrevistaEmalhe("em_id>=". $ent_id, array('em_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelEmalhe->selectEntrevistaEmalhe("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'em_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelEmalhe->selectEntrevistaEmalhe("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'em_id'), 20);
          }
         else {
            $dados = $this->modelEmalhe->selectEntrevistaEmalhe(null, array( 'fd_id', 'tp_nome'), 20);
        }
        
        $this->view->assign("dados", $dados);
    }
    
    public function editarAction(){
        //$avistamentoEmalhe = new Application_Model_DbTable_VEmalheHasAvistamento();
        $entrevista = $this->modelEmalhe->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select(null, 'tte_tipoembarcacao');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        //$avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');
        
        
        $idEntrevista = $this->_getParam('id');
        $datahoraSaida[] = split(" ",$entrevista['em_dhlancamento']);
        $datahoraVolta[] = split(" ",$entrevista['em_dhrecolhimento']);
        
        $vEmalhe = $this->modelEmalhe->selectEmalheHasPesqueiro('em_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelEmalhe->selectEmalheHasEspCapturadas('em_id='.$idEntrevista);
        
        //$vArrastoAvistamento = $this->modelEmalhe->selectEmalheHasAvistamento('em_id='.$idEntrevista);
        
        //$this->view->assign('avistamentos', $avistamentos);
        //$this->view->assign('vArrastoAvistamento', $vArrastoAvistamento);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('vEmalhe', $vEmalhe);
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
        $idEmalhe = $this->modelEmalhe->insert($this->_getAllParams());
        
        
        $this->_redirect('emalhe/editar/id/'.$idEmalhe);
    }
    public function atualizarAction(){
        $idEmalhe = $this->_getParam('id_entrevista');
        $this->modelEmalhe->update($this->_getAllParams());
        
        $this->_redirect('emalhe/editar/id/'.$idEmalhe);
    }
    public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        
        $pesqueiro = $this->_getParam("nomePesqueiro"); 
        
        $idEntrevista = $this->_getParam("id_entrevista");
        
        $backUrl = $this->_getParam("back_url");
       
        
        $this->modelEmalhe->insertPesqueiro($idEntrevista, $pesqueiro);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasPesqueiro = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelEmalhe->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
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
       
        
        $this->modelEmalhe->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idEntrevistaHasEspecie = $this->_getParam("id");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelEmalhe->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
    }
    

}

