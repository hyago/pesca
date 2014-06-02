<?php

class Application_Model_Siripoia
{    private $dbTableSiripoia;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();
        $select = $this->dbTableSiripoia->select()
                ->from($this->dbTableSiripoia)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableSiripoia->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();
        $arr = $this->dbTableSiripoia->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();
        
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
        
        
        $dadosSiripoia = array(
            'sir_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'sir_quantpescadores' => $request['numPescadores'],
            'sir_dhvolta' => $timestampVolta,
            'sir_dhsaida' => $timestampSaida, 
            'sir_tempogasto' => $request['tempoGasto'],
            'sir_avistamento' => $request['avistamento'],
            'sir_subamostra' => $request['subamostra'],
            'sir_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'sir_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'sir_mreviva' => $request['mareviva']
        );
        
        $this->dbTableSiripoia->insert($dadosSiripoia);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosSiripoia = array(
            'sir_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'sir_quantpescadores' => $request['numPescadores'],
            'sir_dhvolta' => $timestampVolta,
            'sir_dhsaida' => $timestampSaida, 
            'sir_tempogasto' => $request['tempoGasto'],
            'sir_avistamento' => $request['avistamento'],
            'sir_subamostra' => $request['subamostra'],
            'sir_obs' => $request['observacao'],
            'sa_id' => $request['subamostra'],
            'sir_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'sir_mreviva' => $request['mareviva']
        );
 
        
        $whereSiripoia= $this->dbTableSiripoia->getAdapter()
                ->quoteInto('"sir_id" = ?', $request[0]);
        
        
        $this->dbTableSiripoia->update($dadosSiripoia, $whereSiripoia);
    }
    
    public function delete($idSiripoia)
    {
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();       
                
        $whereSiripoia= $this->dbTableSiripoia->getAdapter()
                ->quoteInto('"sir_id" = ?', $idSiripoia);
        
        $this->dbTableSiripoia->delete($whereSiripoia);
    }
    public function selectId(){
        $this->dbTableSiripoia = new Application_Model_DbTable_Siripoia();
        
        $select = $this->dbTableSiripoia->select()
                ->from($this->dbTableSiripoia, 'sir_id')->order('sir_id DESC')->limit('1');
        
        return $this->dbTableSiripoia->fetchAll($select)->toArray();
    }
    public function selectSiripoiaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableSiripoiaHasPesqueiro = new Application_Model_DbTable_VSiripoiaHasPesqueiro();
        $select = $this->dbTableSiripoiaHasPesqueiro->select()
                ->from($this->dbTableSiripoiaHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableSiripoiaHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTSiripoiaHasPesqueiro = new Application_Model_DbTable_SiripoiaHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'sir_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTSiripoiaHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTSiripoiaHasPesqueiro = new Application_Model_DbTable_SiripoiaHasPesqueiro();       
                
        $whereSiripoiaHasPesqueiro = $this->dbTableTSiripoiaHasPesqueiro->getAdapter()
                ->quoteInto('"sir_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTSiripoiaHasPesqueiro->delete($whereSiripoiaHasPesqueiro);
        
    }



}

