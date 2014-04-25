<?php
require_once "../library/fpdf/fpdf.php";
class VentoController extends Zend_Controller_Action
{
    private $modelVento;

    public function init()
    {
         if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelVento = new Application_Model_Vento();
    }

    public function indexAction()
    {        
        $dados = $this->modelVento->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
    }
    
    public function criarAction()
    {
        $this->modelVento->insert($this->_getAllParams());

        $this->_redirect('vento/index');
    }
    
    public function editarAction()
    {
        $vento = $this->modelVento->find($this->_getParam('id'));
        
        $this->view->assign("vento", $vento);
    }
   
    public function atualizarAction()
    {
        $this->modelVento->update($this->_getAllParams());

        $this->_redirect('vento/index');
    }
 
    public function excluirAction()
    {
        $this->modelVento->delete($this->_getParam('id'));

        $this->_redirect('vento/index');
    }

    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $vento = $this->modelVento->select();
      
        $this->view->assign("vento", $vento);
        
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
        $pdf->setTitulo("Tipos de Ventos");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Força", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($vento);
        foreach($vento as $dados){
            $pdf->Cell($width/2, $height, $dados['VNT_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['VNT_Forca'],$border_true,$next_line);
        }
        
        $pdf->Output("VentoRelatorio.pdf", 'I');
    }
}
