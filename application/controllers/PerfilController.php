<?php

class PerfilController extends Zend_Controller_Action {

    private $ModeloPerfil;
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
        
        
        $this->ModeloPerfil = new Application_Model_Perfil();
    }

    public function indexAction() {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        $dadosPerfil = $this->ModeloPerfil->select(NULL, 'tp_perfil', NULL);

        $this->view->assign("assignPerfil", $dadosPerfil);
    }

    public function deleteAction() {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $this->ModeloPerfil->delete($this->_getParam('tp_id'));

        $this->_redirect('perfil/index');
        }
    }
    

    public function insertAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array('tp_perfil' => $this->_getParam("tp_perfil"));

        $this->ModeloPerfil->insert($setupDados);

        $this->_redirect("/perfil/index");

        return;
    }

    public function updateAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $setupDados = array(
            'tp_id' => $this->_getParam("tp_id"),
            'tp_perfil' => $this->_getParam("tp_perfil")
        );

        $this->ModeloPerfil->update($setupDados);

        $this->_redirect("/perfil/index");

        return;
    }

}
