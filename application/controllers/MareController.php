<?php

class MareController extends Zend_Controller_Action
{
    private $modelMare;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelMare = new Application_Model_Mare();
    }

    /*
     * Lista todas as areas de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelMare->select( NULL, 'mre_id', NULL );
      
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
        $this->modelMare->insert($this->_getAllParams());

        $this->_redirect('mare/index');
    }
    
}