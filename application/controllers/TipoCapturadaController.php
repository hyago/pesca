<?php

class TipoCapturadaController extends Zend_Controller_Action
{
  private $modelTipoCapturada;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelTipoCapturada = new Application_Model_TipoCapturadaModel();
    }

    public function indexAction()
    {
        $tipoCapturada = $this->modelTipoCapturada->select();
      
        $this->view->assign("tipoCapturada", $tipoCapturada);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modelTipoCapturada->insert($this->_getAllParams());

        $this->_redirect('tipo-capturada/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoCapturada = $this->modelTipoCapturada->find($this->_getParam('id'));
        
        $this->view->assign("tipoCapturada", $tipoCapturada);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelTipoCapturada->update($this->_getAllParams());

        $this->_redirect('tipo-capturada/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelTipoCapturada->delete($this->_getParam('id'));

        $this->_redirect('tipo-capturada/index');
    }
    
}

