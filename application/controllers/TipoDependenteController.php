<?php

class TipoDependenteController extends Zend_Controller_Action
{
      private $modeloTipoDependente;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modeloTipoDependente = new Application_Model_TipoDependente();
    }

    public function indexAction()
    {
        $tipoDependente = $this->modeloTipoDependente->select();
      
        $this->view->assign("assignTipoDependente", $tipoDependente);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modeloTipoDependente->insert($this->_getAllParams());

        $this->_redirect('tipo-dependente/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoDependente = $this->modeloTipoDependente->find($this->_getParam('id'));
        
        $this->view->assign("assignTipoDependente", $tipoDependente);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modeloTipoDependente->update($this->_getAllParams());

        $this->_redirect('tipo-dependente/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modeloTipoDependente->delete($this->_getParam('id'));

        $this->_redirect('tipo-dependente/index');
    }


}





