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

class ComunidadeController extends Zend_Controller_Action
{
    private $modelComunidade;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelComunidade = new Application_Model_Comunidade();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelComunidade->select();
      
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
    
}