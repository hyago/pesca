<?php


require_once "../library/fpdf/fpdf.php";
class GeneroController extends Zend_Controller_Action
{
    private $modelGenero;
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



        $this->modelGenero = new Application_Model_Genero();
        $this->modelFamilia = new Application_Model_Familia();
    }

    public function indexAction()
    {
        $dados = $this->modelGenero->select();

        $this->view->assign("dados", $dados);
    }

    public function novoAction(){
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dados = $this->modelFamilia->select();

        $this->view->assign("dados", $dados);
    }

    public function criarAction()
    {
        $this->modelGenero->insert($this->_getAllParams());

        $this->_redirect('genero/index');
    }

    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dados = $this->modelFamilia->select();

        $this->view->assign("dados", $dados);

        $genero = $this->modelGenero->find($this->_getParam('id'));

        $this->view->assign("genero", $genero);
    }

    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGenero->update($this->_getAllParams());

        $this->_redirect('genero/index');
    }

    public function excluirAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelGenero->delete($this->_getParam('id'));

        $this->_redirect('genero/index');
        }
    }

	public function relatorioAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelGenero = new Application_Model_Genero();
		$localModelFamilia = new Application_Model_Familia();
		$localModelOrdem = new Application_Model_Ordem();
		$localModelGrupo = new Application_Model_Grupo();
		$localGrupo = $localModelGrupo->select(NULL, array('grp_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Filogenia de Gênero');
		$modeloRelatorio->setLegendaOff();

		foreach ($localGrupo as $key => $localData) {
			$modeloRelatorio->setLegValue(30, 'Grupo: ', $localData['grp_nome']);
			$modeloRelatorio->setNewLine();

			$localOrdem = $localModelOrdem->select('grp_id='.$localData['grp_id'], array('ord_nome'), NULL);
			foreach ($localOrdem as $key_o => $localDataOrdem) {
				$modeloRelatorio->setLegValue(50,'Ordem: ', $localDataOrdem['ord_nome']);
				$modeloRelatorio->setNewLine();

				$localFamilia = $localModelFamilia->select('ord_id='.$localDataOrdem['ord_id'], array('fam_nome'), NULL);
				foreach ($localFamilia as $key_f => $localDataFamilia) {
					$modeloRelatorio->setLegValue(70,'Família: ', $localDataFamilia['fam_nome']);
					$modeloRelatorio->setNewLine();

					$localGenero = $localModelGenero->select('fam_id='.$localDataFamilia['fam_id'], array('gen_nome'), NULL);
					if ( sizeof($localGenero) > 0) {
						$modeloRelatorio->setLegValue(90, 'Código', '');
						$modeloRelatorio->setLegValue(130, 'Gênero', '');
						$modeloRelatorio->setNewLine();
					}
					foreach ($localGenero as $key_f => $localDataGenero ) {
						$modeloRelatorio->setValueAlinhadoDireita(80, 40, $localDataGenero['gen_id']);
						$modeloRelatorio->setValue(130, $localDataGenero['gen_nome']);
						$modeloRelatorio->setNewLine();
					}
				}
			}
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		// 	 header("Content-Type: application/pdf");
		// 	 echo $pdf->render();

		header('Content-Disposition: attachment;filename="rel_filogenia_genero.pdf"');
		header("Content-type: application/x-pdf");
		echo $pdf->render();
   }

	public function relatoriolistaAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelGenero = new Application_Model_Genero();

		$localGenero = $localModelGenero->select(NULL, array('gen_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório de Gêneros');

		$modeloRelatorio->setLegenda(30, 'Código', '');
		$modeloRelatorio->setLegenda(80, 'Gênero', '');

		foreach ($localGenero as $key_f => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['gen_id']);
			$modeloRelatorio->setValue(80, $localData['gen_nome']);
			$modeloRelatorio->setNewLine();
		}

		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

// 		header('Content-Disposition: attachment;filename="rel_filogenia_especie.pdf"');
// 		header("Content-type: application/x-pdf");
// 		echo $pdf->render();

		header("Content-Type: application/pdf");
		echo $pdf->render();
   }

}