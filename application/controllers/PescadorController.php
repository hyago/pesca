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
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);


        $this->modelPescador = new Application_Model_Pescador();
    }

    public function indexAction() {
        $tp_id = $this->_getParam("tp_id");
        $tp_nome = $this->_getParam("tp_nome");

        if ( $tp_id > 0 ) {
            $dados = $this->modelPescador->select("tp_id>=". $tp_id, array('tp_id'), 20);
        } elseif ( $tp_nome ) {
            $dados = $this->modelPescador->select("tp_nome LIKE '". $tp_nome."%'", array('tp_nome', 'tp_id'), 20);
        } else {
            $dados = $this->modelPescador->select(null, array('tp_nome', 'tp_id'), 20);
        }

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

        $modelEscolaridade = new Application_Model_Escolaridade();
        $escolaridade = $modelEscolaridade->select();
        $this->view->assign("assignEscolaridades", $escolaridade);

        $modelUser = new Application_Model_Usuario();
        $tipoUser = $modelUser->select();
        $this->view->assign("assignUser", $tipoUser);
    }

    public function criarAction() {
        $this->modelPescador->insert($this->_getAllParams());

        $this->_redirect('pescador/index');
    }

    public function editarAction() {
        $idPescador = $this->_getParam('id');

        $pescador = $this->modelPescador->find( $idPescador );
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

        $modelProgramaSocial = new Application_Model_ProgramaSocial();
        $tipoProgramaSocial = $modelProgramaSocial->select();
        $this->view->assign("assignProgramaSocial", $tipoProgramaSocial);

        $modelComunidade = new Application_Model_Comunidade();
        $tipoComunidade = $modelComunidade->select();
        $this->view->assign("assignComunidade", $tipoComunidade);

        $modelPorto = new Application_Model_Porto();
        $tipoPorto = $modelPorto->select();
        $this->view->assign("assignPorto", $tipoPorto);

        $modelUser = new Application_Model_Usuario();
        $tipoUser = $modelUser->select();
        $this->view->assign("assignUser", $tipoUser);

//     /_/_/_/_/_/_/_/_/_/_/_/_/_/ UTILIZA VIEW PARA FACILITAR MONTAGEM DA CONSULTA /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $model_VPescadorHasDependente = new Application_Model_VPescadorHasDependente();
        $vPescadorHasDependente = $model_VPescadorHasDependente->selectDependentes("tp_id=". $idPescador, "ttd_tipodependente", null);
        $this->view->assign("assign_vPescadorDependente", $vPescadorHasDependente);

        $model_VPescadorHasRenda = new Application_Model_VPescadorHasRenda();
        $vPescadorHasRenda = $model_VPescadorHasRenda->select("tp_id=" . $idPescador, "ttr_descricao", null);
        $this->view->assign("assign_vPescadorRenda", $vPescadorHasRenda);

        $model_VPescadorHasComunidade = new Application_Model_VPescadorHasComunidade();
        $vPescadorHasComunidade = $model_VPescadorHasComunidade->select("tp_id=" . $idPescador, "tcom_nome", null);
        $this->view->assign("assign_vPescadorComunidade", $vPescadorHasComunidade);

        $model_VPescadorHasProgramaSocial = new Application_Model_VPescadorHasProgramaSocial();
        $vPescadorHasProgramaSocial = $model_VPescadorHasProgramaSocial->select("tp_id=" . $idPescador, "prs_programa", null);
        $this->view->assign("assign_vPescadorProgramaSocial", $vPescadorHasProgramaSocial);

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

        $VPescadorHasTipoCapturada = new Application_Model_VPescadorHasTipoCapturada();
        $vPescadorHasTipoCapturada = $VPescadorHasTipoCapturada->select("tp_id=" . $idPescador, "itc_tipo", null);
        $this->view->assign("assign_vPescadorTipoCapturada", $vPescadorHasTipoCapturada);

        $model_VPescadorHasEmbarcacao = new Application_Model_VPescadorHasEmbarcacao();
        $vPescadorHasEmbarcacao = $model_VPescadorHasEmbarcacao->select("tp_id=" . $idPescador, "tte_tipoembarcacao", null);
        $this->view->assign("assign_vPescadorEmbarcacao", $vPescadorHasEmbarcacao);

        $model_VPescadorHasPorto = new Application_Model_VPescadorHasPorto();
        $vPescadorHasPorto = $model_VPescadorHasPorto->select("tp_id=" . $idPescador, "pto_nome", null);
        $this->view->assign("assign_vPescadorPorto", $vPescadorHasPorto);
    }

    public function atualizarsemreloadAction() {
        $this->modelPescador->update($this->_getAllParams());

//        $this->_redirect('pescador/index');
    }

    public function atualizarAction() {
        $this->modelPescador->update($this->_getAllParams());

        $this->_redirect('pescador/index');
    }

    public function excluirAction() {
        if($this->usuario['tp_id']==15 | $this->usuario['tp_id'] ==17 | $this->usuario['tp_id']==21){
            $this->_redirect('index');
        }
        else{
        $this->modelPescador->delete($this->_getParam('id'));

        $this->_redirect('pescador/index');
        }
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function filteridAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $tp_id = $this->_getParam("id");

        $dados = $this->modelPescador->select("tp_id>=". $tp_id, array('tp_nome', 'tp_id'), null);

        $this->view->assign("dados", $dados);

        $this->_redirect('pescador/index');
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function atualizarpescadorenderecoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $backUrl = $this->_getParam("back_url");

        $setupDados = array(
            "idEndereco" => $this->_getParam("te_id"),
            'logradouro' => $this->_getParam("te_logradouro"),
            'numero' => $this->_getParam("te_numero"),
            'bairro' => $this->_getParam("te_bairro"),
            'cep' => $this->_getParam("te_cep"),
            'complemento' => $this->_getParam("te_comp"),
            'municipio' => $this->_getParam("tmun_id"),
            'idPescador' => $this->_getParam("tp_id"),
            'nome' => $this->_getParam("tp_nome"),
            'sexo' => $this->_getParam("tp_sexo"),
            'rg' => $this->_getParam("tp_rg"),
            'cpf' => $this->_getParam("tp_cpf"),
            'apelido' => $this->_getParam("tp_apelido"),
            'matricula' => $this->_getParam("tp_matricula"),
            'filiacaoPai' => $this->_getParam("tp_filiacaopai"),
            'filiacaoMae' => $this->_getParam("tp_filiacaomae"),
            'ctps' => $this->_getParam("tp_ctps"),
            'pis' => $this->_getParam("tp_pis"),
            'inss' => $this->_getParam("tp_inss"),
            'nit_cei' => $this->_getParam("tp_nit_cei"),
            'cma' => $this->_getParam("tp_cma"),
            'rgb_maa_ibama' => $this->_getParam("tp_rgb_maa_ibama"),
            'cir_cap_porto' => $this->_getParam("tp_cir_cap_porto"),
            'dataNasc' => $this->_getParam("tp_datanasc"),
            'municipioNat' => $this->_getParam("tmun_id_natural"),
            'selectEscolaridade' => $this->_getParam("esc_id"),
            'respLancamento'  => $this->_getParam("tp_resp_lan"),
            'respCadastro'  => $this->_getParam("tp_resp_cad"),
            'obs' => $this->_getParam("tp_obs")
        );

        $idPescador = $this->_getParam("tp_id");

        $this->modelPescador->update($setupDados);

        $this->_redirect("/pescador/editar/id/" . $idPescador);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorenderecoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $backUrl = $this->_getParam("back_url");

        $setupDados = array(
            'logradouro' => $this->_getParam("te_logradouro"),
            'numero' => $this->_getParam("te_numero"),
            'bairro' => $this->_getParam("te_bairro"),
            'cep' => $this->_getParam("te_cep"),
            'complemento' => $this->_getParam("te_comp"),
            'municipio' => $this->_getParam("tmun_id"),
            'nome' => $this->_getParam("tp_nome"),
            'sexo' => $this->_getParam("tp_sexo"),
            'rg' => $this->_getParam("tp_rg"),
            'cpf' => $this->_getParam("tp_cpf"),
            'apelido' => $this->_getParam("tp_apelido"),
            'matricula' => $this->_getParam("tp_matricula"),
            'filiacaoPai' => $this->_getParam("tp_filiacaopai"),
            'filiacaoMae' => $this->_getParam("tp_filiacaomae"),
            'ctps' => $this->_getParam("tp_ctps"),
            'pis' => $this->_getParam("tp_pis"),
            'inss' => $this->_getParam("tp_inss"),
            'nit_cei' => $this->_getParam("tp_nit_cei"),
            'cma' => $this->_getParam("tp_cma"),
            'rgb_maa_ibama' => $this->_getParam("tp_rgb_maa_ibama"),
            'cir_cap_porto' => $this->_getParam("tp_cir_cap_porto"),
            'dataNasc' => $this->_getParam("tp_datanasc"),
            'municipioNat' => $this->_getParam("tmun_id_natural"),
            'selectEscolaridade' => $this->_getParam("esc_id"),
            'respLancamento'  => $this->_getParam("tp_resp_lan"),
            'respCadastro'  => $this->_getParam("tp_resp_cad"),
            'obs' => $this->_getParam("tp_obs")
        );

        $idPescador = $this->modelPescador->insert($setupDados);

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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_ProgramaSocial /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhascomunidadeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idComunidade = $this->_getParam("idComunidade");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasComunidade($idPescador, $idComunidade );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhascomunidadeAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idComunidade = $this->_getParam("idComunidade");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasComunidade($idPescador, $idComunidade );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Porto /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhasportoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idPorto = $this->_getParam("idPorto");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasPorto($idPescador, $idPorto );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhasportoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idPorto = $this->_getParam("idPorto");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasPorto($idPescador, $idPorto );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_ProgramaSocial /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhasprogramasocialAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idProgramaSocial = $this->_getParam("idProgramaSocial");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasProgramaSocial($idPescador, $idProgramaSocial );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhasprogramasocialAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idProgramaSocial = $this->_getParam("idProgramaSocial");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasProgramaSocial($idPescador, $idProgramaSocial );

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

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasArteTipo( $idPescador, $idArte );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhasartetipoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idArte = $this->_getParam("idArte");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasArteTipo( $idPescador, $idArte );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }


     ///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_TipoCapturada /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhastipoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipo = $this->_getParam("idTipo");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasTipo( $idPescador, $idTipo );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }

    public function deletepescadorhastipoAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idTipo = $this->_getParam("idTipo");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelDeletePescadorHasTipo( $idPescador, $idTipo );

        $this->redirect("/pescador/editar/id/" . $backUrl);

        return;
    }
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insertpescadorhasembarcacoesAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $idPescador = $this->_getParam("id");

        $idDono = $this->_getParam("idDono");

        $idEmbarcacao = $this->_getParam("idEmbarcacao");

        $idPorte = $this->_getParam("idPorte");

        $isMotor = $this->_getParam("isMotor");

        $backUrl = $this->_getParam("back_url");

        $this->modelPescador->modelInsertPescadorHasEmbarcacoes($idPescador, $idEmbarcacao, $idPorte, $isMotor, $idDono);

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

    public function relxlspescadorAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $localModelPescador = new Application_Model_Pescador();

        $localPescador = $localModelPescador->select(NULL, array('tp_nome', 'tp_id'), NULL);

        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();

        $objPHPExcel->setActiveSheetIndex(0);
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0 , 1, 'Pescador' );
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0 , 3, 'Código' );
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1 , 3, 'Nome' );

        $linha = 4;
        foreach ( $localPescador as $key => $pescador):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0 , $linha, $pescador['tp_id'] );
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1 , $linha, $pescador['tp_nome'] );
            $linha++;
        endforeach;

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="teste.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }

	public function relpdfpescadorAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelPescador = new Application_Model_Pescador();
		$localPescador = $localModelPescador->selectView(NULL, array('tcom_nome','tp_nome','tp_id'), NULL);

		$localModelTelefone = new Application_Model_VPescadorHasTelefone();
		$localModelDependente = new Application_Model_VPescadorHasDependente();
		$localModelRenda = new Application_Model_VPescadorHasRenda();
		$localModelProgramaSocial = new Application_Model_VPescadorHasProgramaSocial();
		$localModelAreaPesca = new Application_Model_VPescadorHasAreaPesca();
		$localModelArtePesca = new Application_Model_VPescadorHasArteTipoArea();
		$localModelTipoCapturada = new Application_Model_VPescadorHasTipoCapturada();
		$localModelEmbarcacoes = new Application_Model_VPescadorHasEmbarcacao();

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório de Pescador');

		$modeloRelatorio->setLegendaOff();

		foreach ($localPescador as $key => $pescador):
			$modeloRelatorio->setLegValue(30, 'Código: ', $pescador['tp_id']);
			$modeloRelatorio->setLegValue(100,  'Nome: ', $pescador['tp_nome']);
			$modeloRelatorio->setLegValue(530,  'Sexo: ', $pescador['tp_sexo']);

			$modeloRelatorio->setNewLine();
			if ($pescador['tp_datanasc']) {
			$localDate = date("d/m/Y", strtotime($pescador['tp_datanasc']));
			} else {
				$localDate='';
			}

			$modeloRelatorio->setLegValue(30,  'Data Nascimento: ', $localDate );
			$modeloRelatorio->setLegValue(230,  'Matricula: ', $pescador['tp_matricula']);
			$modeloRelatorio->setLegValue(350,  'Apelido: ', $pescador['tp_apelido']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'CPF: ', $pescador['tp_cpf']);
			$modeloRelatorio->setLegValue(130,  'RG: ', $pescador['tp_rg']);
			$modeloRelatorio->setLegValue(230,  'INSS: ', $pescador['tp_inss']);
			$modeloRelatorio->setLegValue(350,  'RGB/MAA/IBAMA: ', $pescador['tp_rgb_maa_ibama']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'PIS: ', $pescador['tp_pis']);
			$modeloRelatorio->setLegValue(130,  'CTPS: ', $pescador['tp_ctps']);
			$modeloRelatorio->setLegValue(230,  'NIT/CEI: ', $pescador['tp_nit_cei']);
			$modeloRelatorio->setLegValue(350,  'CIR CAP PORTO : ', $pescador['tp_cir_cap_porto ']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'CMA: ', $pescador['tp_cma']);
			$modeloRelatorio->setLegValue(130,  'Pai: ', $pescador['tp_filiacaopai']);
			$modeloRelatorio->setLegValue(350,  'Mãe: ', $pescador['tp_filiacaomae']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'Comunidade: ', $pescador['tcom_nome']);
			$modeloRelatorio->setLegValue(230,  'Natural: ', $pescador['munnat'] . '/' . $pescador['signat']);
			$modeloRelatorio->setLegValue(350,  'Escolaridade: ', $pescador['esc_nivel']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'Logradouro: ', $pescador['te_logradouro']);
			$modeloRelatorio->setLegValue(230,  'Número: ', $pescador['te_numero']);
			$modeloRelatorio->setLegValue(350,  'Complemento: ', $pescador['te_comp']);

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setLegValue(30,  'Bairro: ', $pescador['te_bairro']);
			$modeloRelatorio->setLegValue(230,  'CEP: ', $pescador['te_cep']);
			$modeloRelatorio->setLegValue(350,  'Cidade: ', $pescador['tmun_municipio'] . '/' . $pescador['tuf_sigla']);

			$modeloRelatorio->setNewLine();
			if ($pescador['tp_dta_cad']) {
			$localDate = date("d/m/Y", strtotime($pescador['tp_dta_cad']));
			} else {
				$localDate='';
			}
			$modeloRelatorio->setLegValue(30,  'Data Cadastro: ', $pescador['tp_dta_cad']);
			$modeloRelatorio->setLegValue(130,  'Resp. Lançamento: ', $pescador['tu_nome_lan ']);
			$modeloRelatorio->setLegValue(350,  'Resp. Cadastro: ', $pescador[' tu_nome_cad ']);
			$modeloRelatorio->setNewLine();

			$modeloRelatorio->setLegValue(30,  'Observações: ', $pescador['tp_obs']);
			$modeloRelatorio->setNewLine();

			$localDependente = $localModelDependente->selectDependentes('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localDependente as $key_d => $dependente) {
				$modeloRelatorio->setLegValue(30, 'Dependente: ', $dependente['ttd_tipodependente'] .": " .$dependente['tptd_quantidade']);
				$modeloRelatorio->setNewLine();
			}

			$localRenda = $localModelRenda->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localRenda as $key_r => $renda) {
				$modeloRelatorio->setLegValue(30, 'Renda: ', $renda['ttr_descricao'] .": " .$renda['ren_renda']);
				$modeloRelatorio->setNewLine();
			}

			$localProgramaSocial = $localModelProgramaSocial->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localProgramaSocial as $key_ps => $programaSocial) {
				$modeloRelatorio->setLegValue(30, 'Renda: ', $programaSocial['ttr_descricao'] .": " .$programaSocial['ren_renda']);
				$modeloRelatorio->setNewLine();
			}

			$localTelefone = $localModelTelefone->select('tpt_tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localTelefone as $key_t => $telefone) {
				$modeloRelatorio->setLegValue(30, 'Telefone: ', $telefone['ttel_desc'].": " .$telefone['tpt_telefone']);
				$modeloRelatorio->setNewLine();
			}

			$localAreaPesca = $localModelAreaPesca->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localAreaPesca as $key_area => $areaPesca) {
				$modeloRelatorio->setLegValue(30, 'Area de Pesca: ', $areaPesca['tareap_areapesca']);
				$modeloRelatorio->setNewLine();
			}

			$localArtePesca = $localModelArtePesca->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localArtePesca as $key_arte => $artePesca) {
				$modeloRelatorio->setLegValue(30, 'Arte de Pesca: ', $artePesca['tap_artepesca']);
				$modeloRelatorio->setNewLine();
			}

			$localTipoCapturada = $localModelTipoCapturada->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localTipoCapturada as $key_tc => $tipoCapturada) {
				$modeloRelatorio->setLegValue(30, 'Espécies Capturadas: ', $tipoCapturada['itc_tipo']);
				$modeloRelatorio->setNewLine();
			}

			$localEmbarcacoes = $localModelEmbarcacoes->select('tp_id='.$pescador['tp_id'], null, NULL);
			foreach ($localEmbarcacoes as $key_emb => $embarcacoes) {
				$modeloRelatorio->setLegValue(30, 'Embarcações: ', $embarcacoes['tte_tipoembarcacao']);
				if ($embarcacoes['tpte_motor'] == true)
					$motor = 'Sim';
				else $motor = 'Não';
				$modeloRelatorio->setLegValue(130, 'Motor: ', $motor );
				$modeloRelatorio->setLegValue(230, 'Porte: ', $embarcacoes['tpe_porte']);
				if ($embarcacoes['tpte_dono'] == 1)
					$dono = 'Sim';
				else $dono = 'Não';
				$modeloRelatorio->setLegValue(330, 'Proprietário: ', $dono);
				$modeloRelatorio->setNewLine();
			}

			$modeloRelatorio->setNewLine();
			$modeloRelatorio->setNewLine();

		endforeach;

		$pdf = $modeloRelatorio->getRelatorio();

        header('Content-Disposition: attachment;filename="rel_pescador.pdf"');
		header("Content-type: application/x-pdf");
		echo $pdf->render();

// 		header("Content-Type: application/pdf");
// 		echo $pdf->render();
	}

	public function relatoriopescadorcoloniaAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelPescador = new Application_Model_Pescador();
		$localPescador = $localModelPescador->selectView(NULL, array('tc_nome', 'tp_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório de Pescador - Colônia');
		$modeloRelatorio->setLegenda(30, 'Código');
		$modeloRelatorio->setLegenda(80, 'Colonia');
		$modeloRelatorio->setLegenda(200, 'Pescador');

		foreach ($localPescador as $key => $localData) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['tp_id']);
			$modeloRelatorio->setValue(80, $localData['tc_nome']);
			$modeloRelatorio->setValue(200, $localData['tp_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		header("Content-Type: application/pdf");
		echo $pdf->render();
    }

	public function relatoriopescadorcomunidadeAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$localModelPescador = new Application_Model_Pescador();
		$localPescador = $localModelPescador->selectView(NULL, array('tcom_nome', 'tp_nome'), NULL);

		require_once "../library/ModeloRelatorio.php";
		$modeloRelatorio = new ModeloRelatorio();
		$modeloRelatorio->setTitulo('Relatório de Pescador - Comunidade');
		$modeloRelatorio->setLegenda(30, 'Código');
		$modeloRelatorio->setLegenda(80, 'Comunidade');
		$modeloRelatorio->setLegenda(200, 'Pescador');

		foreach ($localPescador as $key => $localData) {
			$modeloRelatorio->setValueAlinhadoDireita(30, 40, $localData['tp_id']);
			$modeloRelatorio->setValue(80, $localData['tcom_nome']);
			$modeloRelatorio->setValue(200, $localData['tp_nome']);
			$modeloRelatorio->setNewLine();
		}
		$modeloRelatorio->setNewLine();
		$pdf = $modeloRelatorio->getRelatorio();

		header("Content-Type: application/pdf");
		echo $pdf->render();
    }

}

