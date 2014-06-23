<?php

class BarcosController extends Zend_Controller_Action
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



        $this->modelBarcos = new Application_Model_Barcos();
    }

    public function indexAction()
    {
        $barcos = $this->modelBarcos->select();

        $this->view->assign("barcos", $barcos);
    }

    public function novoAction(){
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
    }
    public function criarAction(){

        $this->modelBarcos->insert($this->getAllParams());

        $this->_redirect("barcos/index");
    }

	public function relatorioAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelBarco = new Application_Model_Barcos();
		$localBarco = $localModelBarco->select(NULL, array('bar_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório Embarcações');
		$modeloRelatorio->setLegenda(30, 'Código');
		$modeloRelatorio->setLegenda(80, 'Embarcação');

		foreach ($localBarco as $key => $localData) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['bar_id']);
			$modeloRelatorio->setValue(80, $localData['bar_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		header("Content-Type: application/pdf");
		echo $pdf->render();
   }
}

