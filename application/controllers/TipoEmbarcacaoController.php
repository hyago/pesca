<?php

/** 
 * Controller de Tipo de Embarcação
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class TipoEmbarcacaoController extends Zend_Controller_Action
{
    private $modelTipoEmbarcacao;
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
        $this->usuario = $this->modelUsuario->find($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelTipoEmbarcacao->select( NULL, 'tte_tipoembarcacao', NULL );
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelTipoEmbarcacao->insert($this->_getAllParams());

        $this->_redirect('tipo-embarcacao/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoEmbarcacao = $this->modelTipoEmbarcacao->find($this->_getParam('id'));
        
        $this->view->assign("tipoEmbarcacao", $tipoEmbarcacao);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelTipoEmbarcacao->update($this->_getAllParams());

        $this->_redirect('tipo-embarcacao/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelTipoEmbarcacao->delete($this->_getParam('id'));

        $this->_redirect('tipo-embarcacao/index');
    }
    
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $embarcacoes = $this->modelTipoEmbarcacao->select();
      
        $this->view->assign("embarcacoes", $embarcacoes);
        
        
        //Title 
        $y = 55;
        $width = 20;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;
        
       
        $pdf = new FPDF("P", "mm", "A4");
        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->setTitulo("Tipos de Embarcações");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Tipo", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",10);
        sort($embarcacoes);
        foreach($embarcacoes as $dados){
            $pdf->Cell($width/2, $height, $dados['TTE_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TTE_TipoEmbarcacao'],$border_true,$next_line);
        }
        $pdf->Output("TiposEmbarcacaoPdf.pdf", 'I');
    }

}
 