<?php

class FichaDiariaController extends Zend_Controller_Action {

    private $modelFichaDiaria;
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
        
        
        $this->modelMonitoramento = new Application_Model_Monitoramento();
        $this->modelFichaDiaria = new Application_Model_FichaDiaria();
        $this->modelPorto = new Application_Model_Porto();
        $this->modelTempo = new Application_Model_Tempo();
        $this->modelVento = new Application_Model_Vento();
        $this->modelArtePesca = new Application_Model_ArtePesca();
        $this->modelEstagiario = new Application_Model_Usuario();
    }

    /*
     * Lista todas as artes de pesca
     */

    public function indexAction() {
        $fd_id = $this->_getParam("fd_id");
        $pto_id = $this->_getParam("pto_id");
        $fd_data = $this->_getParam("fd_data");
        
        if ( $fd_id > 0 ) {
            $dados = $this->modelFichaDiaria->selectView("fd_id>=". $fd_id, array('fd_id'), 25);
        } elseif ( $pto_id ) {
            if ( $fd_data ) {
                $dados = $this->modelFichaDiaria->selectView("pto_id =". $pto_id ." and fd_data = '". $fd_data."'" , NULL, 25);            
            } else {
                $dados = $this->modelFichaDiaria->selectView("pto_id =". $pto_id , NULL, 25);            
            }
        } else {
            $dados = $this->modelFichaDiaria->selectView(NULL, NULL, 25);
        }
         
        $dadosPorto = $this->modelPorto->select();

        $this->view->assign("assignDadosPorto", $dadosPorto);
        $this->view->assign("dados", $dados);
    }


    /*
     * Exibe formulário para cadastro de um usuário
     */

    public function novoAction() {

        //------------------------------------------
        $dados = $this->modelFichaDiaria->select();

        $this->view->assign("dados", $dados);
        //--------------------------------------
        $porto = $this->modelPorto->select();

        $this->view->assign("dados_porto", $porto);
        //----------------------------------------
        $tempo = $this->modelTempo->select();

        $this->view->assign("dados_tempo", $tempo);
        //-------------------------------------------
        $vento = $this->modelVento->select();

        $this->view->assign("dados_vento", $vento);
        //-------------------------------------------
        $artePesca = $this->modelArtePesca->select();

        $this->view->assign("artesPesca", $artePesca);
        //---------------------------------------------
        
        $usuario = $this->modelEstagiario->select();

        $this->view->assign("users", $usuario);
        //--------------------------------------------
    }

    /*
     * Cadastra uma Arte de Pesca
     */

    public function criarAction() {

        $idFichaDiaria = $this->modelFichaDiaria->insert($this->_getAllParams());
        
        
        $this->_redirect("/ficha-diaria/editar/id/" . $idFichaDiaria);
    }

    /*
     * Preenche um formulario com as informações de um usuário
     */

    public function editarAction() {
        $fichadiaria = $this->modelFichaDiaria->find($this->_getParam('id'));

        $this->view->assign("fichadiaria", $fichadiaria);
        //--------------------------------------
        $porto = $this->modelPorto->select();

        $this->view->assign("dados_porto", $porto);
        //----------------------------------------
        $tempo = $this->modelTempo->select();

        $this->view->assign("dados_tempo", $tempo);
        //-------------------------------------------
        $vento = $this->modelVento->select();

        $this->view->assign("dados_vento", $vento);
        //-------------------------------------------
        $artePesca = $this->modelArtePesca->select();

        $this->view->assign("artesPesca", $artePesca);
        //---------------------------------------------
        $usuario = $this->modelEstagiario->select();

        $this->view->assign("users", $usuario);
        //--------------------------------------------
        
        $idFicha = $this->_getParam('id');
        
        $modelMonitoramentoByFichaDiaria = new Application_Model_Monitoramento();
        $vMonitoramento = $modelMonitoramentoByFichaDiaria->select("fd_id=". $idFicha, "mnt_id", null);
        $this->view->assign("vMonitoramento", $vMonitoramento);
        
    }

    /*
     * Atualiza os dados do usuário
     */

    public function atualizarAction() {
        
    }
    
    public function insertmonitoramentoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        
        $Monitorada = $this->_getParam("SelectMonitorada");
        
        $idArtePesca = $this->_getParam("SelectArtePesca"); 

        $mnt_quantidade = $this->_getParam("QuantidadeEmbarcacoes");
        
        $idFicha = $this->_getParam("id_fichaDiaria");
        
        $backUrl = $this->_getParam("back_url");
       
        
        $this->modelMonitoramento->insert($idFicha, $idArtePesca, $mnt_quantidade, $Monitorada);

        $this->redirect("/ficha-diaria/editar/id/" . $backUrl);

        return;
    }
    public function deletmonitoramentoAction(){
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $idMonitoramento = $this->_getParam("id");

        $backUrl = $this->_getParam("back_url");

        $this->modelMonitoramento->delete($idMonitoramento);

        $this->redirect("/ficha-diaria/editar/id/" . $backUrl);
    }
    /*
     * 
     */

    public function excluirAction() {
        $this->modelFichaDiaria->delete($this->_getParam('id'));

        $this->_redirect('ficha-diaria/index');
    }

    public function relatorioAction() {

        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();

        $fichadiaria = $this->modelFichaDiaria->select();

        $this->view->assign("fichasdiarias", $fichadiaria);


        //Title 
        $y = 55;
        $width = 20;
        $height = 7;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;


        $pdf = new FPDF("P", "mm", "A4");
        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->setTitulo("Ficha Diária");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();
        //Title

        $pdf->SetFont("Arial", "B", 10);
        $pdf->SetY($y);
        $pdf->Cell($width / 2, $height, "ID", $border_true, $same_line);
        $pdf->Cell($width, $height, "Estagiário", $border_true, $same_line);
        $pdf->Cell($width, $height, "Monitor", $border_true, $same_line);
        $pdf->Cell($width, $height, "Data", $border_true, $same_line);
        $pdf->Cell($width, $height, "OBS", $border_true, $same_line);
        $pdf->Cell($width, $height, "Porto", $border_true, $same_line);
        $pdf->Cell($width, $height, "Tempo", $border_true, $same_line);
        $pdf->Cell($width, $height, "Vento", $border_true, $same_line);
        $pdf->Cell($width + 10, $height, "Turno", $border_true, $next_line);


        $pdf->SetFont("Arial", "", 10);
        sort($fichadiaria);
        foreach ($fichadiaria as $dados) {
            $pdf->Cell($width / 2, $height, $dados['FD_ID'], $border_true, $same_line);
            $pdf->Cell($width, $height, $dados['T_Estagiario_TU_ID'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['T_Monitor_TU_ID1'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['FD_Data'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['OBS'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['PTO_ID'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['TMP_ID'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['VNT_ID'], $border_true, $same_line);
            $pdf->Cell($width + 10, $height, $dados['FD_Turno'], $border_true, $same_line);
        }
        $pdf->Output("FichaDiaria.pdf", 'I');
    }

}
