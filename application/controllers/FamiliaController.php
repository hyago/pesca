<?php

class FamiliaController extends Zend_Controller_Action
{
    private $modelFamilia;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelFamilia = new Application_Model_Familia();     
        $this->modelOrdem = new Application_Model_Ordem();
    }

    public function indexAction()
    {
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
        
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
        
    }
    
    public function criarAction()
    {
        $this->modelFamilia->insert($this->_getAllParams());

        $this->_redirect('familia/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $dados = $this->modelOrdem->select();
      
        $this->view->assign("dados", $dados);
        
        $familia = $this->modelFamilia->find($this->_getParam('id'));
        
        $this->view->assign("familia", $familia);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        
        $this->modelFamilia->update($this->_getAllParams());

        $this->_redirect('familia/index');
    }
    
    public function excluirAction()
    {
        $this->modelFamilia->delete($this->_getParam('id'));

        $this->_redirect('familia/index');
    }

}

