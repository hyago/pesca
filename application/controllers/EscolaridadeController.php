<?php

class EscolaridadeController extends Zend_Controller_Action
{
      private $modelEscolaridade;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelEscolaridade = new Application_Model_Escolaridade();
    }

    public function indexAction()
    {
        $escolaridade = $this->modelEscolaridade->select();
      
        $this->view->assign("escolaridades", $escolaridade);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelEscolaridade->insert($this->_getAllParams());

        $this->_redirect('escolaridade/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $escolaridade = $this->modelEscolaridade->find($this->_getParam('id'));
        
        $this->view->assign("escolaridades", $escolaridade);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelEscolaridade->update($this->_getAllParams());

        $this->_redirect('escolaridade/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelEscolaridade->delete($this->_getParam('id'));

        $this->_redirect('escolaridade/index');
    }


}



