<?php

class Application_Model_Ratoeira
{    
   private $dbTableRatoeira;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();
        $select = $this->dbTableRatoeira->select()
                ->from($this->dbTableRatoeira)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableRatoeira->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();
        $arr = $this->dbTableRatoeira->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();
        
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
        
        
        $dadosRatoeira = array(
            'rat_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'rat_quantpescadores' => $request['numPescadores'],
            'rat_dhvolta' => $timestampVolta,
            'rat_dhsaida' => $timestampSaida, 
            'rat_avistamento' => $request['avistamento'],
            'rat_subamostra' => $request['subamostra'],
            'rat_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'rat_tempogasto' => $request['tempoGasto'],
            'rat_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'rat_mreviva' => $request['mareviva']
        );
        
        $this->dbTableRatoeira->insert($dadosRatoeira);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosRatoeira = array(
            'rat_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'rat_quantpescadores' => $request['numPescadores'],
            'rat_dhvolta' => $timestampVolta,
            'rat_dhsaida' => $timestampSaida, 
            'rat_avistamento' => $request['avistamento'],
            'rat_subamostra' => $request['subamostra'],
            'rat_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'rat_tempogasto' => $request['tempoGasto'],
            'rat_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'rat_mreviva' => $request['mareviva']
        );
 
        
        $whereRatoeira= $this->dbTableRatoeira->getAdapter()
                ->quoteInto('"rat_id" = ?', $request[0]);
        
        
        $this->dbTableRatoeira->update($dadosRatoeira, $whereRatoeira);
    }
    
    public function delete($idRatoeira)
    {
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();       
                
        $whereRatoeira= $this->dbTableRatoeira->getAdapter()
                ->quoteInto('"rat_id" = ?', $idRatoeira);
        
        $this->dbTableRatoeira->delete($whereRatoeira);
    }
    public function selectId(){
        $this->dbTableRatoeira = new Application_Model_DbTable_Ratoeira();
        
        $select = $this->dbTableRatoeira->select()
                ->from($this->dbTableRatoeira, 'rat_id')->order('rat_id DESC')->limit('1');
        
        return $this->dbTableRatoeira->fetchAll($select)->toArray();
    }
    public function selectRatoeiraHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableRatoeiraHasPesqueiro = new Application_Model_DbTable_VRatoeiraHasPesqueiro();
        $select = $this->dbTableRatoeiraHasPesqueiro->select()
                ->from($this->dbTableRatoeiraHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableRatoeiraHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTRatoeiraHasPesqueiro = new Application_Model_DbTable_RatoeiraHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'rat_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTRatoeiraHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTRatoeiraHasPesqueiro = new Application_Model_DbTable_RatoeiraHasPesqueiro();       
                
        $whereRatoeiraHasPesqueiro = $this->dbTableTRatoeiraHasPesqueiro->getAdapter()
                ->quoteInto('"rat_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTRatoeiraHasPesqueiro->delete($whereRatoeiraHasPesqueiro);
        
    }


}


