<?php

class EscolaridadeController extends Zend_Controller_Action
{
      private $modelEscolaridade;
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
        
        
        
        $this->modelEscolaridade = new Application_Model_Escolaridade();
    }

    public function indexAction()
    {
        $escolaridade = $this->modelEscolaridade->select( NULL, 'esc_nivel', NULL );
      
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




