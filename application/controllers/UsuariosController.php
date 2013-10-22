<?php

/** 
 * Controller de Usuários
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class UsuariosController extends Zend_Controller_Action
{
    private $modelUsuario;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->modelUsuario = new Application_Model_Usuario();
    }
    
    /*
     * Lista todos os usuários
     */
    public function indexAction()
    {
        $dados = $this->modelUsuario->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Consulta um usuário
     */
    public function visualizarAction()
    {
        $usuario = $this->modelUsuario->find($this->_getParam('id'));
 
        $this->view->assign("usuario", $usuario);
    }
 
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {

    }
 
    /*
     * Cadastra um usuário
     */
    public function criarAction()
    {
        $this->modelUsuario->insert($this->_getAllParams());

        $this->_redirect('usuarios/index');
    }
 
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $usuario = $this->modelUsuario->find($this->_getParam('id'));

        $this->view->assign("usuario", $usuario);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelUsuario->update($this->_getAllParams());

        $this->_redirect('usuarios/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelUsuario->delete($this->_getParam('id'));

        $this->_redirect('usuarios/index');
    }

}