<?php

class FichaDiariaController extends Zend_Controller_Action
{

   private $modelFichaDiaria;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelPorto = new Application_Model_Porto();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
        
        $porto = $this->modelPorto->select();
        
        $this->view->assign("dados_porto", $porto);
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelFichaDiaria->insert($this->_getAllParams());

        $this->_redirect('ficha-diaria/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelFichaDiaria->select();
      
        $this->view->assign("dados", $dados);
        
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));
        
        $this->view->assign("ficha-diaria", $fichadiaria);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelFichaDiaria->update($this->_getAllParams());

        $this->_redirect('ficha-diaria/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelFichaDiaria->delete($this->_getParam('id'));

        $this->_redirect('ficha-diaria/index');
    }

}

