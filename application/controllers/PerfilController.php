<?php

class PerfilController extends Zend_Controller_Action {

    private $ModeloPerfil;

    public function init() {
        if (!Zend_Auth::getInstance()->hasIdentity()) {
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');

        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();

        $this->view->usuarioLogado = $this->usuarioLogado;

        $this->ModeloPerfil = new Application_Model_Perfil();
    }

    public function indexAction() {
        $dadosPerfil = $this->ModeloPerfil->select(NULL, 'tp_perfil', NULL);

        $this->view->assign("assignPerfil", $dadosPerfil);
    }

    public function deleteAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $this->ModeloPerfil->delete($this->_getParam('tp_id'));

        $this->_redirect('perfil/index');
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
