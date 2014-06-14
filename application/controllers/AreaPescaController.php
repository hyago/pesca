<?php

/** 
 * Controller de Áreas de pesca
 * teste
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class AreaPescaController extends Zend_Controller_Action
{
    private $modelAreaPesca;
private $usuario;
    public function init()
    {   
        $this->modelUsuario = new Application_Model_Usuario();
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $ArrayIdentity = get_object_vars($identity);
          
        }
        
        
        $this->usuario = $this->modelUsuario->selectLogin($ArrayIdentity['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        
        $this->modelAreaPesca = new Application_Model_AreaPesca();
    }

    /*
     * Lista todas as areas de pesca
     */
    public function indexAction()
    {        
        $areapesca = $this->modelAreaPesca->select( NULL, 'tareap_areapesca', NULL );
      
        $this->view->assign("area-pesca", $areapesca);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelAreaPesca->insert($this->_getAllParams());

        $this->_redirect('area-pesca/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $areaPesca = $this->modelAreaPesca->find($this->_getParam('id'));
        
        $this->view->assign("areaPesca", $areaPesca);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelAreaPesca->update($this->_getAllParams());

        $this->_redirect('area-pesca/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelAreaPesca->delete($this->_getParam('id'));

        $this->_redirect('area-pesca/index');
    
        }
   }
    
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        $dados = $this->modelAreaPesca->select();
      
        $this->view->assign("dados", $dados);
        
        $y = 55;
        $width = 20;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;
        $border_false = 0;
       
        $pdf = new FPDF("P", "mm", "A4");
        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->SetTitle("Área de Pesca");
        $pdf->setTitulo("Área de Pesca");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        
        
        //Title
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Nome", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",10);
        sort($dados);
        foreach($dados as $dados){
            $pdf->Cell($width/2, $height, $dados['TAreaP_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TAreaP_AreaPesca'],$border_true,$next_line);
        }
        $pdf->Output("areapescaPdf.pdf", 'I');
    }
    
}
