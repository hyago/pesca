<?php

/**
 * Model Pescador
 *
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Pescador {

    public function select($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_Pescador();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

//     /_/_/_/_/_/_/_/_/_/_/_/_/_/ FIND - UTILIZA VIEW /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function find($id) {
        $dao = new Application_Model_DbTable_VPescador();
        $arr = $dao->find($id)->toArray();
        
        return $arr[0];
    }

//
//    Inserir
//
    public function insert(array $request) {

        $dataCEP = $request['cep'];
        $dataCEP = trim($dataCEP,"_-");

        if (!$dataCEP)
            $dataCEP = NULL;

        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dadosEndereco = array(
            'te_logradouro' => $request['logradouro'],
            'te_numero' => $request['numero'],
            'te_bairro' => $request['bairro'],
            'te_cep' => $dataCEP,
            'te_comp' => $request['complemento'],
            'tmun_id' => $request['municipio']
        );

        $idEndereco = $dbTableEndereco->insert($dadosEndereco);

        $dataNasc = $request['dataNasc'];
        if (!$dataNasc) {
            $dataNasc = NULL;
        }

        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = array(
            'tp_nome' => $request['nome'],
            'tp_sexo' => $request['sexo'],
            'tp_rg' => $request['rg'],
            'tp_cpf' => $request['cpf'],
            'tp_apelido' => $request['apelido'],
            'tp_matricula' => $request['matricula'],
            'tp_filiacaopai' => $request['filiacaoPai'],
            'tp_filiacaomae' => $request['filiacaoMae'],
            'tp_ctps' => $request['ctps'],
            'tp_pis' => $request['pis'],
            'tp_inss' => $request['inss'],
            'tp_nit_cei' => $request['nit_cei'],
            'tp_cma' => $request['cma'],
            'tp_rgb_maa_ibama' => $request['rgb_maa_ibama'],
            'tp_cir_cap_porto' => $request['cir_cap_porto'],
            'tp_datanasc' => $dataNasc,
            'tmun_id_natural' => $request['municipioNat'],
            'te_id' => $idEndereco,
            'esc_id' => $request['selectEscolaridade']
        );

        $idPescador = $dbTablePescador->insert($dadosPescador);
        return;
    }

    public function update(array $request) {
        $dataCEP = $request['cep'];
        $dataCEP = trim($dataCEP,"_-");

        if (!$dataCEP)
            $dataCEP = NULL;

        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dadosEndereco = array(
            'te_logradouro' => $request['logradouro'],
            'te_numero' => $request['numero'],
            'te_bairro' => $request['bairro'],
            'te_cep' => $dataCEP,
            'te_comp' => $request['complemento'],
            'tmun_id' => $request['municipio']
        );

        $idEndereco = $dbTableEndereco->insert($dadosEndereco);


        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = array(
            'tp_nome' => $request['nome'],
            'tp_sexo' => $request['sexo'],
            'tp_rg' => $request['rg'],
            'tp_cpf' => $request['cpf'],
            'tp_apelido' => $request['apelido'],
            'tp_matricula' => $request['matricula'],
            'tp_filiacaopai' => $request['filiacaoPai'],
            'tp_filiacaomae' => $request['filiacaoMae'],
            'tp_ctps' => $request['ctps'],
            'tp_pis' => $request['pis'],
            'tp_inss' => $request['inss'],
            'tp_nit_cei' => $request['nit_cei'],
            'tp_cma' => $request['cma'],
            'tp_rgb_maa_ibama' => $request['rgb_maa_ibama'],
            'tp_cir_cap_porto' => $request['cir_cap_porto'],
            'tp_datanasc' => $request['dataNasc'],
            'tmun_id_natural' => $request['municipioNat'],
            'te_id' => $idEndereco,
            'esc_id' => $request['selectEscolaridade']
        );

        $idPescador = $dbTablePescador->insert($dadosPescador);

//          $dbTable_EspecieCapturada = new Application_Model_DbTable_EspecieCapturada();

//        $dadosPescadorHasEspecieCapturada = array(
//            't_tipocapturada_itc_id' => $request['tipocapturada'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasEspecieCapturada->insert($dadosPescadorHasEspecieCapturada);


///_/_/_/_/_/_/_/_/_/_/_/_/_/ Dependente /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasDependente = new Application_Model_DbTable_PescadorHasDependente();

	if(!empty($_POST['inputTipoDependenteID'])) {
		foreach($_POST['inputTipoDependenteID'] as $cnt => $localInputTipoDependente) {

                    $dadosPescadorHasDependente = array(
                        'tp_id' => $idPescador,
                        'ttd_id' => $_POST['inputTipoDependenteID'][$cnt],
                        'tptd_quantidade' => $_POST['inputQuantidadeDependente'][$cnt]
                );
                $dbTable_PescadorHasDependente->insert($dadosPescadorHasDependente);

		}
	}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasRenda = new Application_Model_DbTable_PescadorHasRenda();

	if(!empty($_POST['inputRendaID'])) {
		foreach($_POST['inputRendaID'] as $cnt => $localInputPescadorHasRenda) {

                    $dadosPescadorHasRenda = array(
                        'tp_id' => $idPescador,
                        'ren_id' => $_POST['inputRendaID'][$cnt],
                        'ttr_id' => $_POST['inputTipoRendaID'][$cnt]
                );
                $dbTable_PescadorHasRenda->insert($dadosPescadorHasRenda);

		}
	}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTablePescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

	if(!empty($_POST['inputTelefone'])) {
		foreach($_POST['inputTelefone'] as $cnt => $inputTelefone) {

                    $dadosPescadorHasTelefone = array(
                    'tpt_tp_id' => $idPescador,
                    'tpt_ttel_id' => $_POST['inputTipoID'][$cnt],
                    'tpt_telefone' => $inputTelefone
                );
                $dbTablePescadorHasTelefone->insert($dadosPescadorHasTelefone);

		}
	}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

	if(!empty($_POST['inputColoniaID'])) {
		foreach($_POST['inputColoniaID'] as $cnt => $localInputColonia) {

                    $dadosPescadorHasColonia = array(
                        'tp_id' => $idPescador,
                        'tc_id' => $_POST['inputColoniaID'][$cnt],
                        'tptc_datainsccolonia' => $_POST['inputDataInscricaoColonia'][$cnt]
                );
                $dbTable_PescadorHasColonia->insert($dadosPescadorHasColonia);

		}
	}


///_/_/_/_/_/_/_/_/_/_/_/_/_/ Area - Arte - Tipo /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasArtePesca = new Application_Model_DbTable_PescadorHasArtePesca();

	if(!empty($_POST['inputArteID'])) {
		foreach($_POST['inputArteID'] as $cnt => $localInputArte) {

                    $dadosPescadorHasArtePesca = array(
                        'tp_id' => $idPescador,
                        'tap_id' => $_POST['inputArteID'][$cnt],
                        'tareap_id' => $_POST['inputAreaID'][$cnt],
                        'itc_id' => $_POST['inputTipoID'][$cnt]
                );
                $dbTable_PescadorHasArtePesca->insert($dadosPescadorHasArtePesca);

		}
	}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTablePescadorHasEmbarcacao = new Application_Model_DbTable_PescadorHasEmbarcacao();

	if(!empty($_POST['inputPorteID'])) {
		foreach($_POST['inputPorteID'] as $cnt => $localInputBarco) {

                    $dadosPescadorHasEmbarcacao = array(
                        'tp_id' => $idPescador,
                        'tte_id' => $_POST['inputBarcoID'][$cnt],
                        'tpte_motor' => $_POST['inputMotorID'][$cnt],
                        'tpe_id' => $_POST['inputPorteID'][$cnt]
                );
                $dbTablePescadorHasEmbarcacao->insert($dadosPescadorHasEmbarcacao);

		}
	}

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
public function modelInsertPescadorHasEndereco( 
        $te_logradouro,
                $te_numero,
                $te_bairro,
                $te_cep,
                $te_comp,                
                $tmun_id 
        ) {

    $dataCEP = $request['cep'];
    $dataCEP = trim($dataCEP, "_-");

    if (!$dataCEP) {
        $dataCEP = $localNull;
    }

    $dbTableEndereco = new Application_Model_DbTable_Endereco();
    $dadosEndereco = array(
        'te_logradouro' =>$te_logradouro,
        'te_numero' =>  $te_numero,
        'te_bairro' => $te_bairro,
        'te_cep' => $dataCEP,
        'te_comp' => $te_comp,
        'tmun_id' => $tmun_id
    );

    $idEndereco = $dbTableEndereco->insert($dadosEndereco);

    return $idEndereco;
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescador(
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
                $esc_id) {

        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = array(
            'tp_nome' => $tp_nome,
            'tp_sexo' => $tp_sexo,
            'tp_rg' => $tp_rg,
            'tp_cpf' =>$tp_cpf,
            'tp_apelido' => $tp_apelido,
            'tp_matricula' => $tp_matricula,
            'tp_filiacaopai' => $tp_filiacaopai,
            'tp_filiacaomae' => $tp_filiacaomae,
            'tp_ctps' => $tp_ctps,
            'tp_pis' => $tp_pis,
            'tp_inss' => $tp_inss,
            'tp_nit_cei' => $tp_nit_cei,
            'tp_cma' => $tp_cma,
            'tp_rgb_maa_ibama' => $tp_rgb_maa_ibama,
            'tp_cir_cap_porto' => $tp_cir_cap_porto,
            'tp_datanasc' => date("Y-m-d", strtotime($tp_datanasc)),
            'tmun_id_natural' => $tmun_id_natural,
            'te_id' => $idEndereco,
            'esc_id' => $esc_id
        );

        $idPescador = $dbTablePescador->insert($dadosPescador);

        return $idPescador;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Dependentes vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasDependente($idPescador, $idTipoDependente, $qtde) {
        $dbTable_PescadorHasDependente = new Application_Model_DbTable_PescadorHasDependente();

        $dadosPescadorHasDependente = array(
            'tp_id' => $idPescador,
            'ttd_id' => $idTipoDependente,
            'tptd_quantidade' => $qtde
        );
        $dbTable_PescadorHasDependente->insert($dadosPescadorHasDependente);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Dependentes vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasDependente($idPescador, $idTipoDependente) {
        $dbTable_PescadorHasDependente = new Application_Model_DbTable_PescadorHasDependente();

        $dadosPescadorHasDependente = array(
            'tp_id = ?' => $idPescador,
            'ttd_id = ?' => $idTipoDependente
        );
        $dbTable_PescadorHasDependente->delete($dadosPescadorHasDependente);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Rendas vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasRenda($idPescador, $idTipoRenda, $idRenda) {
        $dbTable_PescadorHasRenda = new Application_Model_DbTable_PescadorHasRenda();

        $dadosPescadorHasRenda = array(
            'tp_id' => $idPescador,
            'ttr_id' => $idTipoRenda,
            'ren_id' => $idRenda
        );
        $dbTable_PescadorHasRenda->insert($dadosPescadorHasRenda);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Rendas vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasRenda($idPescador, $idTipoRenda, $idRenda) {
        $dbTable_PescadorHasRenda = new Application_Model_DbTable_PescadorHasRenda();

        $dadosPescadorHasRenda = array(
            'tp_id = ?' => $idPescador,
            'ttr_id  = ?' => $idTipoRenda,
            'ren_id  = ?' => $idRenda
        );
        $dbTable_PescadorHasRenda->delete($dadosPescadorHasRenda);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Telefones vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasTelefone($idPescador, $idTelenone, $nTelefone) {
        $dbTable_PescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

        $dadosPescadorHasTelefone = array(
            'tpt_tp_id' => $idPescador,
            'tpt_ttel_id' => $idTelenone,
            'tpt_telefone' => $nTelefone
        );
        $dbTable_PescadorHasTelefone->insert($dadosPescadorHasTelefone);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Telefones vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasTelefone($idPescador, $idTelenone ) {
        $dbTable_PescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

        $dadosPescadorHasTelefone = array(
            'tpt_tp_id = ?' => $idPescador,
            'tpt_ttel_id  = ?' => $idTelenone
        );
        $dbTable_PescadorHasTelefone->delete($dadosPescadorHasTelefone);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Colonia vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasColonia( $idPescador, $idColonia, $dtaColonia ) {
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

        if ( $dtaColonia == 0 ) {
            $dtaColonia = new Zend_Db_Expr("NULL");
        }

        $dadosPescadorHasColonia = array(
            'tp_id' => $idPescador,
            'tc_id' => $idColonia,
            'tptc_datainsccolonia' => $dtaColonia
        );
        $dbTable_PescadorHasColonia->insert($dadosPescadorHasColonia);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Colonia vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasColonia( $idPescador, $idColonia ) {
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

        $dadosPescadorHasColonia = array(
            'tp_id = ?' => $idPescador,
            'tc_id  = ?' => $idColonia
        );
        $dbTable_PescadorHasColonia->delete($dadosPescadorHasColonia);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Area Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasArea( $idPescador, $idArea  ) {
        $dbTable_PescadorHasArea = new Application_Model_DbTable_PescadorHasAreaPesca();

       $dadosPescadorHasArea = array(
            'tp_id' => $idPescador,
            'tareap_id' => $idArea
        );
        $dbTable_PescadorHasArea->insert($dadosPescadorHasArea);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Area Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasArea( $idPescador, $idArea ) {
        $dbTable_PescadorHasArea = new Application_Model_DbTable_PescadorHasAreaPesca();

        $dadosPescadorHasArea = array(
            'tp_id = ?' => $idPescador,
            'tareap_id  = ?' => $idArea
        );
        $dbTable_PescadorHasArea->delete($dadosPescadorHasArea);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Area/Tipo Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasArteTipo( $idPescador, $idArte, $idTipo ) {
        $dbTable_PescadorHasArteTipo = new Application_Model_DbTable_PescadorHasArtePesca();

       $dadosPescadorHasArteTipo = array(
            'tp_id' => $idPescador,
            'tap_id' => $idArte,
           'itc_id' => $idTipo,
        );
        $dbTable_PescadorHasArteTipo->insert($dadosPescadorHasArteTipo);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Area/Tipo Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasArteTipo( $idPescador, $idArte, $idTipo ) {
        $dbTable_PescadorHasArteTipo = new Application_Model_DbTable_PescadorHasArtePesca();

        $dadosPescadorHasArteTipo = array(
            'tp_id = ?' => $idPescador,
            'tap_id  = ?' => $idArte,
            'itc_id  = ?' => $idTipo
        );
        $dbTable_PescadorHasArteTipo->delete($dadosPescadorHasArteTipo);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Embarcações vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasEmbarcacoes($idPescador, $idEmbarcacao, $idPorte, $isMotor) {
        $dbTable_PescadorHasEmbarcacoes = new Application_Model_DbTable_PescadorHasEmbarcacao();

        $dadosPescadorHasEmbarcacoes = array(
            'tp_id' => $idPescador,
            'tte_id' => $idEmbarcacao,
            'tpe_id' => $idPorte,
            'tpte_motor' => $isMotor
        );
        $dbTable_PescadorHasEmbarcacoes->insert($dadosPescadorHasEmbarcacoes);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Embarcações vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasEmbarcacoes($idPescador, $idEmbarcacao, $idPorte) {
        $dbTable_PescadorHasEmbarcacoes = new Application_Model_DbTable_PescadorHasEmbarcacao();

        $dadosPescadorHasEmbarcacoes = array(
            'tp_id = ?' => $idPescador,
            'tte_id  = ?' => $idEmbarcacao,
            'tpe_id  = ?' => $idPorte
        );
        $dbTable_PescadorHasEmbarcacoes->delete($dadosPescadorHasEmbarcacoes);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Fim - Delete Dependentes vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/

    public function delete($idPescador) {
        $dbTablePescador = new Application_Model_DbTable_Pescador();

        $dadosPescador = array(
            'tp_pescadordeletado' => TRUE
        );

        $wherePescador = $dbTablePescador->getAdapter()->quoteInto('"tp_id" = ?', $idPescador);

        $dbTablePescador->update($dadosPescador, $wherePescador);
    }

    public function select_Pescador_By_Municipio($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_VPescadorByMunicipio();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }
}
