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

    public function deleteAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $this->modelBarcos->delete($this->_getParam('id'));

        $this->_redirect('barcos/index');
        }
    }


    public function insertAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array('tbar_nome' => $this->_getParam("valor"));

        $this->modelBarcos->insert($setupDados);

        $this->_redirect("/barcos/index");

        return;
    }

    public function updateAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array(
            'tbar_id' => $this->_getParam("id"),
            'tbar_nome' => $this->_getParam("valor")
        );

        $this->modelBarcos->update($setupDados);

        $this->_redirect("/barcos/index");

        return;
    }
    public function novoAction(){
        
        $this->modelPorto = new Application_Model_Porto();
        $portos = $this->modelPorto->select();
        $this->view->assign("assignPortos", $portos);
        
        $this->modelPescador = new Application_Model_Pescador();
        $pescadores = $this->modelPescador->select();
        $this->view->assign("assignPescadores", $pescadores);
        
        $this->modelBarcos = new Application_Model_Barcos();
        $barcos = $this->modelBarcos->select();
        $this->view->assign("assignBarcos", $barcos);
        
        $this->modelTipoBarcos = new Application_Model_TipoEmbarcacao();
        $tipobarcos = $this->modelTipoBarcos->select();
        $this->view->assign("assignTipoBarcos", $tipobarcos);
        
        $this->modelSeguroDefeso = new Application_Model_SeguroDefeso();
        $segurodefeso = $this->modelSeguroDefeso->select();
        $this->view->assign("assignSeguroDefeso", $segurodefeso);
        
        $this->modelMaterial = new Application_Model_Material();
        $material = $this->modelMaterial->select();
        $this->view->assign("assignMaterial", $material);
        
        $this->modelTipoCasco = new Application_Model_TipoCasco();
        $tipocasco = $this->modelTipoCasco->select();
        $this->view->assign("assignTipoCasco", $tipocasco);
        
        $this->modelTipoPagamento = new Application_Model_TipoPagamento();
        $tipopagamento = $this->modelTipoPagamento->select();
        $this->view->assign("assignTipoPagamento", $tipopagamento);
        
        $this->modelEquipamento = new Application_Model_Equipamento();
        $equipamento = $this->modelEquipamento->select();
        $this->view->assign("assignEquipamento", $equipamento);
        
    }
    public function editarAction(){
        $this->modelCor = new Application_Model_Cor();
        $cores = $this->modelCor->select();
        $this->view->assign("assignCores", $cores);
    }

    public function relatorioAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
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

		ob_end_clean();
        header('Content-Disposition: attachment;filename="rel_lista_embarcacoes.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
   }
}

