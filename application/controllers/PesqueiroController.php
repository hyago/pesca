<?php

class PesqueiroController extends Zend_Controller_Action
{
    private $usuario;
    public function init()
    {   
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $identity2 = get_object_vars($identity);
          
        }
        
        $this->modelUsuario = new Application_Model_Usuario();
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        $this->modelPesqueiro = new Application_Model_Pesqueiro();
        
    }

    public function indexAction()
    {
        $fromPesqueiro = $this->modelPesqueiro->select();
        
        $this->view->assign('dadosPesqueiros', $fromPesqueiro);
    }
    public function novoAction(){
    
    }
    
    public function criarAction(){
        $this->modelPesqueiro->insert($this->_getAllParams());

        $this->_redirect('pesqueiro/index');
    }
    
    public function editarAction(){
        
        $idPesqueiro = $this->_getParam('id');
        $fromPesqueiro = $this->modelPesqueiro->find($idPesqueiro);
        
        $this->view->assign('dadosPesqueiros', $fromPesqueiro);
    }
    public function atualizarAction()
    {
        $this->modelPesqueiro->update($this->_getAllParams());

        $this->_redirect('pesqueiro/index');
    }
    
    
    public function excluirAction(){
        
        $idPesqueiro = $this->_getParam('id');
        
        $this->modelPesqueiro->delete($idPesqueiro);
        
        $this->_redirect('pesqueiro/index');
        
    }
}

