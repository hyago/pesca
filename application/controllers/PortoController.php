<?php
require_once "../library/fpdf/fpdf.php";
class PortoController extends Zend_Controller_Action
{
    private $modelPorto;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelPorto = new Application_Model_Porto();
    }

    public function indexAction()
    {        
        $dados = $this->modelPorto->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        $modelMunicipio = new Application_Model_Municipio();
        
        $municipios = $modelMunicipio->select();
        
        $this->view->assign("municipios", $municipios);
    }
    
    public function criarAction()
    {
        $this->modelPorto->insert($this->_getAllParams());

        $this->_redirect('porto/index');
    }
    
    public function editarAction()
    {
        $modelMunicipio = new Application_Model_Municipio();
        
        $municipios = $modelMunicipio->select();
        
        $this->view->assign("municipios", $municipios);
        
        $porto = $this->modelPorto->find($this->_getParam('id'));
        
        $this->view->assign("porto", $porto);
    }
   
    public function atualizarAction()
    {
        $this->modelPorto->update($this->_getAllParams());

        $this->_redirect('porto/index');
    }
 
    public function excluirAction()
    {
        $this->modelPorto->delete($this->_getParam('id'));

        $this->_redirect('porto/index');
    }

    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $porto = $this->modelPorto->select();
      
        $this->view->assign("porto", $porto);
        
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
        $pdf->setTitulo("Portos");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Município", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($porto);
        foreach($porto as $dados){
            $pdf->Cell($width/2, $height, $dados['PTO_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['PTO_Nome'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TMun_ID'],$border_true,$next_line);
        }
        $pdf->Output("EspecieRelatorio.pdf", 'I');
    }
}
