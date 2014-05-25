
<?php
//$this->view->headScript()->appendFile('/js/filename.js');
//$this->headScript()->appendFile('/js/funcoes.js');

class TipoTelefoneController extends Zend_Controller_Action
{
      private $modeloTipoTelefone;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modeloTipoTelefone = new Application_Model_TipoTelefone();
    }

    public function indexAction()
    {
        $tipoTelefone = $this->modeloTipoTelefone->select(NULL, 'ttel_desc', NULL);
      
        $this->view->assign("assignTipoTelefone", $tipoTelefone);
    }
    
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Area de Pesca
     */
    public function criarAction()
    {
        $this->modeloTipoTelefone->insert($this->_getAllParams());

        $this->_redirect('tipo-telefone/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $tipoTelefone = $this->modeloTipoTelefone->find($this->_getParam('id'));
        
        $this->view->assign("assignTipoTelefone", $tipoTelefone);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modeloTipoTelefone->update($this->_getAllParams());

        $this->_redirect('tipo-telefone/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modeloTipoTelefone->delete($this->_getParam('id'));

        $this->_redirect('tipo-telefone/index');
    }
    
    public function beforeExcluirAction()
    {
        
    }


}





