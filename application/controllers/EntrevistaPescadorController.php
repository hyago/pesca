<?php

class EntrevistaPescadorController extends Zend_Controller_Action
{

    public function init()
    {
        if (!Zend_Auth::getInstance()->hasIdentity()) {
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');

        $auth = Zend_Auth::getInstance();
        if ($auth->hasIdentity()) {
            $identity = $auth->getIdentity();
            $identity2 = get_object_vars($identity);
        }

        $this->modelUsuario = new Application_Model_Usuario();
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario", $this->usuario);
        
        $this->modelEntrevistas = new Application_Model_Entrevistas();
    }

    public function indexAction()
    {
        $ent_pescador = $this->_getParam("tp_nome");
        $ent_barco = $this->_getParam("bar_nome");
        $ent_apelido = $this->_getParam("tp_apelido");

        if ($ent_pescador) {
            $dados = $this->modelEntrevistas->select("tp_nome LIKE '" . $ent_pescador . "%'", array('tp_nome', 'id'));
        } elseif ($ent_barco) {
            $dados = $this->modelEntrevistas->select("bar_nome LIKE '" . $ent_barco . "%'", array('bar_nome', 'id'));
         }
        elseif ($ent_apelido){
            $dados = $this->modelEntrevistas->select("tp_apelido LIKE '" . $ent_apelido . "%'", array('tp_apelido', 'id'));
        }
        else {
            $dados = $this->modelEntrevistas->select(null, array('artepesca', 'tp_nome'), 50);
        }

        $this->view->assign("dados", $dados);
    }
    
    

}

