<?php

class RendaController extends Zend_Controller_Action
{
      private $modelRenda;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelRenda = new Application_Model_Renda();
    }

    public function indexAction()
    {
        $renda = $this->modelRenda->select(null, 'ren_id', null);
      
        $this->view->assign("rendas", $renda);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelRenda->insert($this->_getAllParams());

        $this->_redirect('renda/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $renda = $this->modelRenda->find($this->_getParam('id'));
        
        $this->view->assign("rendas", $renda);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelRenda->update($this->_getAllParams());

        $this->_redirect('renda/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelRenda->delete($this->_getParam('id'));

        $this->_redirect('renda/index');
    }


}


