<?php

class TarrafaController extends Zend_Controller_Action
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
        $this->modelTarrafa = new Application_Model_Tarrafa();
        $this->modelPescador = new Application_Model_Pescador();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelEspecie = new Application_Model_Especie();
    }

    public function indexAction()
    {
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select();
        $especies = $this->modelEspecie->select();
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));


        $this->view->assign('fichaDiaria', $fichadiaria);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('destinos', $destinos);
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
            $dados = $this->modelTarrafa->selectEntrevistaTarrafa("tar_id>=". $ent_id, array('tar_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelTarrafa->selectEntrevistaTarrafa("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'tar_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelTarrafa->selectEntrevistaTarrafa("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'tar_id'), 20);
          }
         else {
            $dados = $this->modelTarrafa->selectEntrevistaTarrafa(null, array( 'fd_id', 'tp_nome'), 20);
        }

        $this->view->assign("dados", $dados);
    }

    public function editarAction(){
        //$avistamentoTarrafa = new Application_Model_DbTable_VTarrafaHasAvistamento();
        $entrevista = $this->modelTarrafa->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        $avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');


        $idEntrevista = $this->_getParam('id');

        $vTarrafa = $this->modelTarrafa->selectTarrafaHasPesqueiro('tar_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelTarrafa->selectTarrafaHasEspCapturadas('tar_id='.$idEntrevista);

        $vTarrafaAvistamento = $this->modelTarrafa->selectTarrafaHasAvistamento('tar_id='.$idEntrevista);

        $this->view->assign('avistamentos', $avistamentos);
        $this->view->assign('vTarrafaAvistamento', $vTarrafaAvistamento);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('vTarrafa', $vTarrafa);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign('destinos', $destinos);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);
    }
    public function criarAction(){
        $idTarrafa = $this->modelTarrafa->insert($this->_getAllParams());


        $this->_redirect('tarrafa/editar/id/'.$idTarrafa);
    }
    public function atualizarAction(){
        $idTarrafa = $this->_getParam('id_entrevista');
        $this->modelTarrafa->update($this->_getAllParams());

        $this->_redirect('tarrafa/editar/id/'.$idTarrafa);
    }
    public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);


        $pesqueiro = $this->_getParam("nomePesqueiro");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");


        $this->modelTarrafa->insertPesqueiro($idEntrevista, $pesqueiro);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasPesqueiro = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelTarrafa->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
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


        $this->modelTarrafa->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasEspecie = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelSiripoia->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
    }
    public function insertavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $avistamento = $this->_getParam("SelectAvistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelTarrafa->insertAvistamento($idEntrevista, $avistamento);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
    }
    public function deleteavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idAvistamento = $this->_getParam("id_avistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelTarrafa->deleteAvistamento($idAvistamento, $idEntrevista);

        $this->redirect("/tarrafa/editar/id/" . $backUrl);
    }

    public function relatorioAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelTarrafa = new Application_Model_Tarrafa();
		$localTarrafa = $localModelTarrafa->selectEntrevistaTarrafa(NULL, array('fd_id', 'mnt_id', 'tar_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Tarrafa');
		$modeloRelatorio->setLegenda(30, 'Ficha');
		$modeloRelatorio->setLegenda(80, 'Monit.');
		$modeloRelatorio->setLegenda(130, 'Tarrafa');
		$modeloRelatorio->setLegenda(180, 'Pescador');
		$modeloRelatorio->setLegenda(350, 'Embarcação');

		foreach ( $localTarrafa as $key => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['fd_id']);
			$modeloRelatorio->setValueAlinhadoDireita(80, 40, $localData['mnt_id']);
			$modeloRelatorio->setValueAlinhadoDireita(130, 40, $localData['tar_id']);
			$modeloRelatorio->setValue(180, $localData['tp_nome']);
			$modeloRelatorio->setValue(350, $localData['bar_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		header("Content-Type: application/pdf");
		echo $pdf->render();
    }
   public function relatoriolistaAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelTarrafa = new Application_Model_Tarrafa();
		$localTarrafa = $localModelTarrafa->selectEntrevistaTarrafa(NULL, array('fd_id', 'mnt_id', 'tar_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Tarrafa');
		$modeloRelatorio->setLegendaOff();

		foreach ( $localTarrafa as $key => $localData ) {
			$modeloRelatorio->setLegValueAlinhadoDireita(30, 60, 'Ficha:', $localData['fd_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(90, 60, 'Monit.:',  $localData['mnt_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(150, 70, 'Tarrafa:', $localData['tar_id']);
			$modeloRelatorio->setLegValue(220, 'Pescador: ', $localData['tp_nome']);
			$modeloRelatorio->setLegValue(450, 'Barco: ', $localData['bar_nome']);
			$modeloRelatorio->setNewLine();

			$localPesqueiro = $localModelTarrafa->selectTarrafaHasPesqueiro('tar_id='.$localData['tar_id'], array('tar_id', 'paf_pesqueiro'), NULL);
			foreach ( $localPesqueiro as $key => $localDataPesqueiro ) {
				$modeloRelatorio->setLegValue(80, 'Pesqueiro: ',  $localDataPesqueiro['paf_pesqueiro']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Tempo (H:M):', date_format(date_create($localDataPesqueiro['t_tempoapesqueiro']), 'H:i'));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Distância:', number_format($localDataPesqueiro['t_distapesqueiro'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localEspecie = $localModelTarrafa->selectTarrafaHasEspCapturadas('tar_id='.$localData['tar_id'], array('tar_id', 'esp_nome_comum'), NULL);
			foreach ( $localEspecie as $key => $localDataEspecie ) {
				$modeloRelatorio->setLegValue(80, 'Espécie: ',  $localDataEspecie['esp_nome_comum']);
				$modeloRelatorio->setLegValueAlinhadoDireita(280, 60, 'Quant:', $localDataEspecie['spc_quantidade']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Peso(kg):', number_format($localDataEspecie['spc_peso_kg'], 2, ',', ' '));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Preço(R$/kg):', number_format($localDataEspecie['spc_preco'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localAvist = $localModelTarrafa->selectTarrafaHasAvistamento('tar_id='.$localData['tar_id'], array('tar_id', 'avs_descricao'), NULL);
			foreach ( $localAvist as $key => $localDataAvist ) {
				$modeloRelatorio->setLegValue(80, 'Avist.: ',  $localDataAvist['avs_descricao']);
				$modeloRelatorio->setNewLine();
			}
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_entrevista_tarrafa.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }
}
