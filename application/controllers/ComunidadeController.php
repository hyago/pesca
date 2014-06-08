<?php

/** 
 * Controller de Comunidades
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class ComunidadeController extends Zend_Controller_Action
{
    private $modelComunidade;
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
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        
        $this->modelComunidade = new Application_Model_Comunidade();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelComunidade->select( NULL, 'tcom_nome', NULL );
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelComunidade->insert($this->_getAllParams());

        $this->_redirect('comunidade/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $comunidade = $this->modelComunidade->find($this->_getParam('id'));
        
        $this->view->assign("comunidade", $comunidade);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelComunidade->update($this->_getAllParams());

        $this->_redirect('comunidade/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelComunidade->delete($this->_getParam('id'));

        $this->_redirect('comunidade/index');
    }
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $comunidade = $this->modelComunidade->select();
      
        $this->view->assign("comunidade", $comunidade);
        
        
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
        $pdf->setTitulo("Comunidades");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Comunidade", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",10);
        sort($comunidade);
        foreach($comunidade as $dados){
            $pdf->Cell($width/2, $height, $dados['TCOM_ID'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TCOM_NOME'],$border_true,$next_line);
        }
        $pdf->Output("TiposEmbarcacaoPdf.pdf", 'I');
    }
}
