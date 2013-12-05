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
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelUsuario = new Application_Model_Usuario();
    }
    
    /*
     * Lista todos os usuários ativos
     */
    public function indexAction()
    {
        $whereUsuario= '"TU_UsuarioDeletado" IS FALSE';
        
        $dados = $this->modelUsuario->select($whereUsuario);
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Consulta um usuário
     */
    public function visualizarAction()
    {
        $idUsuario = $this->_getParam('id');
        
        $usuario = $this->modelUsuario->find($idUsuario);
        
        $modelTelefone = new Application_Model_Telefone();
        $telefoneResidencial = $modelTelefone->getTelefone($idUsuario, 'Residencial');
        $telefoneCelular = $modelTelefone->getTelefone($idUsuario, 'Celular');
         
        $this->view->assign("usuario", $usuario);
        $this->view->assign("telefoneResidencial", $telefoneResidencial);
        $this->view->assign("telefoneCelular", $telefoneCelular);
    }
 
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        $modelPerfil = new Application_Model_Perfil();
        $perfis = $modelPerfil->select();
        
        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        
        $this->view->assign("perfis", $perfis);
        $this->view->assign("municipios", $municipios);
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
	
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
        $modelPerfil = new Application_Model_Perfil();
        $perfis = $modelPerfil->select();
        $usuario = $this->modelUsuario->find($this->_getParam('id'));
        
        $this->view->estados = array("AC", "AL", "AM", "AP",  "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO");
        $this->view->assign("perfis", $perfis);
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