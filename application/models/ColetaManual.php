<?php

class Application_Model_ColetaManual
{
private $dbTableColetaManual;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();
        $select = $this->dbTableColetaManual->select()
                ->from($this->dbTableColetaManual)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColetaManual->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();
        $arr = $this->dbTableColetaManual->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();
        $this->dbTableMare = new Application_Model_DbTable_Mare();
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
        
        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        
        $dadosColetaManual = array(
            'cml_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'cml_quantpescadores' => $request['numPescadores'],
            'cml_dhsaida' => $timestampSaida,
            'cml_dhvolta' => $timestampVolta,
            'cml_tempogasto' => $request['tempoGasto'],
            'cml_avistamento' => $request['avistamento'],
            'cml_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'cml_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'cml_mreviva' => $request['mareviva']
        );
        
        $this->dbTableColetaManual->insert($dadosColetaManual);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        
        $dadosColetaManual = array(
            'cml_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'cml_quantpescadores' => $request['numPescadores'],
            'cml_dhsaida' => $timestampSaida,
            'cml_dhvolta' => $timestampVolta,
            'cml_tempogasto' => $request['tempoGasto'],
            'cml_avistamento' => $request['avistamento'],
            'cml_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'cml_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'cml_distatepesqueiro' => $request['distanciaPesqueiro'],
            'cml_tempoatepesqueiro' => $request['tempoPesqueiro'],
            'mre_id' => $request['mare'],
            'cml_mreviva' => $request['mareviva']
        );
 
        
        $whereColetaManual= $this->dbTableColetaManual->getAdapter()
                ->quoteInto('"cml_id" = ?', $request[0]);
        
        
        $this->dbTableColetaManual->update($dadosColetaManual, $whereColetaManual);
    }
    
    public function delete($idColetaManual)
    {
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();       
                
        $whereColetaManual= $this->dbTableColetaManual->getAdapter()
                ->quoteInto('"cml_id" = ?', $idColetaManual);
        
        $this->dbTableColetaManual->delete($whereColetaManual);
    }
    public function selectId(){
        $this->dbTableColetaManual = new Application_Model_DbTable_ColetaManual();
        
        $select = $this->dbTableColetaManual->select()
                ->from($this->dbTableColetaManual, 'cml_id')->order('cml_id DESC')->limit('1');
        
        return $this->dbTableColetaManual->fetchAll($select)->toArray();
    }
    public function selectColetaManualHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableColetaManualHasPesqueiro = new Application_Model_DbTable_VColetaManualHasPesqueiro();
        $select = $this->dbTableColetaManualHasPesqueiro->select()
                ->from($this->dbTableColetaManualHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColetaManualHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTColetaManualHasPesqueiro = new Application_Model_DbTable_ColetaManualHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'cml_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTColetaManualHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTColetaManualHasPesqueiro = new Application_Model_DbTable_ColetaManualHasPesqueiro();       
                
        $whereColetaManualHasPesqueiro = $this->dbTableTColetaManualHasPesqueiro->getAdapter()
                ->quoteInto('"cml_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTColetaManualHasPesqueiro->delete($whereColetaManualHasPesqueiro);
        
    }

}

