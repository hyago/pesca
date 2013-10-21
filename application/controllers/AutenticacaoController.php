<?php

class AutenticacaoController extends Zend_Controller_Action
{

    public function init()
    {
        
    }

    public function indexAction()
    {
        
    }
    
    public function loginAction()
    {
        $this->_helper->viewRenderer->setNoRender();
        
        $dbAdapter = Zend_Db_Table_Abstract::getDefaultAdapter();
        $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
        
        $authAdapter->setTableName('Login')
            ->setIdentityColumn('login')
            ->setCredentialColumn('hashSenha');
        
        $authAdapter->setIdentity($this->_getParam('login'))
            ->setCredential(sha1($this->_getParam('senha')));
        
        $result = $authAdapter->authenticate();
        
        if($result->isValid()){        
            $usuario = $authAdapter->getResultRowObject();

            $storage = Zend_Auth::getInstance()->getStorage();
            $storage->write($usuario);

            $this->_redirect('index');
        }else{
            $this->_redirect('autenticacao/falha');
        }
    }
    
    public function logoutAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
        
        $this->_redirect('index');
    }

}

