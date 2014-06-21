<?php

class Application_Model_Calao
{
    private $dbTableCalao;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        $arr = $this->dbTableCalao->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        
        if($request['subamostra']==true){
        $dadosSubamostra = array(
            'sa_pescador' => $request['pescadorEntrevistado'],
            'sa_datachegada' => $request['data']
        );
        
       $idSubamostra =  $this->dbTableSubamostra->insert($dadosSubamostra);
        }
        else {
            $idSubamostra = null;
        }
        
        $tamanho = $request['tamanho'];
        $altura = $request['altura'];
        $numLances = $request['numLances'];
        $malha = $request['malha'];
       
        
        if(empty($tamanho)){
            $tamanho = NULL;
        }
        if(empty($altura)){
            $altura = NULL;
        }
        
        if(empty($numLances)){
            $numLances = NULL;
        }
        
        if(empty($malha)){
            $malha = NULL;
        }
        
        $dadosCalao = array(
            'cal_embarcada' => $request['embarcada'],
            'cal_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['PescadorEntrevistado'],
            'cal_quantpescadores' => $request['NumPescadores'],
            'cal_data' => $request['data'],
            'cal_tempogasto' => $request['tempoGasto'], 
            'cal_tamanho' => $tamanho,
            'cal_altura' => $altura,
            'cal_malha' => $malha,
            'cal_numlances' => $numLances,
            'cal_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'cal_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
        
        $insertEntrevista = $this->dbTableCalao->insert($dadosCalao);
        return $insertEntrevista;
    }
    
    public function update(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        
        if($request['subamostra']==true){
        $dadosSubamostra = array(
            'sa_pescador' => $request['pescadorEntrevistado'],
            'sa_datachegada' => $request['data']
        );
        
       $idSubamostra =  $this->dbTableSubamostra->insert($dadosSubamostra);
        }
        else {
            $idSubamostra = null;
        }
        
        $tamanho = $request['tamanho'];
        $altura = $request['altura'];
        $numLances = $request['numLances'];
        $malha = $request['malha'];
       
        
        if(empty($tamanho)){
            $tamanho = NULL;
        }
        if(empty($altura)){
            $altura = NULL;
        }
        
        if(empty($numLances)){
            $numLances = NULL;
        }
        
        if(empty($malha)){
            $malha = NULL;
        }
        
        $dadosCalao = array(
            'cal_embarcada' => $request['embarcada'],
            'cal_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['PescadorEntrevistado'],
            'cal_quantpescadores' => $request['NumPescadores'],
            'cal_data' => $request['data'],
            'cal_tempogasto' => $request['tempoGasto'], 
            'cal_tamanho' => $tamanho,
            'cal_altura' => $altura,
            'cal_malha' => $malha,
            'cal_numlances' => $numLances,
            'cal_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'cal_obs' => $request['observacao']
        );
 
        
        $whereCalao= $this->dbTableCalao->getAdapter()
                ->quoteInto('"cal_id" = ?', $request['id_entrevista']);
        
        
        $this->dbTableCalao->update($dadosCalao, $whereCalao);
    }
    
    public function delete($idCalao)
    {
        $this->dbTableCalao = new Application_Model_DbTable_Calao();       
                
        $whereCalao= $this->dbTableCalao->getAdapter()
                ->quoteInto('"cal_id" = ?', $idCalao);
        
        $this->dbTableCalao->delete($whereCalao);
    }
    public function selectId(){
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao, 'cal_id')->order('cal_id DESC')->limit('1');
        
        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    public function selectCalaoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableCalao = new Application_Model_DbTable_VCalaoHasPesqueiro();
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    public function selectCalaoHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableCalaoHasEspCapturada = new Application_Model_DbTable_VCalaoHasEspecieCapturada();
        
        $select = $this->dbTableCalaoHasEspCapturada->select()
                ->from($this->dbTableCalaoHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableCalaoHasEspCapturada->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro)
    {
        $this->dbTableTCalao = new Application_Model_DbTable_CalaoHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'cal_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
        );
        
        $this->dbTableTCalao->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTCalao = new Application_Model_DbTable_CalaoHasPesqueiro();       
                
        $whereCalaoHasPesqueiro = $this->dbTableTCalao->getAdapter()
                ->quoteInto('"cal_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTCalao->delete($whereCalaoHasPesqueiro);
        
    }
    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTCalaoHasEspCapturada = new Application_Model_DbTable_CalaoHasEspecieCapturada();
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
            'cal_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTCalaoHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTCalaoHasEspCapturada = new Application_Model_DbTable_CalaoHasEspecieCapturada();       
                
        $whereCalaoHasEspCapturada = $this->dbTableTCalaoHasEspCapturada->getAdapter()
                ->quoteInto('"spc_cal_id" = ?', $idEspecie);
        
        $this->dbTableTCalaoHasEspCapturada->delete($whereCalaoHasEspCapturada);
    }
    public function selectEntrevistaCalao($where = null, $order = null, $limit = null)
    {
        $this->dbTableCalao = new Application_Model_DbTable_VEntrevistaCalao();
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    public function selectCalaoHasAvistamento($where = null, $order = null, $limit = null)
    {
        $this->dbTableCalaoAvistamento = new Application_Model_DbTable_VCalaoHasAvistamento();
        $selectAvist = $this->dbTableCalaoAvistamento->select()
                ->from($this->dbTableCalaoAvistamento)->order($order)->limit($limit);

        if(!is_null($where)){
            $selectAvist->where($where);
        }

        return $this->dbTableCalaoAvistamento->fetchAll($selectAvist)->toArray();
    }
    public function insertAvistamento($idEntrevista,$idAvistamento)
    {
        $this->dbTableTCalaoHasAvistamento = new Application_Model_DbTable_CalaoHasAvistamento();
        
        
        $dadosAvistamento = array(
            'cal_id' => $idEntrevista,
            'avs_id' => $idAvistamento
        );
        
        $this->dbTableTCalaoHasAvistamento->insert($dadosAvistamento);
        return;
    }
    public function deleteAvistamento($idAvistamento, $idEntrevista){
        $this->dbTableTCalaoHasAvistamento = new Application_Model_DbTable_CalaoHasAvistamento();       
                
        $dadosCalaoHasAvistamento = array(
            'cal_id = ?' => $idAvistamento,
            'avs_id= ?' => $idEntrevista
        );
        
        $this->dbTableTCalaoHasAvistamento->delete($dadosCalaoHasAvistamento);
    }
}

