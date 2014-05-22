<?php

/**
 * Controller de Pescadores
 *
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 *
 */
class PescadorController extends Zend_Controller_Action {

    private $modelPescador;

    public function init() {

        if (!Zend_Auth::getInstance()->hasIdentity()) {
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');

        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;

        $this->modelPescador = new Application_Model_Pescador();
    }

    public function indexAction() {
        $dados = $this->modelPescador->select();

        $this->view->assign("dados", $dados);
    }

    public function visualizarAction() {
        $idPescador = $this->_getParam('id');

        $usuario = $this->modelPescador->find($idPescador);

        $this->view->assign("pescador", $usuario);
    }

    public function novoAction() {
        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        $this->view->assign("municipios", $municipios);

        $modelArtePesca = new Application_Model_ArtePesca();
        $artesPesca = $modelArtePesca->select();
        $this->view->assign("artesPesca", $artesPesca);

        $modelAreaPesca = new Application_Model_AreaPesca();
        $areasPesca = $modelAreaPesca->select();
        $this->view->assign("areasPesca", $areasPesca);

        $modelColonia = new Application_Model_Colonia();
        $colonias = $modelColonia->select();
        $this->view->assign("colonias", $colonias);

        $modelEspecie = new Application_Model_Especie();
        $especies = $modelEspecie->select();
        $this->view->assign("especies", $especies);

        $modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $this->view->assign("tiposEmbarcacao", $tiposEmbarcacao);

        $modelPorteEmbarcacao = new Application_Model_PorteEmbarcacao();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();
        $this->view->assign("portesEmbarcacao", $portesEmbarcacao);

        $modelTipoCapturada = new Application_Model_TipoCapturadaModel();
        $tipoCapturadas = $modelTipoCapturada->select();
        $this->view->assign("tipoCapturadas", $tipoCapturadas);

        $modelTipoTelefone = new Application_Model_TipoTelefone();
        $tipoTelefones = $modelTipoTelefone->select();
        $this->view->assign("assignTipoTelefones", $tipoTelefones);

        $modelEscolaridade = new Application_Model_Escolaridade();
        $escolaridade = $modelEscolaridade->select();
        $this->view->assign("assignEscolaridades", $escolaridade);

        $modelTipoDependente = new Application_Model_TipoDependente();
        $tipoDependentes = $modelTipoDependente->select();
        $this->view->assign("assignTipoDependentes", $tipoDependentes);

        $modelRenda = new Application_Model_Renda();
        $rendas = $modelRenda->select();
        $this->view->assign("assignRendas", $rendas);

        $modelTipoRenda = new Application_Model_TipoRenda();
        $tipoRendas = $modelTipoRenda->select();
        $this->view->assign("assignTipoRendas", $tipoRendas);
    }

    public function criarAction() {
        $this->modelPescador->insert( $this->_getAllParams() );

        $this->_redirect('pescador/index');
    }

    public function editarAction() {
        $idPescador = $this->_getParam('id');
        
        $dados = $this->modelPescador->select();
        $dados = $this->modelPescador->find( $idPescador );
        $pescador = $this->modelPescador->find( $idPescador );
        $this->view->assign("pescador", $dados);
        

        $modelMunicipio = new Application_Model_Municipio();
        $municipios = $modelMunicipio->select();
        $this->view->assign("municipios", $municipios);

        $modelArtePesca = new Application_Model_ArtePesca();
        $artesPesca = $modelArtePesca->select();
        $this->view->assign("artesPesca", $artesPesca);

        $modelAreaPesca = new Application_Model_AreaPesca();
        $areasPesca = $modelAreaPesca->select();
        $this->view->assign("areasPesca", $areasPesca);

        $modelColonia = new Application_Model_Colonia();
        $colonias = $modelColonia->select();
        $this->view->assign("colonias", $colonias);

        $modelEspecie = new Application_Model_Especie();
        $especies = $modelEspecie->select();
        $this->view->assign("especies", $especies);

        $modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $this->view->assign("tiposEmbarcacao", $tiposEmbarcacao);

        $modelPorteEmbarcacao = new Application_Model_PorteEmbarcacao();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();
        $this->view->assign("portesEmbarcacao", $portesEmbarcacao);

        $modelTipoCapturada = new Application_Model_TipoCapturadaModel();
        $tipoCapturadas = $modelTipoCapturada->select();
        $this->view->assign("tipoCapturadas", $tipoCapturadas);

        $modelTipoTelefone = new Application_Model_TipoTelefone();
        $tipoTelefones = $modelTipoTelefone->select();
        $this->view->assign("assignTipoTelefones", $tipoTelefones);

        $modelEscolaridade = new Application_Model_Escolaridade();
        $escolaridade = $modelEscolaridade->select();
        $this->view->assign("assignEscolaridades", $escolaridade);

        $modelTipoDependente = new Application_Model_TipoDependente();
        $tipoDependentes = $modelTipoDependente->select();
        $this->view->assign("assignTipoDependentes", $tipoDependentes);

        $modelRenda = new Application_Model_Renda();
        $rendas = $modelRenda->select();
        $this->view->assign("assignRendas", $rendas);

        $modelTipoRenda = new Application_Model_TipoRenda();
        $tipoRendas = $modelTipoRenda->select();
        $this->view->assign("assignTipoRendas", $tipoRendas);
        
//     /_/_/_/_/_/_/_/_/_/_/_/_/_/ UTILIZA VIEW PARA FACILITAR MONTAGEM DA CONSULTA /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $model_VPescadorHasDependente = new Application_Model_VPescadorHasDependente();
        $vPescadorHasDependente = $model_VPescadorHasDependente->selectDependentes("tp_id=". $idPescador, "ttd_tipodependente", null);
        $this->view->assign("assign_vPescadorDependente", $vPescadorHasDependente);

        $model_VPescadorHasRenda = new Application_Model_VPescadorHasRenda();
        $vPescadorHasRenda = $model_VPescadorHasRenda->select("tp_id=" . $idPescador, "ttr_descricao", null);
        $this->view->assign("assign_vPescadorRenda", $vPescadorHasRenda);

        $model_VPescadorHasTelefone = new Application_Model_VPescadorHasTelefone();
        $vPescadorHasTelefone = $model_VPescadorHasTelefone->select("tpt_tp_id=" . $idPescador, "ttel_desc", null);
        $this->view->assign("assign_vPescadorHasTelefone", $vPescadorHasTelefone);

        $model_VPescadorHasColonia = new Application_Model_VPescadorHasColonia();
        $vPescadorHasColonia = $model_VPescadorHasColonia->select("tp_id=" . $idPescador, "tc_nome", null);
        $this->view->assign("assign_vPescadorColonia", $vPescadorHasColonia);

        $model_VPescadorHasAreaPesca = new Application_Model_VPescadorHasAreaPesca();
        $vPescadorHasAreaPesca = $model_VPescadorHasAreaPesca->select("tp_id=" . $idPescador, "tareap_areapesca", null);
        $this->view->assign("assign_vPescadorAreaPesca", $vPescadorHasAreaPesca);

        $model_VPescadorHasArteTipoArea = new Application_Model_VPescadorHasArteTipoArea();
        $vPescadorHasArteTipoArea = $model_VPescadorHasArteTipoArea->select("tp_id=" . $idPescador, "tap_artepesca", null);
        $this->view->assign("assign_vPescadorArteTipoArea", $vPescadorHasArteTipoArea);

        $model_VPescadorHasEmbarcacao = new Application_Model_VPescadorHasEmbarcacao();
        $vPescadorHasEmbarcacao = $model_VPescadorHasEmbarcacao->select("tp_id=" . $idPescador, "tte_tipoembarcacao", null);
        $this->view->assign("assign_vPescadorEmbarcacao", $vPescadorHasEmbarcacao);
    }

    public function atualizarAction() {
        $this->modelPescador->updateNovo($this->_getAllParams());

        $this->_redirect('pescador/index');
    }

    public function excluirAction() {
        $this->modelPescador->delete($this->_getParam('id'));

        $this->_redirect('pescador/index');
    }
    
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorenderecoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $tp_nome = $this->_getParam("tp_nome");
        $tp_sexo = $this->_getParam("tp_sexo");
        $tp_rg = $this->_getParam("tp_rg");
        $tp_cpf = $this->_getParam("tp_cpf");
        $tp_apelido = $this->_getParam("tp_apelido");
        $tp_matricula = $this->_getParam("tp_matricula");
        $tp_filiacaopai = $this->_getParam("tp_filiacaopai");
        $tp_filiacaomae = $this->_getParam("tp_filiacaomae");
        $tp_ctps = $this->_getParam("tp_ctps");
        $tp_pis = $this->_getParam("tp_pis");
        $tp_inss = $this->_getParam("tp_inss");
        $tp_nit_cei = $this->_getParam("tp_nit_cei");
        $tp_cma = $this->_getParam("tp_cma");
        $tp_rgb_maa_ibama = $this->_getParam("tp_rgb_maa_ibama");
        $tp_cir_cap_porto = $this->_getParam("tp_cir_cap_porto");
        $tp_datanasc = $this->_getParam("tp_datanasc");
        $tmun_id_natural = $this->_getParam("tmun_id_natural");
        $esc_id = $this->_getParam("esc_id");
        
        $te_logradouro = $this->_getParam("te_logradouro");
        $te_numero = $this->_getParam("te_numero");
        $te_bairro = $this->_getParam("te_bairro");
        $te_cep = $this->_getParam("te_cep");
        $te_comp = $this->_getParam("te_comp");
        $tmun_id = $this->_getParam("tmun_id");
        
        $backUrl = $this->_getParam("back_url");
        
        $idEndereco = $this->modelPescador->modelInsertPescadorHasEndereco(
                $te_logradouro,
                $te_numero,
                $te_bairro,
                $te_cep,
                $te_comp,                
                $tmun_id);
        
        $idPescador = $this->modelPescador->modelInsertPescador(
                $tp_nome, 
                $tp_sexo,
                $tp_rg,
                $tp_cpf,
                $tp_apelido,
                $tp_matricula,
                $tp_filiacaopai,
                $tp_filiacaomae,
                $tp_ctps,
                $tp_pis,
                $tp_inss,
                $tp_nit_cei,
                $tp_cma,
                $tp_rgb_maa_ibama,
                $tp_cir_cap_porto, 
                $tp_datanasc, 
                $tmun_id_natural,
                $idEndereco,
                $esc_id);

        $this->_redirect("/pescador/editar/id/" . $idPescador);

        return;
    }
 
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhasdependenteAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipoDependente = $this->_getParam("idDependente");

        $tptd_quantidade = $this->_getParam("quant");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasDependente($idPescador, $idTipoDependente, $tptd_quantidade);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhasdependenteAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipoDependente = $this->_getParam("idDependente");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasDependente($idPescador, $idTipoDependente);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhasrendaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipoRenda = $this->_getParam("idTipoRenda");

        $idRenda = $this->_getParam("idRenda");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasRenda($idPescador, $idTipoRenda, $idRenda);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhasrendaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipoRenda = $this->_getParam("idTipoRenda");

        $idRenda = $this->_getParam("idRenda");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasRenda($idPescador, $idTipoRenda, $idRenda);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhastelefoneAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTelenone = $this->_getParam("idTelenone");

        $nTelefone = $this->_getParam("nTelefone");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasTelefone($idPescador, $idTelenone, $nTelefone);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhastelefoneAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTelenone = $this->_getParam("idTelenone");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasTelefone($idPescador, $idTelenone );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhascoloniaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idColonia = $this->_getParam("idColonia");

        $dtaColonia = $this->_getParam("dtaColonia");
        
        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasColonia($idPescador, $idColonia, $dtaColonia);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhascoloniaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idColonia = $this->_getParam("idColonia");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasColonia($idPescador, $idColonia );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

 ///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Area /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhasareaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idArea = $this->_getParam("idArea");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasArea( $idPescador, $idArea );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhasareaAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idArea = $this->_getParam("idArea");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasArea( $idPescador, $idArea );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

 ///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Arte /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhasartetipoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idArte = $this->_getParam("idArte");

        $idTipo = $this->_getParam("idTipo");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasArteTipo( $idPescador, $idArte, $idTipo );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhasartetipoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idArte = $this->_getParam("idArte");

        $idTipo = $this->_getParam("idTipo");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasArteTipo( $idPescador, $idArte, $idTipo );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function insertpescadorhasembarcacoesAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idEmbarcacao = $this->_getParam("idEmbarcacao");

        $idPorte = $this->_getParam("idPorte");
        
        $isMotor = $this->_getParam("isMotor");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasEmbarcacoes($idPescador, $idEmbarcacao, $idPorte, $isMotor);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
    
    public function deletepescadorhasembarcacoesAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idEmbarcacao = $this->_getParam("idEmbarcacao");

        $idPorte = $this->_getParam("idPorte");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasEmbarcacoes($idPescador, $idEmbarcacao, $idPorte);

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }    
   
    public function relatorioAction() {

        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout->disableLayout();

        $modelPescador = new Application_Model_Pescador();
        $modelMunicipio = new Application_Model_Municipio();
        $modelArtePesca = new Application_Model_ArtePesca();
        $modelAreaPesca = new Application_Model_AreaPesca();
        $modelColonia = new Application_Model_Colonia();
        $modelEspecie = new Application_Model_Especie();
        $modelTipoEmbarcacao = new Application_Model_TipoEmbarcacao();
        $modelPorteEmbarcacao = new Application_Model_PorteEmbarcacao();

        $pescador = $modelPescador->select_Pescador_By_Municipio();
        //$pescador1 = $modelPescador->pescadorByMunicipio($municipio);

        $municipios = $modelMunicipio->select();
        $artesPesca = $modelArtePesca->select();
        $areasPesca = $modelAreaPesca->select();
        $colonias = $modelColonia->select();
        $especies = $modelEspecie->select();
        $tiposEmbarcacao = $modelTipoEmbarcacao->select();
        $portesEmbarcacao = $modelPorteEmbarcacao->select();


        $y = 55;
        $width = 20;
        $height = 6;
        $same_line = 0;
        $next_line = 1;
        $border_true = 1;

        $pdf = new FPDF("L", "mm", "A4");

        $pdf->Open();
        $pdf->SetMargins(10, 20, 5);
        $pdf->setTitulo("Pescadores");
        $pdf->SetAutoPageBreak(true, 40);
        $pdf->AddPage();

        //Title
        $pdf->SetFont("Arial", "B", 8);
        $pdf->SetY($y);
        $pdf->Cell($width / 2, $height, "ID", $border_true, $same_line);
        $pdf->Cell($width + 20, $height, "Nome", $border_true, $same_line);
        $pdf->Cell($width, $height, "Sexo", $border_true, $same_line);
        $pdf->Cell($width, $height, "Matricula", $border_true, $same_line);
        $pdf->Cell($width, $height, "Apelido", $border_true, $same_line);
        $pdf->Cell($width + 20, $height, "Pai", $border_true, $same_line);
        $pdf->Cell($width + 20, $height, "Mãe", $border_true, $same_line);
        $pdf->Cell($width, $height, "Naturalidade", $border_true, $same_line);
        $pdf->Cell($width, $height, "Estado", $border_true, $next_line);
        //Dados
        $pdf->SetFont("Arial", "", 8);
        sort($pescador);
        foreach ($pescador as $dados) {
            $pdf->Cell($width / 2, $height, $dados['TP_ID'], $border_true, $same_line);
            $pdf->Cell($width + 20, $height, $dados['TP_Nome'], $border_true, $same_line);
            if ($dados['TP_Sexo'] == "M") {
                $pdf->Cell($width, $height, "Masculino", $border_true, $same_line);
            } else {
                $pdf->Cell($width, $height, "Feminino", $border_true, $same_line);
            }

            $pdf->Cell($width, $height, $dados['TP_Matricula'], $border_true, $same_line);
            $pdf->Cell($width, $height, $dados['TP_Apelido'], $border_true, $same_line);
            $pdf->Cell($width + 20, $height, $dados['TP_FiliacaoPai'], $border_true, $same_line);
            $pdf->Cell($width + 20, $height, $dados['TP_FiliacaoMae'], $border_true, $same_line);
            $pdf->Cell($width, $height, $dados['TMun_Municipio'], $border_true, $same_line);
            $pdf->Cell($width, $height, $dados["TUF_Sigla"], $border_true, $next_line);
        }


        $pdf->Output("cadastroPdf.pdf", 'I');
    }

}
