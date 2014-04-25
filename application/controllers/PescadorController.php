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
class PescadorController extends Zend_Controller_Action{
    
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
    public function relatorioAction(){
        
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();
        
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
        
        
        
        $y = 55;
        $width = 20;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;
        
        foreach($pescador as $dados){
            $arrayNomes = array($dados['TP_Nome']);
        }
        
        
       
        $pdf = new FPDF("L", "mm", "A4");
        $widthNome = $pdf->GetStringWidth(max($arrayNomes));
        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->SetTitle("Pescadores");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        
        
        //Title
        $pdf->SetFont("Arial", "B",10);
        $pdf->SetY($y);
        $pdf->Cell($width/2, $height, "ID", $border_true,$same_line);
        $pdf->Cell($width+50, $height, "Nome", $border_true,$same_line);
        $pdf->Cell($width, $height, "Sexo", $border_true,$same_line);
        $pdf->Cell($width, $height, "Matricula",$border_true,$same_line);
        $pdf->Cell($width, $height, "Apelido",$border_true,$same_line);
        $pdf->Cell($width, $height, "Pai", $border_true,$same_line);
        $pdf->Cell($width, $height, "Mãe", $border_true,$same_line);
        $pdf->Cell($width+10, $height, "Naturalidade", $border_true,$next_line);
        //Dados
        $pdf->SetFont("Arial", "",8);
        foreach($pescador as $dados){
            $pdf->Cell($width/2, $height, $dados['TP_ID'],$border_true,$same_line);
            $pdf->Cell($width+50, $height, $dados['TP_Nome'],$border_true,$same_line);
                if($dados['TP_Sexo']=="M"){
                    $pdf->Cell($width, $height, "Masculino",$border_true,$same_line);
                }
                else{
                    $pdf->Cell($width, $height, "Feminino",$border_true,$same_line);
                }
            
            $pdf->Cell($width, $height, $dados['TP_Matricula'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_Apelido'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_FiliacaoPai'],$border_true,$same_line);
            $pdf->Cell($width, $height, $dados['TP_FiliacaoMae'],$border_true,$same_line);
            foreach($municipios as $dadosMun){
                if($dadosMun['TMun_ID'] == $dados['TMun_ID_Natural']){
                    $pdf->Cell($width+10, $height, $dadosMun['TMun_Municipio'],$border_true,$next_line);
                }
            }
            
        }
        
        
        $pdf->Output("cadastroPdf.pdf", 'I');
        
    }
    
}
