<?php

require_once "../library/fpdf/fpdf.php";
class GrupoController extends Zend_Controller_Action
{

    private $modelGrupo;
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
        
        
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelGrupo = new Application_Model_Grupo();     
    }

    public function indexAction()
    {
        $dados = $this->modelGrupo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
    
    }
    
    public function criarAction()
    {
        $this->modelGrupo->insert($this->_getAllParams());

        $this->_redirect('grupo/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $grupo = $this->modelGrupo->find($this->_getParam('id'));
        
        $this->view->assign("grupo", $grupo);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGrupo->update($this->_getAllParams());

        $this->_redirect('grupo/index');
    }
    
    public function excluirAction()
    {
        $this->modelGrupo->delete($this->_getParam('id'));

        $this->_redirect('grupo/index');
    }
    
    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $grupo = $this->modelGrupo->select();
      
        $this->view->assign("grupo", $grupo);
        
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
        $pdf->setTitulo("Grupo");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($grupo);
        foreach($grupo as $dados){
            $pdf->Cell($width/2, $height, $dados['grp_id'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['grp_nome'],$border_true,$next_line);
        }
        
        $pdf->Output("GrupoRelatorio.pdf", 'I');
    }
    
}