<?php

class ProgramaSocialController extends Zend_Controller_Action
{
      private $modelProgramaSocial;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelProgramaSocial = new Application_Model_ProgramaSocial();
    }

    public function indexAction()
    {
        $programaSocial = $this->modelProgramaSocial->select( NULL, 'prs_programa', NULL );
      
        $this->view->assign("programasSocial", $programaSocial);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelProgramaSocial->insert($this->_getAllParams());

        $this->_redirect('programa-social/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $programaSocial = $this->modelProgramaSocial->find($this->_getParam('id'));
        
        $this->view->assign("programasSocial", $programaSocial);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelProgramaSocial->update($this->_getAllParams());

        $this->_redirect('programa-social/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelProgramaSocial->delete($this->_getParam('id'));

        $this->_redirect('programa-social/index');
    }


}


