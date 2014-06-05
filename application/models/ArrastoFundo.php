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
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $this->dbTableEstagiario = new Application_Model_Usuario();
        $this->dbTableMonitor = new Application_Model_Usuario();
        
        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        
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
        
        $dadosArrastoFundo = array(
            'af_embarcado' => $request['embarcada'],
            'af_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'af_quantpescadores' => $request['numPescadores'],
            'af_dhvolta' => $timestampVolta,
            'af_dhsaida' => $timestampSaida, 
            'af_diesel' => $request['diesel'],
            'af_oleo' => $request['oleo'],
            'af_alimento' => $request['alimento'],
            'af_gelo' => $request['gelo'],
            'af_avistou' => $request['avistamento'],
            'af_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'af_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
        
        $insertEntrevista = $this->dbTableArrastoFundo->insert($dadosArrastoFundo);
        return $insertEntrevista;
    }
    
    public function update(array $request)
    {
        $this->dbTableArrastoFundo = new Application_Model_DbTable_ArrastoFundo();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosArrastoFundo = array(
            'af_embarcado' => $request['embarcada'],
            'af_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'af_quantpescadores' => $request['numPescadores'],
            'af_dhvolta' => $timestampVolta,
            'af_dhsaida' => $timestampSaida, 
            'af_diesel' => $request['diesel'],
            'af_oleo' => $request['oleo'],
            'af_alimento' => $request['alimento'],
            'af_gelo' => $request['gelo'],
            'af_avistou' => $request['avistamento'],
            'af_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'af_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
 
        
        $whereArrastoFundo= $this->dbTableArrastoFundo->getAdapter()
                ->quoteInto('"af_id" = ?', $request[0]);
        
        
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
}

