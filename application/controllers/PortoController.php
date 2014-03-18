<?php

class PortoController extends Zend_Controller_Action
{
    private $modelPorto;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelPorto = new Application_Model_Porto();
    }

    public function indexAction()
    {        
        $dados = $this->modelPorto->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        $modelMunicipio = new Application_Model_Municipio();
        
        $municipios = $modelMunicipio->select();
        
        $this->view->assign("municipios", $municipios);
    }
    
    public function criarAction()
    {
        $this->modelPorto->insert($this->_getAllParams());

        $this->_redirect('porto/index');
    }
    
    public function editarAction()
    {
        $modelMunicipio = new Application_Model_Municipio();
        
        $municipios = $modelMunicipio->select();
        
        $this->view->assign("municipios", $municipios);
        
        $porto = $this->modelPorto->find($this->_getParam('id'));
        
        $this->view->assign("porto", $porto);
    }
   
    public function atualizarAction()
    {
        $this->modelPorto->update($this->_getAllParams());

        $this->_redirect('porto/index');
    }
 
    public function excluirAction()
    {
        $this->modelPorto->delete($this->_getParam('id'));

        $this->_redirect('porto/index');
    }

}