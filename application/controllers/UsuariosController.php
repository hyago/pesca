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
class PDF Extends FPDF{
       
    function Header(){
        
        
        $view = "Pescador";
        $width = 30;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_false = 0;
        $y = 0;

        date_default_timezone_set('America/Bahia');
        //Cabecalho
        $this->SetY($y);
        $this->SetFont("Arial", "B",14);
        $this->Image("img/Cabecalho1.jpg", null, null, 180, 30);
        $this->SetTextColor(78, 22, 35);
        $this->Cell($width, $height, "Relatorio ->", $border_false, $same_line);
        $this->Cell($width+70, $height, $view, $border_false, $same_line);
        $this->Cell($width, $height, date("d/m/Y - H:i:s"), $border_false, $next_line);
        $this->Cell($width, $height, "___________________________________________________________________", $border_false, $next_line);
        $this->Cell($width, $height, "Dados:", $border_false, $next_line);
        $this->Cell($width, $height, "", $border_false, $next_line);
            
    } 
    
    
   function Footer(){
       
       $y = 255;
       $width = 0;
       $height = 5;
       $center = 100;
       
       $this->SetY($y);
       $this->Cell(0, 5, "_____________________________________________________________________________________________", 0, 1);
       $this->SetFont('Arial','I',8);
       $this->MultiCell($width, $height, $this->page, 0, "C");
       $this->SetX($center-6);
       $this->Image("img/isus.jpg",10, null, 20, 10);
       $this->Image("img/bamin.jpg", 175, 265, 20, 10);
       
    }    
  
    
}