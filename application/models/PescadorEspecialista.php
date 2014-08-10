<?php

class Application_Model_PescadorEspecialista
{

    ///_/_/_/_/_/_/_/_/_/_/_/_/_/ SELECT /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function select($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_PescadorEspecialista();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

//    public function selectView($where = null, $order = null, $limit = null) {
//        $dao = new Application_Model_DbTable_VPescadorEspecialista();
//        $select = $dao->select()->from($dao)->order($order)->limit($limit);
//
//        if (!is_null($where)) {
//            $select->where($where);
//        }
//
//        return $dao->fetchAll($select)->toArray();
//    }
    

///_/_/_/_/_/_/_/_/_/_/_/_/_/ FIND - UTILIZA VIEW /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function find($id) {
        $dao = new Application_Model_DbTable_VPescadorEspecialista();
        $arr = $dao->find($id)->toArray();

        return $arr[0];
    }


 ///_/_/_/_/_/_/_/_/_/_/_/_/_/ SETUP DADOS PESCADOR /_/_/_/_/_/_/_/_/_/_/_/_/_/
    private function setupDadosPescadorEspecialista( array $request ) {
        
        $tps_idade = $request['tps_idade'];
        $tps_dataNasc = $request['tps_dataNasc'];
        $tps_numFilhos = $request['tps_numFilhos'];
        $tps_tempoResidencia = $request['tps_tempoResidencia'];
        $tps_quantPessoas = $request['tps_quantPessoas'];
        $tps_tempoSemPesca=$request['tps_tempoSemPesca'];
        $tps_menorRenda = $request['tps_menorRenda'];
        $tps_maiorRenda = $request['tps_maiorRenda'];
        $tps_tempoPesca = $request['tps_tempoPesca'];
        $tps_valorRendaDefeso = $request['tps_valorRendaDefeso'];
        $tps_numPescadorFamilia = $request['tps_numPescadorFamilia'];
        $tps_diasPescando = $request['tps_diasPescando'];
        $tps_horasPescando = $request['tps_horasPescando'];
        $tps_tempoColonizado = $request['tps_tempoColonizado'];
        $tps_dependenciaPesca = $request['tps_dependenciaPesca'];
        $tps_data = $request['tps_data'];
        
        
        if(empty($tps_idade)){
            $tps_idade = NULL;
        }
        
        if(empty($tps_numFilhos)){
            $tps_numFilhos = NULL;
        }
        if(empty($tps_dataNasc)){
            $tps_dataNasc = NULL;
        }
        if(empty($tps_tempoResidencia)){
            $tps_tempoResidencia = NULL;
        }
        if(empty($tps_quantPessoas)){
            $tps_quantPessoas = NULL;
        }
        if(empty($tps_tempoSemPesca)){
            $tps_tempoSemPesca = NULL;
        }
        if(empty($tps_menorRenda)){
            $tps_menorRenda = NULL;
        }
        if(empty($tps_maiorRenda)){
            $tps_maiorRenda = NULL;
        }
        if(empty($tps_tempoPesca)){
            $tps_tempoPesca = NULL;
        }
        
        if(empty($tps_valorRendaDefeso)){
            $tps_valorRendaDefeso = NULL;
        }
        if(empty($tps_numPescadorFamilia)){
            $tps_numPescadorFamilia = NULL;
        }
        if(empty($tps_diasPescando)){
            $tps_diasPescando = NULL;
        }
        if(empty($tps_horasPescando)){
            $tps_horasPescando = NULL;
        }
        if(empty($tps_tempoColonizado)){
            $tps_tempoColonizado = NULL;
        }
        if(empty($tps_dependenciaPesca)){
            $tps_dependenciaPesca = NULL;
        }
        if(empty($tps_data)){
            $tps_data = NULL;
        }
        
        $dadosPescadorEspecialista = array(
            'tp_id' => $request['idPescadorSp'],
            'pto_id' => $request['selectPortoEspecialista'],
            'tps_data_nasc' => $tps_dataNasc,
            'tps_idade' => $tps_idade,
            'tec_id' => $request['selectEstadoCivil'],
            'tps_filhos' => $tps_numFilhos,
            'tps_tempo_residencia' => $tps_tempoResidencia,
            'to_id' => $request['selectOrigem'],
            'tre_id' => $request['selectResidencia'],
            'tps_pessoas_na_casa' => $tps_quantPessoas,
            'tps_tempo_sustento' => $tps_tempoSemPesca,
            'tps_renda_menor_ano' => $tps_menorRenda,
            'tea_id_menor' => $request['selectMenorEstacaoAno'],
            'tps_renda_maior_ano' => $tps_maiorRenda,
            'tea_id_maior' => $request['selectMaiorEstacaoAno'],
            'tps_renda_no_defeso' => $tps_valorRendaDefeso,
            'tps_tempo_de_pesca' => $tps_tempoPesca,
            'ttd_id_tutor_pesca' => $request['selectTutorPesca'],
            'ttr_id_antes_pesca' => $request['selectAntesPesca'],
            'tps_mora_onde_pesca' => $request['selectMoraOndePesca'],
            'tps_embarcado'  => $request['selectEmbarcado'],
            'tps_num_familiar_pescador'  => $tps_numPescadorFamilia,
            'tfp_id'  => $request['selectFrequenciaPesca'],
            'tps_num_dias_pescando' => $tps_diasPescando,
            'tps_hora_pescando' => $tps_horasPescando,
            'tup_id' => $request['selectUltimaPesca'],
            'tfi_id'  => $request['selectFornecedorInsumo'],
            'trec_id'  => $request['selectRecurso'],
            'dp_id_pescado' => $request['selectDestinoPescado'],
            'tfp_id_consumo' => $request['selectFrequenciaConsumo'],
            'dp_id_comprador' => $request['selectCompradorPescado'],
            'tsp_id'  => $request['selectSobraPesca'],
            'tlt_id'  => $request['selectLocalTratamento'],
            'tps_unidade_beneficiamento' => $request['tps_unidadeBeneficiamento'],
            'tps_curso_beneficiamento' => $request['tps_cursoBeneficiamento'],
            'tasp_id' => $request['selectAssociacaoPesca'],
            'tc_id'  => $request['selectColoniaEspecialista'],
            'tps_tempo_em_colonia' => $tps_tempoColonizado,
            'tps_motivo_falta_pagamento' => $request['tps_dificuldadeColonia'],
            'tps_beneficio_colonia' => $request['tps_beneficiosColonia'],
            'trgp_id'  => $request['selectOrgaoRgp'],
            'tdif_id_area' => $request['selectDificuldade'],
            'ttr_id_outra_habilidade'  => $request['selectOutraHabilidade'],
            'ttr_id_alternativa_renda'  => $request['selectAlternativaRenda'],
            'ttr_id_outra_profissao'  => $request['selectOutraProfissao'],
            'tps_filho_seguir_profissao' => $request['tps_filhoPescador'],
            'tps_grau_dependencia_pesca'  => $tps_dependenciaPesca,
            'tu_id_entrevistador'  => $request['selectEntrevistador'],
            'tps_data' => $tps_data
        );

        return $dadosPescadorEspecialista;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ INSERT /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insert(array $request) {
        
        
        $dbTablePescadorEspecialista = new Application_Model_DbTable_PescadorEspecialista();
        $dadosPescador = $this->setupDadosPescadorEspecialista( $request );
        $idPescadorEspecialista = $dbTablePescadorEspecialista->insert($dadosPescador);
        
        return $idPescadorEspecialista;
    }
    
    public function update(array $request) {

        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = $this->setupDadosPescador( $request );
        $dadosPescador['te_id'] = $request['idEndereco'];
        $wherePescador = "tp_id = " . $request['idPescador'];
        $idPescador = $dbTablePescador->update($dadosPescador, $wherePescador);

        return $idPescador;
    }
    
}

