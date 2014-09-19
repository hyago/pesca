<?php

/**
 * Controller de autenticação
 *
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class AutenticacaoController extends Zend_Controller_Action {

    public function init() {
        
    }

    public function indexAction() {
        
    }

    /*
     * Login de usuários
     */
    public function loginAction() {
        $this->modelUsuario = new Application_Model_Usuario();
        $login = $this->_getParam('login');
        $login2 = $login;
        $senha = $this->_getParam('senha');

        if (empty($login) || empty($senha)) {
            $this->view->mensagem = "Preencha o formulário corretamente.";
        } else {
            $this->_helper->viewRenderer->setNoRender();

            $dbAdapter = Zend_Db_Table_Abstract::getDefaultAdapter();
            $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

            $authAdapter->setTableName('t_login')->setIdentityColumn('tl_login')->setCredentialColumn('tl_hashsenha');

            $authAdapter->setIdentity($login)->setCredential(sha1($senha));

            $result = $authAdapter->authenticate();

            if ($result->isValid()) {
                $usuario = $authAdapter->getResultRowObject();
                
                $storage = Zend_Auth::getInstance()->getStorage();
                
                $storage->write($usuario);
                //
                $idLogin = $this->modelUsuario->selectNomeLogin($login2);
                $idUsuario = $this->modelUsuario->selectLogin($idLogin['tl_id']);
                $this->modelUsuario->insertLogin($idUsuario['tu_id']);
                //
                $this->_redirect('index');
            } else {
                $this->_redirect('autenticacao/logout');
            }
        }
    }

    /*
     * Logout de usuários
     */
    public function logoutAction() {
        Zend_Auth::getInstance()->clearIdentity();

        $this->_redirect('index');
    }

}
