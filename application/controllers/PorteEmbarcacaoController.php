<?php

class PorteEmbarcacaoController extends Zend_Controller_Action
{
      private $modelPorteEmbarcacao;
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
        
        
        
        $this->modelPorteEmbarcacao = new Application_Model_PorteEmbarcacao();
    }

    public function indexAction()
    {
        $dados = $this->modelPorteEmbarcacao->select();
      
        $this->view->assign("dados", $dados);
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
        $this->modelPorteEmbarcacao->insert($this->_getAllParams());

        $this->_redirect('porte-embarcacao/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
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
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelPorteEmbarcacao->delete($this->_getParam('id'));

        $this->_redirect('porte-embarcacao/index');
    
        }
    }


}

