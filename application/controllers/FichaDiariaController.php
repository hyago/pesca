<?php


require_once "../library/fpdf/fpdf.php";
class FichaDiariaController extends Zend_Controller_Action
{

   private $modelFichaDiaria;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelPorto = new Application_Model_Porto();
        $this->modelTempo = new Application_Model_Tempo();
        $this->modelVento = new Application_Model_Vento();
        $this->modelArtePesca = new Application_Model_ArtePesca();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {  
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        //------------------------------------------
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
        //--------------------------------------
        $porto = $this->modelPorto->select();
        
        $this->view->assign("dados_porto", $porto);
        //----------------------------------------
        $tempo = $this->modelTempo->select();
        
        $this->view->assign("dados_tempo", $tempo);
        //-------------------------------------------
        $vento = $this->modelVento->select();
        
        $this->view->assign("dados_vento", $vento);
        
        $artePesca = $this->modelArtePesca->select();
        
        $this->view->assign("artesPesca", $artePesca);
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelFichaDiaria->insert($this->_getAllParams());

        $this->_redirect('ficha-diaria/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        
        $this->view->assign("ficha-diaria", $fichadiaria);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelFichaDiaria->update($this->_getAllParams());

        $this->_redirect('ficha-diaria/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelFichaDiaria->delete($this->_getParam('id'));

        $this->_redirect('ficha-diaria/index');
    }
    
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $fichadiaria = $this->modelFichaDiaria->select();
      
        $this->view->assign("fichasdiarias", $fichadiaria);
        
        
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
        $pdf->setTitulo("Ficha Diária");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Estagiário", $border_true,$same_line);
        $pdf->Cell($width, $height, "Monitor", $border_true,$same_line);
        $pdf->Cell($width, $height, "Data", $border_true,$same_line);
        $pdf->Cell($width, $height, "OBS", $border_true,$same_line);
        $pdf->Cell($width, $height, "Porto", $border_true,$same_line);
        $pdf->Cell($width, $height, "Tempo", $border_true,$same_line);
        $pdf->Cell($width, $height, "Vento", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Turno", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",10);
        sort($fichadiaria);
        foreach($fichadiaria as $dados){
            $pdf->Cell($width/2, $height, $dados['FD_ID'],$border_true,$same_line);
            $pdf->Cell($width   , $height, $dados['T_Estagiario_TU_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['T_Monitor_TU_ID1'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['FD_Data'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['OBS'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['PTO_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TMP_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['VNT_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['FD_Turno'],$border_true,$same_line);
            
            
        }
        $pdf->Output("FichaDiaria.pdf", 'I');
    }

}

