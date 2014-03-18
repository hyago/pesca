<?php

class VentoController extends Zend_Controller_Action
{
    private $modelVento;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelVento = new Application_Model_Vento();
    }

    public function indexAction()
    {        
        $dados = $this->modelVento->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
    }
    
    public function criarAction()
    {
        $this->modelVento->insert($this->_getAllParams());

        $this->_redirect('vento/index');
    }
    
    public function editarAction()
    {
        $vento = $this->modelVento->find($this->_getParam('id'));
        
        $this->view->assign("vento", $vento);
    }
   
    public function atualizarAction()
    {
        $this->modelVento->update($this->_getAllParams());

        $this->_redirect('vento/index');
    }
 
    public function excluirAction()
    {
        $this->modelVento->delete($this->_getParam('id'));

        $this->_redirect('vento/index');
    }

}