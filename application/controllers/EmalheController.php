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

        $this->modelDestinoPescado = new Application_Model_DestinoPescado();
        $this->modelAvistamento = new Application_Model_Avistamento();
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
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');


        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('destinos', $destinos);
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
        $avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');


        $idEntrevista = $this->_getParam('id');
        $datahoraSaida[] = split(" ",$entrevista['em_dhlancamento']);
        $datahoraVolta[] = split(" ",$entrevista['em_dhrecolhimento']);

        $vEmalhe = $this->modelEmalhe->selectEmalheHasPesqueiro('em_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelEmalhe->selectEmalheHasEspCapturadas('em_id='.$idEntrevista);

        $vEmalheAvistamento = $this->modelEmalhe->selectEmalheHasAvistamento('em_id='.$idEntrevista);

        $this->view->assign('destinos', $destinos);
        $this->view->assign('avistamentos', $avistamentos);
        $this->view->assign('vEmalheAvistamento', $vEmalheAvistamento);
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
    public function excluirAction() {
        $this->modelEmalhe->delete($this->_getParam('id'));
        
        $this->_redirect('emalhe/visualizar');
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
    public function insertavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $avistamento = $this->_getParam("SelectAvistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelEmalhe->insertAvistamento($idEntrevista, $avistamento);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
    }
    public function deleteavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idAvistamento = $this->_getParam("id_avistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelEmalhe->deleteAvistamento($idAvistamento, $idEntrevista);

        $this->redirect("/emalhe/editar/id/" . $backUrl);
    }
    public function relatoriolistaAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelEmalhe = new Application_Model_Emalhe();
		$localEmalhe = $localModelEmalhe->selectEntrevistaEmalhe(NULL, array('fd_id', 'mnt_id', 'em_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Emalhe');
		$modeloRelatorio->setLegenda(30, 'Ficha');
		$modeloRelatorio->setLegenda(80, 'Monit.');
		$modeloRelatorio->setLegenda(130, 'Emalhe');
		$modeloRelatorio->setLegenda(180, 'Pescador');
		$modeloRelatorio->setLegenda(350, 'Embarcação');

		foreach ( $localEmalhe as $key => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['fd_id']);
			$modeloRelatorio->setValueAlinhadoDireita(80, 40, $localData['mnt_id']);
			$modeloRelatorio->setValueAlinhadoDireita(130, 40, $localData['em_id']);
			$modeloRelatorio->setValue(180, $localData['tp_nome']);
			$modeloRelatorio->setValue(350, $localData['bar_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_lista_entrevista_emalhe.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }

    public function relatorioAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelEmalhe = new Application_Model_Emalhe();
		$localEmalhe = $localModelEmalhe->selectEntrevistaEmalhe(NULL, array('fd_id', 'mnt_id', 'em_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Emalhe');
		$modeloRelatorio->setLegendaOff();

		foreach ( $localEmalhe as $key => $localData ) {
			$modeloRelatorio->setLegValueAlinhadoDireita(30, 60, 'Ficha:', $localData['fd_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(90, 60, 'Monit.:',  $localData['mnt_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(150, 70, 'Emalhe:', $localData['em_id']);
			$modeloRelatorio->setLegValue(220, 'Pescador: ', $localData['tp_nome']);
			$modeloRelatorio->setLegValue(450, 'Barco: ', $localData['bar_nome']);
			$modeloRelatorio->setNewLine();

			$localPesqueiro = $localModelEmalhe->selectEmalheHasPesqueiro('em_id='.$localData['em_id'], array('em_id', 'paf_pesqueiro'), NULL);
			foreach ( $localPesqueiro as $key => $localDataPesqueiro ) {
				$modeloRelatorio->setLegValue(80, 'Pesqueiro: ',  $localDataPesqueiro['paf_pesqueiro']);

				$modeloRelatorio->setNewLine();
			}
			$localEspecie = $localModelEmalhe->selectEmalheHasEspCapturadas('em_id='.$localData['em_id'], array('em_id', 'esp_nome_comum'), NULL);
			foreach ( $localEspecie as $key => $localDataEspecie ) {
				$modeloRelatorio->setLegValue(80, 'Espécie: ',  $localDataEspecie['esp_nome_comum']);
				$modeloRelatorio->setLegValueAlinhadoDireita(280, 60, 'Quant:', $localDataEspecie['spc_quantidade']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Peso(kg):', number_format($localDataEspecie['spc_peso_kg'], 2, ',', ' '));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Preço(R$/kg):', number_format($localDataEspecie['spc_preco'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localAvist = $localModelEmalhe->selectEmalheHasAvistamento('em_id='.$localData['em_id'], array('em_id', 'avs_descricao'), NULL);
			foreach ( $localAvist as $key => $localDataAvist ) {
				$modeloRelatorio->setLegValue(80, 'Avist.: ',  $localDataAvist['avs_descricao']);
				$modeloRelatorio->setNewLine();
			}
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_entrevista_emalhe.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }
}
