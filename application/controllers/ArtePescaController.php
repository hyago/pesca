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

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelArtePesca = new Application_Model_ArtePesca();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelArtePesca->select();
      
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
        $this->modelArtePesca->insert($this->_getAllParams());

        $this->_redirect('arte-pesca/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
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
        $this->modelArtePesca->delete($this->_getParam('id'));

        $this->_redirect('arte-pesca/index');
    }

}

