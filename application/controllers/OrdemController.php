<?php

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

}

class PDF Extends FPDF{
       
    function Header(){
        
        
        $view = "Pescador";
        $width = 30;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_false = 0;
        $y = 0;

        date_default_timezone_set('America/Bahia');
        //Cabecalho
        $this->SetY($y);
        $this->SetFont("Arial", "B",14);
        $this->Image("img/Cabecalho1.jpg", null, null, 180, 30);
        $this->SetTextColor(78, 22, 35);
        $this->Cell($width, $height, "Relatorio ->", $border_false, $same_line);
        $this->Cell($width+70, $height, $view, $border_false, $same_line);
        $this->Cell($width, $height, date("d/m/Y - H:i:s"), $border_false, $next_line);
        $this->Cell($width, $height, "___________________________________________________________________", $border_false, $next_line);
        $this->Cell($width, $height, "Dados:", $border_false, $next_line);
        $this->Cell($width, $height, "", $border_false, $next_line);
            
    } 
    
    
   function Footer(){
       
       $y = 255;
       $width = 0;
       $height = 5;
       $center = 100;
       
       $this->SetY($y);
       $this->Cell(0, 5, "_____________________________________________________________________________________________", 0, 1);
       $this->SetFont('Arial','I',8);
       $this->MultiCell($width, $height, $this->page, 0, "C");
       $this->SetX($center-6);
       $this->Image("img/isus.jpg",10, null, 20, 10);
       $this->Image("img/bamin.jpg", 175, 265, 20, 10);
       
    }    
  
    
}