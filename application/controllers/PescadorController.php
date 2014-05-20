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

class PescadorController extends Zend_Controller_Action
{

    private $modelPescador = null;

    public function init()
    {

        if (!Zend_Auth::getInstance()->hasIdentity()) {
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');

        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;

        $this->modelPescador = new Application_Model_Pescador();
    }

    public function indexAction()
    {
        $dados = $this->modelPescador->select();

        $this->view->assign("dados", $dados);
    }

    public function visualizarAction()
    {
        $idPescador = $this->_getParam('id');

        $usuario = $this->modelPescador->find($idPescador);

        $this->view->assign("pescador", $usuario);
    }

    public function novoAction()
    {
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

        $modelEscolaridade= new Application_Model_Escolaridade();
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

    public function criarAction()
    {
        $this->modelPescador->insert( $this->_getAllParams() );

        $this->_redirect('pescador/index');
    }

    public function editarAction()
    {
         $pescador = $this->modelPescador->find($this->_getParam('id'));
        $this->view->assign("pescador", $pescador);

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

        $modelEscolaridade= new Application_Model_Escolaridade();
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
        $vPescadorHasDependente = $model_VPescadorHasDependente->select("tp_id=" . $pescador['tp_id'], "ttd_tipodependente", null);
        $this->view->assign("assign_vPescadorDependente", $vPescadorHasDependente);

        $model_VPescadorHasRenda = new Application_Model_VPescadorHasRenda();
        $vPescadorHasRenda = $model_VPescadorHasRenda->select("tp_id=" . $pescador['tp_id'], "ttr_descricao", null);
        $this->view->assign("assign_vPescadorRenda", $vPescadorHasRenda);

        $model_VPescadorHasTelefone = new Application_Model_VPescadorHasTelefone();
        $vPescadorHasTelefone = $model_VPescadorHasTelefone->select("tpt_tp_id=" . $pescador['tp_id'], "ttel_desc", null);
        $this->view->assign("assign_vPescadorHasTelefone", $vPescadorHasTelefone);

        $model_VPescadorHasColonia = new Application_Model_VPescadorHasColonia();
        $vPescadorHasColonia = $model_VPescadorHasColonia->select("tp_id=" . $pescador['tp_id'], "tc_nome", null);
        $this->view->assign("assign_vPescadorColonia", $vPescadorHasColonia);

        $model_VPescadorHasArteTipoArea = new Application_Model_VPescadorHasArteTipoArea();
        $vPescadorHasArteTipoArea = $model_VPescadorHasArteTipoArea->select("tp_id=" . $pescador['tp_id'], "tap_artepesca", null);
        $this->view->assign("assign_vPescadorArteTipoArea", $vPescadorHasArteTipoArea);

        $model_VPescadorHasEmbarcacao = new Application_Model_VPescadorHasEmbarcacao();
        $vPescadorHasEmbarcacao = $model_VPescadorHasEmbarcacao->select("tp_id=" . $pescador['tp_id'], "tte_tipoembarcacao", null);
        $this->view->assign("assign_vPescadorEmbarcacao", $vPescadorHasEmbarcacao);
    }

    public function atualizarAction()
    {
        $this->modelPescador->updateNovo($this->_getAllParams());

        $this->_redirect('pescador/index');
    }

    public function excluirAction()
    {
        $this->modelPescador->delete($this->_getParam('id'));

        $this->_redirect('pescador/index');
    }

     public function testeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $tmpVar = explode(",", $idPescador = $this->_getParam("idPescador"));

        $idPescador = $tmpVar[0];

        $idTipoDependente = $tmpVar[2];

        $tptd_quantidade = $tmpVar[4];

//        
//         $idPescador = $this->_getParam("idPescador");
//         
//         $idTipoDependente = $this->_getParam("idTipoDependente");
//         
//         $tptd_quantidade = $this->_getParam("tptd_quantidade");

        $this->modelPescador->updateNovo($idPescador, $idTipoDependente, $tptd_quantidade);

        $this->redirect("http://localhost/pescador/novo");
        return;
    }

    public function relatorioAction()
    {

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

