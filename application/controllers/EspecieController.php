<?php

/** 
 * Controller de Especies
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class EspecieController extends Zend_Controller_Action
{
    private $modelEspecie;
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
        
        
        $this->modelEspecie = new Application_Model_Especie();
        $this->modelGenero = new Application_Model_Genero();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelEspecie->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dados = $this->modelGenero->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelEspecie->insert($this->_getAllParams());

        $this->_redirect('especie/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dados = $this->modelGenero->select();
      
        $this->view->assign("dados", $dados);
        
        $especie = $this->modelEspecie->find($this->_getParam('id'));
        
        $this->view->assign("especie", $especie);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelEspecie->update($this->_getAllParams());

        $this->_redirect('especie/index');
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
        $this->modelEspecie->delete($this->_getParam('id'));

        $this->_redirect('especie/index');
        }
    }
    
    public function relatorioAction(){
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $especie = $this->modelEspecie->select();
      
        $this->view->assign("especie", $especie);
        
        //Title 
        $y = 55;
        $width = 20;
        
        $maior[] = 0;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;
        
        $pdf = new FPDF("P", "mm", "A4");
        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->setTitulo("Espécie");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Descritor", $border_true,$same_line);
        $pdf->Cell($width+20, $height, "Nome Comum", $border_true,$same_line);
        $pdf->Cell($width, $height, "Ordem", $border_true,$next_line);
        
        $pdf->SetFont("Arial", "",10);
        sort($especie);
        foreach($especie as $dados){
            $pdf->Cell($width/2, $height, $dados['ESP_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['ESP_Nome'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['ESP_Descritor'],$border_true,$same_line);
            $pdf->Cell($width+20, $height, $dados['ESP_Nome_Comum'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['GEN_ID'],$border_true,$next_line);
        }
        
        $pdf->Output("EspecieRelatorio.pdf", 'I');
    }
    
}
