<?php

class PorteEmbarcacaoController extends Zend_Controller_Action
{
      private $modelPorteEmbarcacao;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelPorteEmbarcacao = new Application_Model_PorteEmbarcacao();
    }

    public function indexAction()
    {
        $dados = $this->modelPorteEmbarcacao->select();
      
        $this->view->assign("dados", $dados);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelPorteEmbarcacao->insert($this->_getAllParams());

        $this->_redirect('porte-embarcacao/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $porteEmb = $this->modelPorteEmbarcacao->find($this->_getParam('id'));
        
        $this->view->assign("porteEmbarcacao", $porteEmb);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelPorteEmbarcacao->update($this->_getAllParams());

        $this->_redirect('porte-embarcacao/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelPorteEmbarcacao->delete($this->_getParam('id'));

        $this->_redirect('porte-embarcacao/index');
    }


}

