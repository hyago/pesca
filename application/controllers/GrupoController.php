<?php

require_once "../library/fpdf/fpdf.php";
class GrupoController extends Zend_Controller_Action
{

    private $modelGrupo;
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



        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;

        $this->modelGrupo = new Application_Model_Grupo();
    }

    public function indexAction()
    {

        $dados = $this->modelGrupo->select();

        $this->view->assign("dados", $dados);
    }

    public function novoAction(){

        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
    }

    public function criarAction()
    {
        $this->modelGrupo->insert($this->_getAllParams());

        $this->_redirect('grupo/index');
    }

    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $grupo = $this->modelGrupo->find($this->_getParam('id'));

        $this->view->assign("grupo", $grupo);
    }

    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGrupo->update($this->_getAllParams());

        $this->_redirect('grupo/index');
    }

    public function excluirAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $this->modelGrupo->delete($this->_getParam('id'));

        $this->_redirect('grupo/index');
    }

	public function relatorioAction() {
	 $this->_helper->layout->disableLayout();
	 $this->_helper->viewRenderer->setNoRender(true);

	 $localModelGrupo = new Application_Model_Grupo();
	 $localGrupo = $localModelGrupo->select(NULL, array('grp_nome'), NULL);

	 require_once "../library/ModeloRelatorio.php";
	 $modeloRelatorio = new ModeloRelatorio();
	 $modeloRelatorio->setTitulo('Relatório Filogenia de Grupo');
	 $modeloRelatorio->setLegenda(30, 'Código');
	 $modeloRelatorio->setLegenda(80, 'Grupo');


	 foreach ($localGrupo as $key => $localData) {
	  $modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['grp_id']);
	  $modeloRelatorio->setValue(80, $localData['grp_nome']);
	  $modeloRelatorio->setNewLine();
	}
	 $modeloRelatorio->setNewLine();
	 $pdf = $modeloRelatorio->getRelatorio();

	 header("Content-Type: application/pdf");
	 echo $pdf->render();
   }

	public function relatoriolistaAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelGrupo = new Application_Model_Grupo();

		$localGrupo = $localModelGrupo->select(NULL, array('grp_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório de Grupo');

		$modeloRelatorio->setLegenda(30, 'Código', '');
		$modeloRelatorio->setLegenda(80, 'Grupo', '');

		foreach ($localGrupo as $key_f => $localData ) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['grp_id']);
			$modeloRelatorio->setValue(80, $localData['grp_nome']);
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