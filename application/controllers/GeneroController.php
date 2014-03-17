<?php

class GeneroController extends Zend_Controller_Action
{
    private $modelGenero;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelGenero = new Application_Model_Genero(); 
        $this->modelFamilia = new Application_Model_Familia();
    }

    public function indexAction()
    {
        $dados = $this->modelGenero->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
        
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function criarAction()
    {
        $this->modelGenero->insert($this->_getAllParams());

        $this->_redirect('genero/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {   
        $dados = $this->modelFamilia->select();
      
        $this->view->assign("dados", $dados);
        
        $genero = $this->modelGenero->find($this->_getParam('id'));
        
        $this->view->assign("genero", $genero);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGenero->update($this->_getAllParams());

        $this->_redirect('genero/index');
    }
    
    public function excluirAction()
    {
        $this->modelGenero->delete($this->_getParam('id'));

        $this->_redirect('genero/index');
    }

}