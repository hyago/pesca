<?php

/** 
 * Controller de Áreas de pesca
 * teste
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class AreaPescaController extends Zend_Controller_Action
{
    private $modelAreaPesca;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelAreaPesca = new Application_Model_AreaPesca();
    }

    /*
     * Lista todas as areas de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelAreaPesca->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelAreaPesca->insert($this->_getAllParams());

        $this->_redirect('area-pesca/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $areaPesca = $this->modelAreaPesca->find($this->_getParam('id'));
        
        $this->view->assign("areaPesca", $areaPesca);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelAreaPesca->update($this->_getAllParams());

        $this->_redirect('area-pesca/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelAreaPesca->delete($this->_getParam('id'));

        $this->_redirect('area-pesca/index');
    }
    
}

