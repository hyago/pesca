<?php

class TempoController extends Zend_Controller_Action
{
    private $modelTempo;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelTempo = new Application_Model_Tempo();
    }

    public function indexAction()
    {        
        $dados = $this->modelTempo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
    }
    
    public function criarAction()
    {
        $this->modelTempo->insert($this->_getAllParams());

        $this->_redirect('tempo/index');
    }
    
    public function editarAction()
    {
        $tempo = $this->modelTempo->find($this->_getParam('id'));
        
        $this->view->assign("tempo", $tempo);
    }
   
    public function atualizarAction()
    {
        $this->modelTempo->update($this->_getAllParams());

        $this->_redirect('tempo/index');
    }
 
    public function excluirAction()
    {
        $this->modelTempo->delete($this->_getParam('id'));

        $this->_redirect('tempo/index');
    }

}