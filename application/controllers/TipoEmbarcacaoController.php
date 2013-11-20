<?php

/** 
 * Controller de Tipo de Embarcação
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class TipoEmbarcacaoController extends Zend_Controller_Action
{
    private $modelTipoEmbarcacao;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelTipoEmbarcacao->select();
      
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
        $this->modelTipoEmbarcacao->insert($this->_getAllParams());

        $this->_redirect('tipo-embarcacao/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoEmbarcacao = $this->modelTipoEmbarcacao->find($this->_getParam('id'));
        
        $this->view->assign("tipoEmbarcacao", $tipoEmbarcacao);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelTipoEmbarcacao->update($this->_getAllParams());

        $this->_redirect('tipo-embarcacao/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelTipoEmbarcacao->delete($this->_getParam('id'));

        $this->_redirect('tipo-embarcacao/index');
    }

}