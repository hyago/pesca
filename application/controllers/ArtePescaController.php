<?php

/** 
 * Controller de Artes de Pesca
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class ArtePescaController extends Zend_Controller_Action
{
    private $modelArtePesca;
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
          //Converte do objeto para um array (tem que ser feito)
          $identity2 = get_object_vars($identity);
          
        }
        
        $this->modelUsuario = new Application_Model_Usuario();
        //Busca o usuário no banco pelo id do login
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        $this->modelArtePesca = new Application_Model_ArtePesca();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelArtePesca->select( NULL, 'tap_artepesca', NULL );
      
        $this->view->assign("dados", $dados);
        
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        //Verificar se o usuário logado é estagiário
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelArtePesca->insert($this->_getAllParams());

        $this->_redirect('arte-pesca/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {   
        //Verificar se o usuário logado é estagiário
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $artePesca = $this->modelArtePesca->find($this->_getParam('id'));
        
        $this->view->assign("artePesca", $artePesca);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelArtePesca->update($this->_getAllParams());

        $this->_redirect('arte-pesca/index');
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
        $this->modelArtePesca->delete($this->_getParam('id'));
        } 
        $this->_redirect('arte-pesca/index');
    }
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $dados = $this->modelArtePesca->select();
      
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
        $pdf->SetTitle("Arte de Pesca");
        $pdf->setTitulo("Arte de Pesca");
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
            $pdf->Cell($width/2, $height, $dados['TAP_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TAP_ArtePesca'],$border_true,$next_line);
        }
        $pdf->Output("artespescaPdf.pdf", 'I');
    }

}
