<?php

class Application_Model_ArrastoFundo
{
    private $dbTableArrastoFundo;
    private $dbTableArrastoHasPesqueiro;
    private $dbTableArrastoHasEspCapturada;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();
        $select = $this->dbTableArrastoFundo->select()
                ->from($this->dbTableArrastoFundo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoFundo->fetchAll($select)->toArray();
    }

    public function find($id)
    {
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();
        $arr = $this->dbTableArrastoFundo->find($id)->toArray();
        return $arr[0];
    }

    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();

        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];

        if($timestampSaida > $timestampVolta){
            $timestampVolta = 'Erro';
        }

        if($request['subamostra']==true){
        $dadosSubamostra = array(
            'sa_pescador' => $request['pescadorEntrevistado'],
            'sa_datachegada' => $request['dataVolta']
        );

       $idSubamostra =  $this->dbTableSubamostra->insert($dadosSubamostra);
        }
        else {
            $idSubamostra = null;
        }
        $diesel = $request['diesel'];
        $oleo = $request['oleo'];
        $alimento = $request['alimento'];
        $gelo = $request['gelo'];

        if(empty($diesel)){
            $diesel = NULL;
        }
        if(empty($oleo)){
            $oleo = NULL;
        }
        if(empty($alimento)){
            $alimento = NULL;
        }
        if(empty($gelo)){
            $gelo = NULL;
        }

        $dadosArrastoFundo = array(
            'af_embarcado' => $request['embarcada'],
            'af_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'af_quantpescadores' => $request['numPescadores'],
            'af_dhvolta' => $timestampVolta,
            'af_dhsaida' => $timestampSaida,
            'af_diesel' => $diesel,
            'af_oleo' => $oleo,
            'af_alimento' => $alimento,
            'af_gelo' => $oleo,
            'af_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'af_obs' => $request['observacao'],
            'dp_id' => $request['destinoPescado'],
            'mnt_id' => $request['id_monitoramento']

        );

        $insertEntrevista = $this->dbTableArrastoFundo->insert($dadosArrastoFundo);
        return $insertEntrevista;
    }

    public function update(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();

        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];

        if($timestampSaida > $timestampVolta){
            $timestampVolta = 'Erro';
        }

        if($request['subamostra']==true){
        $dadosSubamostra = array(
            'sa_pescador' => $request['pescadorEntrevistado'],
            'sa_datachegada' => $request['dataVolta']
        );

        $idSubamostra =  $this->dbTableSubamostra->insert($dadosSubamostra);
        }
        else {
            $idSubamostra = null;
        }
        $diesel = $request['diesel'];
        $oleo = $request['oleo'];
        $alimento = $request['alimento'];
        $gelo = $request['gelo'];

        if(empty($diesel)){
            $diesel = NULL;
        }
        if(empty($oleo)){
            $oleo = NULL;
        }
        if(empty($alimento)){
            $alimento = NULL;
        }
        if(empty($gelo)){
            $gelo = NULL;
        }

        $dadosArrastoFundo = array(
            'af_embarcado' => $request['embarcada'],
            'af_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'af_quantpescadores' => $request['numPescadores'],
            'af_dhvolta' => $timestampVolta,
            'af_dhsaida' => $timestampSaida,
            'af_diesel' => $diesel,
            'af_oleo' => $oleo,
            'af_alimento' => $alimento,
            'af_gelo' => $oleo,
            'dp_id' => $request['destinoPescado'],
            'af_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'af_obs' => $request['observacao']
        );


        $whereArrastoFundo= $this->dbTableArrastoFundo->getAdapter()
                ->quoteInto('"af_id" = ?', $request['id_entrevista']);


        $this->dbTableArrastoFundo->update($dadosArrastoFundo, $whereArrastoFundo);

    }

    public function delete($idArrastoFundo)
    {
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();

        $whereArrastoFundo= $this->dbTableArrastoFundo->getAdapter()
                ->quoteInto('"af_id" = ?', $idArrastoFundo);

        $this->dbTableArrastoFundo->delete($whereArrastoFundo);
    }
    public function selectId(){
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();

        $select = $this->dbTableArrastoFundo->select()
                ->from($this->dbTableArrastoFundo, 'af_id')->order('af_id DESC')->limit('1');

        return $this->dbTableArrastoFundo->fetchAll($select)->toArray();
    }
    public function selectArrastoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableArrastoHasPesqueiro = new Application_Model_DbTable_VArrastoFundoHasPesqueiro();
        $select = $this->dbTableArrastoHasPesqueiro->select()
                ->from($this->dbTableArrastoHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempopesqueiro)
    {
        $this->dbTableTArrastoHasPesqueiro = new Application_Model_DbTable_ArrastoHasPesqueiro();


        $dadosPesqueiro = array(
            'af_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempopesqueiro' => $tempopesqueiro
        );

        $this->dbTableTArrastoHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTArrastoHasPesqueiro = new Application_Model_DbTable_ArrastoHasPesqueiro();

        $whereArrastoHasPesqueiro = $this->dbTableTArrastoHasPesqueiro->getAdapter()
                ->quoteInto('"af_paf_id" = ?', $idPesqueiro);

        $this->dbTableTArrastoHasPesqueiro->delete($whereArrastoHasPesqueiro);

    }
    public function selectArrastoHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableArrastoHasEspCapturada = new Application_Model_DbTable_VArrastoFundoHasEspecieCapturada();

        $select = $this->dbTableArrastoHasEspCapturada->select()
                ->from($this->dbTableArrastoHasEspCapturada)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoHasEspCapturada->fetchAll($select)->toArray();
    }
    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTArrastoHasEspCapturada = new Application_Model_DbTable_ArrastoHasEspecieCapturada();

        if(empty($quantidade) && empty($peso)){
            $quantidade = 'Erro';
        }
        if(empty($quantidade)){
            $quantidade = NULL;
        }
        if(empty($peso)){
            $peso = NULL;
        }
        if(empty($precokg)){
            $precokg = NULL;
        }
        $dadosEspecie = array(
            'af_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );

        $this->dbTableTArrastoHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTArrastoHasEspCapturada = new Application_Model_DbTable_ArrastoHasEspecieCapturada();

        $whereArrastoHasEspCapturada = $this->dbTableTArrastoHasEspCapturada->getAdapter()
                ->quoteInto('"spc_af_id" = ?', $idEspecie);

        $this->dbTableTArrastoHasEspCapturada->delete($whereArrastoHasEspCapturada);
    }

    public function selectEntrevistaArrasto($where = null, $order = null, $limit = null)
    {
        $this->dbTableArrastoFundo = new Application_Model_DbTable_VEntrevistaArrasto();
        $select = $this->dbTableArrastoFundo->select()
                ->from($this->dbTableArrastoFundo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoFundo->fetchAll($select)->toArray();
    }

    public function selectArrastoHasAvistamento($where = null, $order = null, $limit = null)
    {
        $this->dbTableArrastoFundoAvistamento = new Application_Model_DbTable_VArrastoFundoHasAvistamento();
        $selectAvist = $this->dbTableArrastoFundoAvistamento->select()
                ->from($this->dbTableArrastoFundoAvistamento)->order($order)->limit($limit);

        if(!is_null($where)){
            $selectAvist->where($where);
        }

        return $this->dbTableArrastoFundoAvistamento->fetchAll($selectAvist)->toArray();
    }
    public function insertAvistamento($idEntrevista,$idAvistamento)
    {
        $this->dbTableTArrastoHasAvistamento = new Application_Model_DbTable_ArrastoHasAvistamento();


        $dadosAvistamento = array(
            'af_id' => $idEntrevista,
            'avs_id' => $idAvistamento
        );

        $this->dbTableTArrastoHasAvistamento->insert($dadosAvistamento);
        return;
    }
    public function deleteAvistamento($idAvistamento, $idEntrevista){
        $this->dbTableTArrastoHasAvistamento = new Application_Model_DbTable_ArrastoHasAvistamento();

        $dadosArrastoHasAvistamento = array(
            'avs_id = ?' => $idAvistamento,
            'af_id= ?' => $idEntrevista
        );

        $this->dbTableTArrastoHasAvistamento->delete($dadosArrastoHasAvistamento);
    }

    public function select_ArrastoFundo_group_EspecieCapturada() {
        $db = new Application_Model_DbTable_VArrastoFundoHasEspecieCapturada();
        $select = $db->select()
                ->from('v_arrastofundo_has_t_especie_capturada', array('count(*)','esp_nome_comum',
                'max(spc_quantidade)"max_quant"', 'AVG(spc_quantidade)"avg_quant"', 'min(spc_quantidade)"min_quant"',
                'max(spc_peso_kg)"max_peso"', 'AVG(spc_peso_kg)"avg_peso"', 'min(spc_peso_kg)"min_peso"',
                'max(spc_preco)"max_preco"', 'AVG(spc_preco)"avg_preco"', 'min(spc_preco)"min_preco"' ))
                ->group(array('esp_nome_comum'))
                ->order('esp_nome_comum');

        return $db->fetchAll($select)->toArray();
    }

    public function select_ArrastoFundo_group_Pesqueiro() {
        $db = new Application_Model_DbTable_VArrastoFundoHasPesqueiro();
        $select = $db->select()
                ->from('v_arrasto_has_t_pesqueiro', array('count(*)','paf_pesqueiro',
                'max(t_tempopesqueiro)"max_tempo"', 'AVG(t_tempopesqueiro)"avg_tempo"', 'min(t_tempopesqueiro)"min_tempo"' ))
                ->group(array('paf_pesqueiro'))
                ->order('paf_pesqueiro');

        return $db->fetchAll($select)->toArray();
    }
}
