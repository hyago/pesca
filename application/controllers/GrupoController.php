<?php

class GrupoController extends Zend_Controller_Action
{

    private $modelGrupo;
    
    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelGrupo = new Application_Model_Grupo();     
    }

    public function indexAction()
    {
        $dados = $this->modelGrupo->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction(){
    
    }
    
    public function criarAction()
    {
        $this->modelGrupo->insert($this->_getAllParams());

        $this->_redirect('grupo/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $grupo = $this->modelGrupo->find($this->_getParam('id'));
        
        $this->view->assign("grupo", $grupo);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelGrupo->update($this->_getAllParams());

        $this->_redirect('grupo/index');
    }
    
    public function excluirAction()
    {
        $this->modelGrupo->delete($this->_getParam('id'));

        $this->_redirect('grupo/index');
    }
    
}