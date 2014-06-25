<?php

class MergulhoController extends Zend_Controller_Action
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
        $this->modelMergulho = new Application_Model_Mergulho();
        $this->modelPescador = new Application_Model_Pescador();
        $this->modelBarcos = new Application_Model_Barcos();
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        $this->modelEspecie = new Application_Model_Especie();
        $this->modelMare = new Application_Model_Mare();
    }

    public function indexAction()
    {
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select();
        $especies = $this->modelEspecie->select();
        $mare = $this->modelMare->select();
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');
        $monitoramento = $this->modelMonitoramento->find($this->_getParam("idMonitoramento"));
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));

        $this->view->assign('destinos', $destinos);
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
            $dados = $this->modelMergulho->selectEntrevistaMergulho("mer_id>=". $ent_id, array('mer_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelMergulho->selectEntrevistaMergulho("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'mer_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelMergulho->selectEntrevistaMergulho("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'mer_id'), 20);
          }
         else {
            $dados = $this->modelMergulho->selectEntrevistaMergulho(null, array( 'fd_id', 'tp_nome'), 20);
        }

        $this->view->assign("dados", $dados);
    }

    public function editarAction(){
        //$avistamentoMergulho = new Application_Model_DbTable_VMergulhoHasAvistamento();
        $entrevista = $this->modelMergulho->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select();
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select();
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        $avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');
        $mare = $this->modelMare->select();
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');


        $idEntrevista = $this->_getParam('id');
        $datahoraSaida[] = split(" ",$entrevista['mer_dhsaida']);
        $datahoraVolta[] = split(" ",$entrevista['mer_dhvolta']);

        $vMergulho = $this->modelMergulho->selectMergulhoHasPesqueiro('mer_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelMergulho->selectMergulhoHasEspCapturadas('mer_id='.$idEntrevista);

        $vMergulhoAvistamento = $this->modelMergulho->selectMergulhoHasAvistamento('mer_id='.$idEntrevista);

        $this->view->assign('destinos', $destinos);
        $this->view->assign('avistamentos', $avistamentos);
        $this->view->assign('vMergulhoAvistamento', $vMergulhoAvistamento);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('vMergulho', $vMergulho);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign('dataSaida', $datahoraSaida[0][0]);
        $this->view->assign('horaSaida', $datahoraSaida[0][1]);
        $this->view->assign('dataVolta', $datahoraVolta[0][0]);
        $this->view->assign('horaVolta', $datahoraVolta[0][1]);
        $this->view->assign('mare', $mare);
        $this->view->assign('pescadores',$pescadores);
        $this->view->assign('barcos',$barcos);
        $this->view->assign('tipoEmbarcacoes',$tipoEmbarcacoes);
        $this->view->assign('pesqueiros',$pesqueiros);
        $this->view->assign('especies',$especies);


    }

    public function criarAction(){
        $idMergulho = $this->modelMergulho->insert($this->_getAllParams());


        $this->_redirect('mergulho/editar/id/'.$idMergulho);
    }
    public function atualizarAction(){
        $idMergulho = $this->_getParam('id_entrevista');
        $this->modelMergulho->update($this->_getAllParams());

        $this->_redirect('mergulho/editar/id/'.$idMergulho);
    }

    public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);


        $pesqueiro = $this->_getParam("nomePesqueiro");

        $tempoapesqueiro = $this->_getParam("tempoAPesqueiro");

        $distanciapesqueiro = $this->_getParam("distAPesqueiro");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");


        $this->modelMergulho->insertPesqueiro($idEntrevista, $pesqueiro, $tempoapesqueiro, $distanciapesqueiro);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasPesqueiro = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelMergulho->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
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


        $this->modelMergulho->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasEspecie = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelMergulho->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
    }
    public function insertavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $avistamento = $this->_getParam("SelectAvistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelMergulho->insertAvistamento($idEntrevista, $avistamento);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
    }
    public function deleteavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idAvistamento = $this->_getParam("id_avistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelMergulho->deleteAvistamento($idAvistamento, $idEntrevista);

        $this->redirect("/mergulho/editar/id/" . $backUrl);
    }

    public function relatorioAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelMergulho = new Application_Model_Mergulho();
		$localMergulho = $localModelMergulho->selectEntrevistaMergulho(NULL, array('fd_id', 'mnt_id', 'mer_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Mergulho');
		$modeloRelatorio->setLegenda(30, 'Ficha');
		$modeloRelatorio->setLegenda(80, 'Monit.');
		$modeloRelatorio->setLegenda(130, 'Mergulho');
		$modeloRelatorio->setLegenda(180, 'Pescador');
		$modeloRelatorio->setLegenda(350, 'Embarcação');

		foreach ( $localMergulho as $key => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['fd_id']);
			$modeloRelatorio->setValueAlinhadoDireita(80, 40, $localData['mnt_id']);
			$modeloRelatorio->setValueAlinhadoDireita(130, 40, $localData['mer_id']);
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

		$localModelMergulho = new Application_Model_Mergulho();
		$localMergulho = $localModelMergulho->selectEntrevistaMergulho(NULL, array('fd_id', 'mnt_id', 'mer_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Mergulho');
		$modeloRelatorio->setLegendaOff();

		foreach ( $localMergulho as $key => $localData ) {
			$modeloRelatorio->setLegValueAlinhadoDireita(30, 60, 'Ficha:', $localData['fd_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(90, 60, 'Monit.:',  $localData['mnt_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(150, 70, 'Mergulho:', $localData['mer_id']);
			$modeloRelatorio->setLegValue(220, 'Pescador: ', $localData['tp_nome']);
			$modeloRelatorio->setLegValue(450, 'Barco: ', $localData['bar_nome']);
			$modeloRelatorio->setNewLine();

			$localPesqueiro = $localModelMergulho->selectMergulhoHasPesqueiro('mer_id='.$localData['mer_id'], array('mer_id', 'paf_pesqueiro'), NULL);
			foreach ( $localPesqueiro as $key => $localDataPesqueiro ) {
				$modeloRelatorio->setLegValue(80, 'Pesqueiro: ',  $localDataPesqueiro['paf_pesqueiro']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Tempo (H:M):', date_format(date_create($localDataPesqueiro['t_tempoapesqueiro']), 'H:i'));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Distância:', number_format($localDataPesqueiro['t_distapesqueiro'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localEspecie = $localModelMergulho->selectMergulhoHasEspCapturadas('mer_id='.$localData['mer_id'], array('mer_id', 'esp_nome_comum'), NULL);
			foreach ( $localEspecie as $key => $localDataEspecie ) {
				$modeloRelatorio->setLegValue(80, 'Espécie: ',  $localDataEspecie['esp_nome_comum']);
				$modeloRelatorio->setLegValueAlinhadoDireita(280, 60, 'Quant:', $localDataEspecie['spc_quantidade']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Peso(kg):', number_format($localDataEspecie['spc_peso_kg'], 2, ',', ' '));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Preço(R$/kg):', number_format($localDataEspecie['spc_preco'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localAvist = $localModelMergulho->selectMergulhoHasAvistamento('mer_id='.$localData['mer_id'], array('mer_id', 'avs_descricao'), NULL);
			foreach ( $localAvist as $key => $localDataAvist ) {
				$modeloRelatorio->setLegValue(80, 'Avist.: ',  $localDataAvist['avs_descricao']);
				$modeloRelatorio->setNewLine();
			}
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_entrevista_mergulho.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }
}
