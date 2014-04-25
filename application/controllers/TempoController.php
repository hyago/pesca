<?php
require_once "../library/fpdf/fpdf.php";
class TempoController extends Zend_Controller_Action
{
    private $modelTempo;


    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelTempo = new Application_Model_Tempo();
    }

    public function indexAction()
    {        
        $dados = $this->modelTempo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
    }
    
    public function criarAction()
    {
        $this->modelTempo->insert($this->_getAllParams());

        $this->_redirect('tempo/index');
    }
    
    public function editarAction()
    {
        $tempo = $this->modelTempo->find($this->_getParam('id'));
        
        $this->view->assign("tempo", $tempo);
    }
   
    public function atualizarAction()
    {
        $this->modelTempo->update($this->_getAllParams());

        $this->_redirect('tempo/index');
    }
 
    public function excluirAction()
    {
        $this->modelTempo->delete($this->_getParam('id'));

        $this->_redirect('tempo/index');
    }
    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $tempo = $this->modelTempo->select();
      
        $this->view->assign("tempo", $tempo);
        
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
        $pdf->setTitulo("Tempo");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Estado", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($tempo);
        foreach($tempo as $dados){
            $pdf->Cell($width/2, $height, $dados['TMP_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TMP_Estado'],$border_true,$next_line);
        }
        
        $pdf->Output("TempoRelatorio.pdf", 'I');
    }
}
