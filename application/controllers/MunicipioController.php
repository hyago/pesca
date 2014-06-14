<?php

/** 
 * Controller de Municipios
 * teste
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class MunicipioController extends Zend_Controller_Action
{
    private $modelMunicipio;
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
        
        
        
        $this->modelMunicipio = new Application_Model_Municipio();
    }

    /*
     * Lista todas as areas de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelMunicipio->select( NULL, array('tuf_sigla','tmun_municipio'), NULL );
      
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
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelMunicipio->insert($this->_getAllParams());

        $this->_redirect('municipio/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $municipio = $this->modelMunicipio->find($this->_getParam('id'));
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
        $this->view->assign("municipio", $municipio);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelMunicipio->update($this->_getAllParams());

        $this->_redirect('municipio/index');
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
        $this->modelMunicipio->delete($this->_getParam('id'));

        $this->_redirect('municipio/index');
        }
    }
    
     public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $municipios = $this->modelMunicipio->select();
      
        $this->view->assign("municipios", $municipios);
        
        
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
        $pdf->setTitulo("Municípios");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title
        
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Município", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "UF", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",10);
        sort($municipios);
        foreach($municipios as $dados){
            $pdf->Cell($width/2, $height, $dados['TMun_ID'],$border_true,$same_line);
            $pdf->Cell($width   , $height, $dados['TMun_Municipio'],$border_true,$same_line);
            $pdf->Cell($width+10, $height, $dados['TUF_Sigla'],$border_true,$next_line);
        }
        $pdf->Output("TiposEmbarcacaoPdf.pdf", 'I');
    }

    
}

