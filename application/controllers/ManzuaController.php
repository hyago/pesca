<?php

class ManzuaController extends Zend_Controller_Action
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
        $this->modelManzua = new Application_Model_Manzua();
        $this->modelMonitoramento = new Application_Model_Monitoramento();
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelManzua = new Application_Model_Manzua();
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
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select(null, 'tte_tipoembarcacao');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome');
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
            $dados = $this->modelManzua->selectEntrevistaManzua("man_id>=". $ent_id, array('man_id'), 20);
        } elseif ( $ent_pescador ) {
            $dados = $this->modelManzua->selectEntrevistaManzua("tp_nome LIKE '". $ent_pescador."%'", array('tp_nome', 'man_id'), 20);
         }
          elseif ($ent_barco){
              $dados = $this->modelManzua->selectEntrevistaManzua("bar_nome LIKE '".$ent_pescador."%'", array('bar_nome', 'man_id'), 20);
          }
         else {
            $dados = $this->modelManzua->selectEntrevistaManzua(null, array( 'fd_id', 'tp_nome'), 20);
        }

        $this->view->assign("dados", $dados);
    }
    public function editarAction(){
        $entrevista = $this->modelManzua->find($this->_getParam('id'));
        $pescadores = $this->modelPescador->select(null, 'tp_nome');
        $barcos = $this->modelBarcos->select(null, 'bar_nome');
        $tipoEmbarcacoes = $this->modelTipoEmbarcacao->select(null, 'tte_tipoembarcacao');
        $pesqueiros = $this->modelPesqueiro->select(null, 'paf_pesqueiro');
        $especies = $this->modelEspecie->select(null, 'esp_nome_comum');
        $monitoramento = $this->modelMonitoramento->find($entrevista['mnt_id']);
        $avistamentos = $this->modelAvistamento->select(null, 'avs_descricao');
        $destinos = $this->modelDestinoPescado->select(null, 'dp_destino');


        $mare = $this->modelMare->select();
        $idEntrevista = $this->_getParam('id');
        $datahoraSaida[] = split(" ",$entrevista['man_dhsaida']);
        $datahoraVolta[] = split(" ",$entrevista['man_dhvolta']);

        $vManzua = $this->modelManzua->selectManzuaHasPesqueiro('man_id='.$idEntrevista);

        $vEspecieCapturadas = $this->modelManzua->selectManzuaHasEspCapturadas('man_id='.$idEntrevista);

        $vManzuaAvistamento = $this->modelManzua->selectManzuaHasAvistamento('man_id='.$idEntrevista);

        $this->view->assign('destinos', $destinos);
        $this->view->assign('avistamentos', $avistamentos);
        $this->view->assign('vManzuaAvistamento', $vManzuaAvistamento);
        $this->view->assign('monitoramento', $monitoramento);
        $this->view->assign('vEspecieCapturadas', $vEspecieCapturadas);
        $this->view->assign('vManzua', $vManzua);
        $this->view->assign("entrevista", $entrevista);
        $this->view->assign("mare", $mare);
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
        $idManzua = $this->modelManzua->insert($this->_getAllParams());


        $this->_redirect('manzua/editar/id/'.$idManzua);
    }
    public function atualizarAction(){
        $idManzua = $this->_getParam('id_entrevista');
        $this->modelManzua->update($this->_getAllParams());

        $this->_redirect('manzua/editar/id/'.$idManzua);
    }
    public function insertpesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);


        $pesqueiro = $this->_getParam("nomePesqueiro");

        $tempoapesqueiro = $this->_getParam("tempoAPesqueiro");

        $distanciapesqueiro = $this->_getParam("distAPesqueiro");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");


        $this->modelManzua->insertPesqueiro($idEntrevista, $pesqueiro, $tempoapesqueiro, $distanciapesqueiro);

        $this->redirect("/manzua/editar/id/" . $backUrl);
    }
    public function deletepesqueiroAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasPesqueiro = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelManzua->deletePesqueiro($idEntrevistaHasPesqueiro);

        $this->redirect("/manzua/editar/id/" . $backUrl);
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


        $this->modelManzua->insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $preco);

        $this->redirect("/manzua/editar/id/" . $backUrl);
    }
    public function deletespecieAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idEntrevistaHasEspecie = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelManzua->deleteEspCapturada($idEntrevistaHasEspecie);

        $this->redirect("/manzua/editar/id/" . $backUrl);
    }
    public function insertavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $avistamento = $this->_getParam("SelectAvistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelManzua->insertAvistamento($idEntrevista, $avistamento);

        $this->redirect("/manzua/editar/id/" . $backUrl);
    }
    public function deleteavistamentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idAvistamento = $this->_getParam("id_avistamento");

        $idEntrevista = $this->_getParam("id_entrevista");

        $backUrl = $this->_getParam("back_url");

        $this->modelManzua->deleteAvistamento($idAvistamento, $idEntrevista);

        $this->redirect("/manzua/editar/id/" . $backUrl);
    }

   public function relatoriolistaAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelManzua = new Application_Model_Manzua();
		$localManzua = $localModelManzua->selectEntrevistaManzua(NULL, array('fd_id', 'mnt_id', 'man_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Manzuá');
		$modeloRelatorio->setLegenda(30, 'Ficha');
		$modeloRelatorio->setLegenda(80, 'Monit.');
		$modeloRelatorio->setLegenda(130, 'Manzuá');
		$modeloRelatorio->setLegenda(180, 'Pescador');
		$modeloRelatorio->setLegenda(350, 'Embarcação');

		foreach ( $localManzua as $key => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['fd_id']);
			$modeloRelatorio->setValueAlinhadoDireita(80, 40, $localData['mnt_id']);
			$modeloRelatorio->setValueAlinhadoDireita(130, 40, $localData['man_id']);
			$modeloRelatorio->setValue(180, $localData['tp_nome']);
			$modeloRelatorio->setValue(350, $localData['bar_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		header('Content-Disposition: attachment;filename="rel_lista_entrevista_manzua.pdf"');
                header("Content-type: application/x-pdf");
		echo $pdf->render();
    }
   public function relatorioAction(){
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelManzua = new Application_Model_Manzua();
		$localManzua = $localModelManzua->selectEntrevistaManzua(NULL, array('fd_id', 'mnt_id', 'man_id'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Entrevista de Manzuá');
		$modeloRelatorio->setLegendaOff();

		foreach ( $localManzua as $key => $localData ) {
			$modeloRelatorio->setLegValueAlinhadoDireita(30, 60, 'Ficha:', $localData['fd_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(90, 60, 'Monit.:',  $localData['mnt_id']);
			$modeloRelatorio->setLegValueAlinhadoDireita(150, 70, 'V. Pesca:', $localData['man_id']);
			$modeloRelatorio->setLegValue(220, 'Pescador: ', $localData['tp_nome']);
			$modeloRelatorio->setLegValue(450, 'Barco: ', $localData['bar_nome']);
			$modeloRelatorio->setNewLine();

			$localPesqueiro = $localModelManzua->selectManzuaHasPesqueiro('man_id='.$localData['man_id'], array('man_id', 'paf_pesqueiro'), NULL);
			foreach ( $localPesqueiro as $key => $localDataPesqueiro ) {
				$modeloRelatorio->setLegValue(80, 'Pesqueiro: ',  $localDataPesqueiro['paf_pesqueiro']);
				if($localDataPesqueiro['t_tempoapesqueiro'] !== NULL){
                                    $modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Tempo (H:M):', date_format(date_create($localDataPesqueiro['t_tempoapesqueiro']), 'H:i'));
                                }
                                else{
                                  $modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Tempo (H:M):', "00:00", 'H:i');
                                }
                                $modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Distância:', number_format($localDataPesqueiro['t_distapesqueiro'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localEspecie = $localModelManzua->selectManzuaHasEspCapturadas('man_id='.$localData['man_id'], array('man_id', 'esp_nome_comum'), NULL);
			foreach ( $localEspecie as $key => $localDataEspecie ) {
				$modeloRelatorio->setLegValue(80, 'Espécie: ',  $localDataEspecie['esp_nome_comum']);
				$modeloRelatorio->setLegValueAlinhadoDireita(280, 60, 'Quant:', $localDataEspecie['spc_quantidade']);
				$modeloRelatorio->setLegValueAlinhadoDireita(350, 90, 'Peso(kg):', number_format($localDataEspecie['spc_peso_kg'], 2, ',', ' '));
				$modeloRelatorio->setLegValueAlinhadoDireita(450, 120, 'Preço(R$/kg):', number_format($localDataEspecie['spc_preco'], 2, ',', ' '));
				$modeloRelatorio->setNewLine();
			}
			$localAvist = $localModelManzua->selectManzuaHasAvistamento('man_id='.$localData['man_id'], array('man_id', 'avs_descricao'), NULL);
			foreach ( $localAvist as $key => $localDataAvist ) {
				$modeloRelatorio->setLegValue(80, 'Avist.: ',  $localDataAvist['avs_descricao']);
				$modeloRelatorio->setNewLine();
			}
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_entrevista_manzua.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }
}
