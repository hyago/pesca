<?php


require_once "../library/fpdf/fpdf.php";
class FamiliaController extends Zend_Controller_Action
{
    private $modelFamilia;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelFamilia = new Application_Model_Familia();     
        $this->modelOrdem = new Application_Model_Ordem();
    }

    public function indexAction()
    {
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
        
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
        
    }
    
    public function criarAction()
    {
        $this->modelFamilia->insert($this->_getAllParams());

        $this->_redirect('familia/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
        
        $familia = $this->modelFamilia->find($this->_getParam('id'));
        
        $this->view->assign("familia", $familia);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        
        $this->modelFamilia->update($this->_getAllParams());

        $this->_redirect('familia/index');
    }
    
    public function excluirAction()
    {
        $this->modelFamilia->delete($this->_getParam('id'));

        $this->_redirect('familia/index');
    }
    
    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $familia = $this->modelFamilia->select();
      
        $this->view->assign("familia", $familia);
        
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
        $pdf->setTitulo("Familia");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Tipo", $border_true,$same_line);
        $pdf->Cell($width+20, $height, "Caracteristica", $border_true,$same_line);
        $pdf->Cell($width, $height, "Ordem", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($familia);
        foreach($familia as $dados){
            $pdf->Cell($width/2, $height, $dados['FAM_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['FAM_Nome'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['FAM_Tipo'],$border_true,$same_line);
            $pdf->Cell($width+20, $height, $dados['FAM_Caracteristica'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['ORD_ID'],$border_true,$next_line);
        }
        
        $pdf->Output("FamiliaRelatorio.pdf", 'I');
    }

}
