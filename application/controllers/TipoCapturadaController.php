<?php

class TipoCapturadaController extends Zend_Controller_Action
{
  private $modelTipoCapturada;
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
        
        
        
        $this->modelTipoCapturada = new Application_Model_TipoCapturadaModel();
    }

    public function indexAction()
    {
        $tipoCapturada = $this->modelTipoCapturada->select( NULL, 'itc_tipo', NULL );
      
        $this->view->assign("tipoCapturada", $tipoCapturada);
    }
    
    public function novoAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
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
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
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
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelTipoCapturada->delete($this->_getParam('id'));

        $this->_redirect('tipo-capturada/index');
        }
    }
    
}

