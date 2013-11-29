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

class MunicipioController extends Zend_Controller_Action
{
    private $modelMunicipio;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelMunicipio = new Application_Model_Municipio();
    }

    /*
     * Lista todas as areas de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelMunicipio->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
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
        $this->modelMunicipio->delete($this->_getParam('id'));

        $this->_redirect('municipio/index');
    }
    
}