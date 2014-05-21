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

//          $dbTable_EspecieCapturada = new Application_Model_DbTable_EspecieCapturada();

//        $dadosPescadorHasEspecieCapturada = array(
//            't_tipocapturada_itc_id' => $request['tipocapturada'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasEspecieCapturada->insert($dadosPescadorHasEspecieCapturada);


//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Dependente /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTablePescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

        if (!empty($_POST['inputTelefone'])) {
            foreach ($_POST['inputTelefone'] as $cnt => $inputTelefone) {
                
                $tmpTel = $_POST['inputTelefone'][$cnt];
                $tmpTel2 = $tmpTel.trim("(-) ");

                $dadosPescadorHasTelefone = array(
                    'tpt_tp_id' => $idPescador,
                    'tpt_ttel_id' => $_POST['inputTipoID'][$cnt],
                    'tpt_telefone' => $tmpTel2
                );
                $dbTablePescadorHasTelefone->insert($dadosPescadorHasTelefone);
            }
        }

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

        if (!empty($_POST['inputColoniaID'])) {
            foreach ($_POST['inputColoniaID'] as $cnt => $localInputColonia) {

                $dataInscricao = $_POST['inputDataInscricaoColonia'][$cnt];
                if (!$dataInscricao) {
                    $dataInscricao = NULL;
                }

                $dadosPescadorHasColonia = array(
                    'tp_id' => $idPescador,
                    'tc_id' => $_POST['inputColoniaID'][$cnt],
                    'tptc_datainsccolonia' =>  $dataInscricao
                );
                $dbTable_PescadorHasColonia->insert($dadosPescadorHasColonia);
            }
        }

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Area /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasAreaPesca = new Application_Model_DbTable_PescadorHasAreaPesca();

	if(!empty($_POST['inputArteID'])) {
		foreach($_POST['inputAreaID'] as $cnt => $localInputArea) {

                    $dadosPescadorHasAreaPesca = array(
                        'tp_id' => $idPescador,
                        'tareap_id' => $_POST['inputAreaID'][$cnt],
                );
                $dbTable_PescadorHasAreaPesca->insert($dadosPescadorHasAreaPesca);

		}
	}

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Arte - Tipo /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTable_PescadorHasArtePesca = new Application_Model_DbTable_PescadorHasArtePesca();

	if(!empty($_POST['inputArteID'])) {
		foreach($_POST['inputArteID'] as $cnt => $localInputArte) {

                    $dadosPescadorHasArtePesca = array(
                        'tp_id' => $idPescador,
                        'tap_id' => $_POST['inputArteID'][$cnt],
//                        'tareap_id' => $_POST['inputAreaID'][$cnt],
                        'itc_id' => $_POST['inputTipoID'][$cnt]
                );
                $dbTable_PescadorHasArtePesca->insert($dadosPescadorHasArtePesca);

		}
	}
//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
        $dbTablePescadorHasEmbarcacao = new Application_Model_DbTable_PescadorHasEmbarcacao();

	if(!empty($_POST['inputPorteID'])) {
		foreach($_POST['inputBarcoID'] as $cnt => $localInputBarco) {

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


//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Dependente /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
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


//          /_/_/_/_/_/_/_/_/_/_/_/_/_/ Area - Arte - Tipo /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Dependentes vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
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
    
    public function modelDeletePescadorHasDependente($idPescador, $idTipoDependente) {
        $dbTable_PescadorHasDependente = new Application_Model_DbTable_PescadorHasDependente();

        $dadosPescadorHasDependente = array(
            'tp_id = ?' => $idPescador,
            'ttd_id = ?' => $idTipoDependente
        );
        $dbTable_PescadorHasDependente->delete($dadosPescadorHasDependente);

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
