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

class AutenticacaoController extends Zend_Controller_Action
{

    public function init()
    {
        
    }

    public function indexAction()
    {
        
    }

    /*
     * Login de usuários
     */
    public function loginAction()
    {
        $login = $this->_getParam('login');
        $senha = $this->_getParam('senha');
        
        if (empty($login) || empty($senha)){
            $this->view->mensagem = "Preencha o formulário corretamente.";
        }else{                
            $this->_helper->viewRenderer->setNoRender();

            $dbAdapter = Zend_Db_Table_Abstract::getDefaultAdapter();
            $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

            $authAdapter->setTableName('T_Login')
                ->setIdentityColumn('TL_Login')
                ->setCredentialColumn('TL_HashSenha');

            $authAdapter->setIdentity($login)
                ->setCredential(sha1($senha));

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
    }
    
    /*
     * Logout de usuários
     */
    public function logoutAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
        
        $this->_redirect('index');
    }

}

