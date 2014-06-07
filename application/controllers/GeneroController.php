<?php


require_once "../library/fpdf/fpdf.php";
class GeneroController extends Zend_Controller_Action
{
    private $modelGenero;
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
        
        
        
        $this->modelGenero = new Application_Model_Genero(); 
        $this->modelFamilia = new Application_Model_Familia();
    }

    public function indexAction()
    {
        $dados = $this->modelGenero->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
        
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function criarAction()
    {
        $this->modelGenero->insert($this->_getAllParams());

        $this->_redirect('genero/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {   
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
        
        $genero = $this->modelGenero->find($this->_getParam('id'));
        
        $this->view->assign("genero", $genero);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGenero->update($this->_getAllParams());

        $this->_redirect('genero/index');
    }
    
    public function excluirAction()
    {
        $this->modelGenero->delete($this->_getParam('id'));

        $this->_redirect('genero/index');
    }
    
    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $genero = $this->modelGenero->select();
      
        $this->view->assign("genero", $genero);
        
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
        $pdf->setTitulo("Gênero");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Familia", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($genero);
        foreach($genero as $dados){
            $pdf->Cell($width/2, $height, $dados['GEN_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['GEN_Nome'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['FAM_ID'],$border_true,$next_line);
        }
        
        $pdf->Output("GeneroRelatorio.pdf", 'I');
    }

}