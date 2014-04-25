<?php

require_once "../library/fpdf/fpdf.php";
class OrdemController extends Zend_Controller_Action
{
    private $modelOrdem;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelOrdem = new Application_Model_Ordem();
        $this->modelGrupo = new Application_Model_Grupo();
    }

    public function indexAction()
    {
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
        $dados = $this->modelGrupo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function criarAction()
    {
        $this->modelOrdem->insert($this->_getAllParams());

        $this->_redirect('ordem/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelGrupo->select();
        
        $this->view->assign("dados", $dados);
        
        $ordem = $this->modelOrdem->find($this->_getParam('id'));
        
        $this->view->assign("ordem", $ordem);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelOrdem->update($this->_getAllParams());

        $this->_redirect('ordem/index');
    }
    
    public function excluirAction()
    {
        $this->modelOrdem->delete($this->_getParam('id'));

        $this->_redirect('ordem/index');
    }
    
     public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $ordem = $this->modelOrdem->select();
      
        $this->view->assign("ordem", $ordem);
        
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
        $pdf->setTitulo("Ordem");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Grupo", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($ordem);
        foreach($ordem as $dados){
            $pdf->Cell($width/2, $height, $dados['ORD_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['ORD_Nome'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['GRP_ID'],$border_true,$next_line);
        }
        
        $pdf->Output("OrdemRelatorio.pdf", 'I');
    }

}

