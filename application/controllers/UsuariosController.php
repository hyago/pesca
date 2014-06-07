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


 require_once "../library/fpdf/fpdf.php";


class UsuariosController extends Zend_Controller_Action
{
    private $modelUsuario;
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
        $this->usuario = $this->modelUsuario->find($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
        
        
        
        $this->modelUsuario = new Application_Model_Usuario();
    }
    
    /*
     * Lista todos os usuários ativos
     */
    public function indexAction()
    {
        $whereUsuario= '"tu_usuariodeletado" IS FALSE';
        
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
        
        $modelMunicipios = new Application_Model_Municipio();
        $municipios = $modelMunicipios->select();
        
        $modelUf = new Application_Model_UfMapper();
        $ufs = $modelUf->select();
        
        $usuario = $this->modelUsuario->find($this->_getParam('id'));
        
        $this->view->assign("perfis", $perfis);
        $this->view->assign("municipios", $municipios);
        $this->view->assign("ufs", $ufs);
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

    public function senhaAction(){
        
        $usuarioForm = $this->_getAllParams();
        
        $idUser = $usuarioForm['login'];
        $senhaAntiga = $usuarioForm['SenhaAntiga'];
        $senhaNova = $usuarioForm['novaSenha'];
        
        $user = $this->modelUsuario->find($idUser);
        
        
        
        $senhaAntiga1 = sha1($senhaAntiga);
        
        
        
    }
   
}