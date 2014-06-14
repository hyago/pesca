<?php

class ProgramaSocialController extends Zend_Controller_Action
{
      private $modelProgramaSocial;
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
        
        
        
        $this->modelProgramaSocial = new Application_Model_ProgramaSocial();
    }

    public function indexAction()
    {
        $programaSocial = $this->modelProgramaSocial->select( NULL, 'prs_programa', NULL );
      
        $this->view->assign("programasSocial", $programaSocial);
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
        $this->modelProgramaSocial->insert($this->_getAllParams());

        $this->_redirect('programa-social/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
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
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelProgramaSocial->delete($this->_getParam('id'));

        $this->_redirect('programa-social/index');
        }
    }


}


