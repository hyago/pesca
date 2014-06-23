<?php

class DestinoPescadoController extends Zend_Controller_Action {

    private $ModeloDestinoPescado;
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
        
        
        $this->ModeloDestinoPescado = new Application_Model_DestinoPescado();
    }

    public function indexAction() {
         if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dadosDestinoPescado = $this->ModeloDestinoPescado->select(NULL, 'dp_destino', NULL);

        $this->view->assign("assignDestinoPescado", $dadosDestinoPescado);
    }

    public function deleteAction() {
         if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $this->ModeloDestinoPescado->delete($this->_getParam('dp_id'));

        $this->_redirect('destino-pescado/index');
        }
    }
    

    public function insertAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array('dp_destino' => $this->_getParam("dp_destino"));

        $this->ModeloDestinoPescado->insert($setupDados);

        $this->_redirect("/destino-pescado/index");

        return;
    }

    public function updateAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array(
            'dp_id' => $this->_getParam("dp_id"),
            'dp_destino' => $this->_getParam("dp_destino")
        );

        $this->ModeloDestinoPescado->update($setupDados);

        $this->_redirect("/destino-pescado/index");

        return;
    }

}
