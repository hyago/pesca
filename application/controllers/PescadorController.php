<?php

/** 
 * Controller de Pescadores
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
require_once "../library/fpdf/fpdf.php";
class PescadorController extends Zend_Controller_Action
{
    
    private $modelPescador;
    
    public function init()
    {
        
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelPescador = new Application_Model_Pescador();
    }

    public function indexAction()
    {
        $dados = $this->modelPescador->select();
      
        $this->view->assign("dados", $dados);
        
        
    }
    
    /*
     * Consulta um pescador
     */
    public function visualizarAction()
    {
        $idPescador = $this->_getParam('id');
        
        $usuario = $this->modelPescador->find($idPescador);
        
        $modelTelefone = new Application_Model_Telefone();
        $telefoneResidencial = $modelTelefone->getTelefone($idPescador, 'Residencial');
        $telefoneCelular = $modelTelefone->getTelefone($idPescador, 'Celular');
         
        $this->view->assign("pescador", $usuario);
        $this->view->assign("telefoneResidencial", $telefoneResidencial);
        $this->view->assign("telefoneCelular", $telefoneCelular);
    }
 
    /*
     * Exibe formulário para cadastro de um pescador
     */
    public function novoAction()
    {        
        $modelMunicipio = new Application_Model_Municipio();
        $modelArtePesca = new Application_Model_ArtePesca();
        $modelAreaPesca = new Application_Model_AreaPesca();
        $modelColonia = new Application_Model_Colonia();
        $modelEspecie = new Application_Model_Especie();
        $modelTipoEmbarcacao= new Application_Model_TipoEmbarcacao();
        $modelPorteEmbarcacao= new Application_Model_PorteEmbarcacao();
        
        $municipios = $modelMunicipio->select();
        $artesPesca = $modelArtePesca->select();
        $areasPesca = $modelAreaPesca->select();
        $colonias = $modelColonia->select();
        $especies = $modelEspecie->select();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();
        
        $this->view->assign("municipios", $municipios);
        $this->view->assign("artesPesca", $artesPesca);
        $this->view->assign("areasPesca", $areasPesca);
        $this->view->assign("colonias", $colonias);
        $this->view->assign("especies", $especies);
        $this->view->assign("tiposEmbarcacao", $tiposEmbarcacao);
        $this->view->assign("portesEmbarcacao", $portesEmbarcacao);
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
	
    }
 
    /*
     * Cadastra um pescador
     */
    public function criarAction()
    {
        $this->modelPescador->insert($this->_getAllParams());

        $this->_redirect('pescador/index');
    }
 
    /*
     * Preenche um formulario com as informações de um pescador
     */
    public function editarAction()
    {
        $modelMunicipio = new Application_Model_Municipio();
        $modelArtePesca = new Application_Model_ArtePesca();
        $modelAreaPesca = new Application_Model_AreaPesca();
        $modelColonia = new Application_Model_Colonia();
        $modelEspecie = new Application_Model_Especie();
        $modelTipoEmbarcacao= new Application_Model_TipoEmbarcacao();
        $modelPorteEmbarcacao= new Application_Model_PorteEmbarcacao();
        
        $municipios = $modelMunicipio->select();
        $artesPesca = $modelArtePesca->select();
        $areasPesca = $modelAreaPesca->select();
        $colonias = $modelColonia->select();
        $especies = $modelEspecie->select();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();

        $pescador= $this->modelPescador->find($this->_getParam('id'));
        
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
        $this->view->assign("pescador", $pescador);
        $this->view->assign("municipios", $municipios);
        $this->view->assign("artesPesca", $artesPesca);
        $this->view->assign("areasPesca", $areasPesca);
        $this->view->assign("colonias", $colonias);
        $this->view->assign("especies", $especies);
        $this->view->assign("tiposEmbarcacao", $tiposEmbarcacao);
        $this->view->assign("portesEmbarcacao", $portesEmbarcacao);
    }
   
    /*
     * Atualiza os dados do pescador
     */
    public function atualizarAction()
    {
        $this->modelPescador->update($this->_getAllParams());

        $this->_redirect('pescador/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelPescador->delete($this->_getParam('id'));

        $this->_redirect('pescador/index');
    }
    
    public function relatorioAction()
    {
        $width = 25;
        $height = 10;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;
        $border_false = 0;
        
        $modelPescador = new Application_Model_Pescador();
        $modelMunicipio = new Application_Model_Municipio();
        $modelArtePesca = new Application_Model_ArtePesca();
        $modelAreaPesca = new Application_Model_AreaPesca();
        $modelColonia = new Application_Model_Colonia();
        $modelEspecie = new Application_Model_Especie();
        $modelTipoEmbarcacao= new Application_Model_TipoEmbarcacao();
        $modelPorteEmbarcacao= new Application_Model_PorteEmbarcacao();
        
        $pescador = $modelPescador->select();
        $municipios = $modelMunicipio->select();
        $artesPesca = $modelArtePesca->select();
        $areasPesca = $modelAreaPesca->select();
        $colonias = $modelColonia->select();
        $especies = $modelEspecie->select();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();
        
        $this->view->assign("pescador", $pescador);
        $this->view->assign("municipios", $municipios);
        $this->view->assign("artesPesca", $artesPesca);
        $this->view->assign("areasPesca", $areasPesca);
        $this->view->assign("colonias", $colonias);
        $this->view->assign("especies", $especies);
        $this->view->assign("tiposEmbarcacao", $tiposEmbarcacao);
        $this->view->assign("portesEmbarcacao", $portesEmbarcacao);
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
        $pdf = new FPDF("P", "mm", "A4");
        $pdf->Open();
        
        $pdf->SetMargins(10, 20, 10);
        
        $pdf->AddPage();
        $pdf->SetFont("Arial", "",12);
        $pdf->SetTitle("Cadastro Pescador");
        //Title
        $pdf->SetFont("Arial", "",12);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Sexo", $border_true,$same_line);
        $pdf->Cell($width, $height, "Matricula",$border_true,$same_line);
        $pdf->Cell($width, $height, "Apelido",$border_true,$same_line);
        $pdf->Cell($width, $height, "Pai", $border_true,$same_line);
        $pdf->Cell($width, $height, "Mae", $border_true,$next_line);
        
        //Title
        $pdf->Cell($width/2, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "", $border_true,$same_line);
        $pdf->Cell($width, $height/4, "",$border_true,$next_line);
        
        
        //Dados
        foreach($pescador as $dados){
            $pdf->Cell($width/2, $height, $dados['TP_ID'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_Nome'],$border_true,$same_line);
                if($dados['TP_Sexo']=="M"){
                    $pdf->Cell($width, $height, "Masculino",$border_true,$same_line);
                }
                else{
                    $pdf->Cell($width, $height, "Feminino",$border_true,$same_line);
                }
            
            $pdf->Cell($width, $height, $dados['TP_Matricula'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_Apelido'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_FiliacaoPai'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_FiliacaoMae'],$border_true,$next_line);
        }
        //Dados
        
        $pdf->Output("cadastroPdf.pdf", 'I');
    }

}

