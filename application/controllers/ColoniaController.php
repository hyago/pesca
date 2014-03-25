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

class ColoniaController extends Zend_Controller_Action
{
    private $modelColonia;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelColonia = new Application_Model_Colonia();
        
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {   
        
        $dados = $this->modelColonia->select();
        
        
        
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
        
        $modelComunidade = new Application_Model_Comunidade();
        $comunidades = $modelComunidade->select();
        
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
    
}