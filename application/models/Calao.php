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
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $this->dbTableEstagiario = new Application_Model_Usuario();
        $this->dbTableMonitor = new Application_Model_Usuario();
        
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
        $dadosCalao = array(
            'cal_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['PescadorEntrevistado'],
            'cal_quantpescadores' => $request['NumPescadores'],
            'cal_data' => $request['data'],
            'cal_tempogasto' => $request['tempoGasto'], 
            'cal_tamanho' => $request['tamanho'],
            'cal_altura' => $request['altura'],
            'cal_malha' => $request['malha'],
            'cal_numlances' => $request['numLances'],
            'cal_avistou' => $request['avistamento'],
            'cal_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'cal_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
        
        $this->dbTableCalao->insert($dadosCalao);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableCalao = new Application_Model_DbTable_Calao();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosCalao = array(
            'cal_embarcado' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'cal_quantpescadores' => $request['numPescadores'],
            'cal_dhvolta' => $timestampVolta,
            'cal_dhsaida' => $timestampSaida, 
            'cal_diesel' => $request['diesel'],
            'cal_oleo' => $request['oleo'],
            'cal_alimento' => $request['alimento'],
            'cal_gelo' => $request['gelo'],
            'cal_avistou' => $request['avistamento'],
            'cal_subamostra' => $request['subamostra'],
            'cal_obs' => $request['observacao'],
        );
 
        
        $whereCalao= $this->dbTableCalao->getAdapter()
                ->quoteInto('"cal_id" = ?', $request[0]);
        
        
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



}

