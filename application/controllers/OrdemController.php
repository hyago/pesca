<?php

class OrdemController extends Zend_Controller_Action
{
    private $modelOrdem;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelOrdem = new Application_Model_Ordem();
        $this->modelGrupo = new Application_Model_Grupo();
    }

    public function indexAction()
    {
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
        $dados = $this->modelGrupo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function criarAction()
    {
        $this->modelOrdem->insert($this->_getAllParams());

        $this->_redirect('ordem/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelGrupo->select();
        
        $this->view->assign("dados", $dados);
        
        $ordem = $this->modelOrdem->find($this->_getParam('id'));
        
        $this->view->assign("ordem", $ordem);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelOrdem->update($this->_getAllParams());

        $this->_redirect('ordem/index');
    }
    
    public function excluirAction()
    {
        $this->modelOrdem->delete($this->_getParam('id'));

        $this->_redirect('ordem/index');
    }

}

