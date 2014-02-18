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

}

