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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ SELECT /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function select($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_Pescador();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

      public function select_id( $id ) {
        $dao = new Application_Model_DbTable_Pescador();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);
        
        $where = 'tp_id >= ' . $id;

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }  
    
///_/_/_/_/_/_/_/_/_/_/_/_/_/ FIND - UTILIZA VIEW /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function find($id) {
        $dao = new Application_Model_DbTable_VPescador();
        $arr = $dao->find($id)->toArray();

        return $arr[0];
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ INSERT /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function insert(array $request) {

        $dataCEP = explode("-", $request['cep']);
        $dataCEP = $dataCEP[0] . $dataCEP[1];

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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ UPDATE /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function update(array $request) {

        $dataCEP = explode("-", $request['cep']);
        $dataCEP = $dataCEP[0] . $dataCEP[1];
        
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
        $whereEndereco = "te_id = " . $request['idEndereco'];

        $dbTableEndereco->update($dadosEndereco, $whereEndereco);

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
            'tp_datanasc' => date("Y-m-d", strtotime($request['dataNasc'])),
            'tmun_id_natural' => $request['municipioNat'],
            'esc_id' => $request['selectEscolaridade']
        );
        $whereEndereco = "tp_id = " . $request['idPescador'];

        $dbTablePescador->update($dadosPescador, $whereEndereco);
        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasEndereco(
    $te_logradouro, $te_numero, $te_bairro, $te_cep, $te_comp, $tmun_id
    ) {

        $dataCEP = explode("-", $te_cep);
        $dataCEP = $dataCEP[0] . $dataCEP[1];
        
        if (!$dataCEP)
            $dataCEP = NULL;
        
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dadosEndereco = array(
            'te_logradouro' => $te_logradouro,
            'te_numero' => $te_numero,
            'te_bairro' => $te_bairro,
            'te_cep' => $dataCEP,
            'te_comp' => $te_comp,
            'tmun_id' => $tmun_id
        );

        $idEndereco = $dbTableEndereco->insert($dadosEndereco);

        return $idEndereco;
    }
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Atualiza Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelUpdatePescadorHasEndereco(
    $te_id, $te_logradouro, $te_numero, $te_bairro, $te_cep, $te_comp, $tmun_id
    ) {

        $dataCEP = explode("-", $te_cep);
        $dataCEP = $dataCEP[0] . $dataCEP[1];

        if (!$dataCEP)
            $dataCEP = NULL;
        
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dadosEndereco = array(
            'te_logradouro' => $te_logradouro,
            'te_numero' => $te_numero,
            'te_bairro' => $te_bairro,
            'te_cep' => $dataCEP,
            'te_comp' => $te_comp,
            'tmun_id' => $tmun_id
        );

        $where = "te_id = " . $te_id;

        $idEndereco = $dbTableEndereco->update($dadosEndereco, $where);

        return $idEndereco;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescador(
    $tp_nome, $tp_sexo, $tp_rg, $tp_cpf, $tp_apelido, $tp_matricula, $tp_filiacaopai, $tp_filiacaomae, $tp_ctps, $tp_pis, $tp_inss, $tp_nit_cei, $tp_cma, $tp_rgb_maa_ibama, $tp_cir_cap_porto, $tp_datanasc, $tmun_id_natural, $idEndereco, $esc_id) {

        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = array(
            'tp_nome' => $tp_nome,
            'tp_sexo' => $tp_sexo,
            'tp_rg' => $tp_rg,
            'tp_cpf' => $tp_cpf,
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
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Atualiza Endereco vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelUpdatePescador(
    $tp_id, $tp_nome, $tp_sexo, $tp_rg, $tp_cpf, $tp_apelido, $tp_matricula, $tp_filiacaopai, $tp_filiacaomae, $tp_ctps, $tp_pis, $tp_inss, $tp_nit_cei, $tp_cma, $tp_rgb_maa_ibama, $tp_cir_cap_porto, $tp_datanasc, $tmun_id_natural, $idEndereco, $esc_id) {

        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dadosPescador = array(
            'tp_nome' => $tp_nome,
            'tp_sexo' => $tp_sexo,
            'tp_rg' => $tp_rg,
            'tp_cpf' => $tp_cpf,
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
        
        $where = "tp_id = " . $tp_id;

        $idPescador = $dbTablePescador->update($dadosPescador, $where);

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
    public function modelDeletePescadorHasTelefone($idPescador, $idTelenone) {
        $dbTable_PescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

        $dadosPescadorHasTelefone = array(
            'tpt_tp_id = ?' => $idPescador,
            'tpt_ttel_id  = ?' => $idTelenone
        );
        $dbTable_PescadorHasTelefone->delete($dadosPescadorHasTelefone);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Colonia vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasColonia($idPescador, $idColonia, $dtaColonia) {
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

        if ($dtaColonia == 0) {
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
    public function modelDeletePescadorHasColonia($idPescador, $idColonia) {
        $dbTable_PescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();

        $dadosPescadorHasColonia = array(
            'tp_id = ?' => $idPescador,
            'tc_id  = ?' => $idColonia
        );
        $dbTable_PescadorHasColonia->delete($dadosPescadorHasColonia);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Area Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasArea($idPescador, $idArea) {
        $dbTable_PescadorHasArea = new Application_Model_DbTable_PescadorHasAreaPesca();

        $dadosPescadorHasArea = array(
            'tp_id' => $idPescador,
            'tareap_id' => $idArea
        );
        $dbTable_PescadorHasArea->insert($dadosPescadorHasArea);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Delete Area Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelDeletePescadorHasArea($idPescador, $idArea) {
        $dbTable_PescadorHasArea = new Application_Model_DbTable_PescadorHasAreaPesca();

        $dadosPescadorHasArea = array(
            'tp_id = ?' => $idPescador,
            'tareap_id  = ?' => $idArea
        );
        $dbTable_PescadorHasArea->delete($dadosPescadorHasArea);

        return;
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Insert Area/Tipo Pesca vindos do Cadastro de Pescador  /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function modelInsertPescadorHasArteTipo($idPescador, $idArte, $idTipo) {
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
    public function modelDeletePescadorHasArteTipo($idPescador, $idArte, $idTipo) {
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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ INSERT /_/_/_/_/_/_/_/_/_/_/_/_/_/
    public function delete($idPescador) {
        $dbTablePescador = new Application_Model_DbTable_Pescador();

        $dadosPescador = array(
            'tp_pescadordeletado' => TRUE
        );

        $wherePescador = $dbTablePescador->getAdapter()->quoteInto('"tp_id" = ?', $idPescador);

        $dbTablePescador->update($dadosPescador, $wherePescador);
    }

///_/_/_/_/_/_/_/_/_/_/_/_/_/ SELECT /_/_/_/_/_/_/_/_/_/_/_/_/_/    
    public function select_Pescador_By_Municipio($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_VPescadorByMunicipio();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

}
