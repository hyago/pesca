<?php

/** 
 * Controller de Colonias
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class ColoniaController extends Zend_Controller_Action
{
    private $modelColonia;
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
        
        
        
        $this->modelColonia = new Application_Model_Colonia();
        
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {   
        
        $dados = $this->modelColonia->select( NULL, 'tc_nome', NULL );
        
        
        
        $this->view->assign("dados", $dados);
    }
    
    public function visualizarAction()
    {
        $colonia = $this->modelColonia->find($this->_getParam('id'));
         
        $this->view->assign("colonia", $colonia);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
    
        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        
        $modelComunidade = new Application_Model_Comunidade();
        $comunidades = $modelComunidade->select();
        
        $this->view->assign("municipios", $municipios);
        $this->view->assign("comunidades", $comunidades);
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelColonia->insert($this->_getAllParams());

        $this->_redirect('colonia/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $colonia = $this->modelColonia->find($this->_getParam('id'));
        
        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        
        $modelEndereco = new Application_Model_DbTable_Endereco();
        $endereco = $modelEndereco->select();
        
        $modelComunidade = new Application_Model_Comunidade();
        $comunidades = $modelComunidade->select();
        
        $this->view->assign("enderecos", $endereco);
        $this->view->assign("municipios", $municipios);
        $this->view->assign("comunidades", $comunidades);
        $this->view->assign("colonia", $colonia);
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelColonia->update($this->_getAllParams());

        $this->_redirect('colonia/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelColonia->delete($this->_getParam('id'));

        $this->_redirect('colonia/index');
    }
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        
        $modelComunidade = new Application_Model_Comunidade();
        $comunidades = $modelComunidade->select();
        
        $modelColonia = new Application_Model_Colonia();
        $colonia = $modelColonia->selectWithEndereco();
        $this->view->assign("municipios", $municipios);
        $this->view->assign("comunidades", $comunidades);
        $this->view->assign("colonia", $colonia);
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
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
        $pdf->setTitulo("Colônia");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        
        
        //Title
        $pdf->SetFont("Arial", "B",8);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width+5, $height, "Especificidade", $border_true,$same_line);
        $pdf->Cell($width, $height, "Comunidade", $border_true,$same_line);
        $pdf->Cell($width, $height, "Logradouro", $border_true,$same_line);
        $pdf->Cell($width, $height, "Número", $border_true,$same_line);
        $pdf->Cell($width, $height, "Bairro", $border_true,$same_line);
        $pdf->Cell($width, $height, "Município", $border_true,$same_line);
        
        $pdf->Cell($width, $height, "Complemento", $border_true,$next_line);
        
        
        $pdf->SetFont("Arial", "",8);
        
        foreach($colonia as $dados){
            $pdf->Cell($width/2, $height, $dados['tc_id'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['tc_nome'],$border_true,$same_line);
            $pdf->Cell($width+5, $height, $dados['tc_especificidade'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['tcom_nome'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['te_logradouro'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['te_numero'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['te_bairro'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['tmun_municipio'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['te_comp'],$border_true,$next_line);
            
        }
        $pdf->Output("coloniasPdf.pdf", 'I');
    }
    
}
