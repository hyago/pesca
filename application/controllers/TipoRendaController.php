<?php


class TipoRendaController extends Zend_Controller_Action
{
      private $ModeloTipoRenda;
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
        
        
        
        $this->ModeloTipoRenda = new Application_Model_TipoRenda();
    }

    public function indexAction()
    {
        $tipoRenda = $this->ModeloTipoRenda->select( NULL, 'ttr_descricao', NULL );
      
        $this->view->assign("assignTipoRenda", $tipoRenda);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->ModeloTipoRenda->insert($this->_getAllParams());

        $this->_redirect('tipo-renda/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoRenda = $this->ModeloTipoRenda->find($this->_getParam('id'));
        
        $this->view->assign("assignTipoRenda", $tipoRenda);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->ModeloTipoRenda->update($this->_getAllParams());

        $this->_redirect('tipo-renda/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->ModeloTipoRenda->delete($this->_getParam('id'));

        $this->_redirect('tipo-renda/index');
    }
    
    public function beforeExcluirAction()
    {
        
    }


}





