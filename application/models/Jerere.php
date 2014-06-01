<?php

class Application_Model_Jerere
{    private $dbTableJerere;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();
        $select = $this->dbTableJerere->select()
                ->from($this->dbTableJerere)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableJerere->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();
        $arr = $this->dbTableJerere->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();
        
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
        
        
        $dadosJerere = array(
            'jre_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'jre_quantpescadores' => $request['numPescadores'],
            'jre_dhvolta' => $timestampVolta,
            'jre_dhsaida' => $timestampSaida, 
            'jre_avistamento' => $request['avistamento'],
            'jre_subamostra' => $request['subamostra'],
            'jre_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'jre_tempogasto' => $request['tempoGasto'],
            'jre_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'jre_mreviva' => $request['mareviva']
        );
        
        $this->dbTableJerere->insert($dadosJerere);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosJerere = array(
            'jre_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'jre_quantpescadores' => $request['numPescadores'],
            'jre_dhvolta' => $timestampVolta,
            'jre_dhsaida' => $timestampSaida, 
            'jre_tempogasto' => $request['tempoGasto'],
            'jre_diesel' => $request['diesel'],
            'jre_oleo' => $request['oleo'],
            'jre_alimento' => $request['alimento'],
            'jre_gelo' => $request['gelo'],
            'jre_avistamento' => $request['avistamento'],
            'jre_subamostra' => $request['subamostra'],
            'jre_obs' => $request['observacao'],
            'sa_id' => $request['subamostra'],
            'jre_numanzoisplinha' => $request['numAnzois'],
            'jre_numlinhas' => $request['numLinhas'],
            'isc_id' => $request['isca'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'jre_mreviva' => $request['mareviva']
        );
 
        
        $whereJerere= $this->dbTableJerere->getAdapter()
                ->quoteInto('"jre_id" = ?', $request[0]);
        
        
        $this->dbTableJerere->update($dadosJerere, $whereJerere);
    }
    
    public function delete($idJerere)
    {
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();       
                
        $whereJerere= $this->dbTableJerere->getAdapter()
                ->quoteInto('"jre_id" = ?', $idJerere);
        
        $this->dbTableJerere->delete($whereJerere);
    }
    public function selectId(){
        $this->dbTableJerere = new Application_Model_DbTable_Jerere();
        
        $select = $this->dbTableJerere->select()
                ->from($this->dbTableJerere, 'jre_id')->order('jre_id DESC')->limit('1');
        
        return $this->dbTableJerere->fetchAll($select)->toArray();
    }
    public function selectJerereHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableJerereHasPesqueiro = new Application_Model_DbTable_VJerereHasPesqueiro();
        $select = $this->dbTableJerereHasPesqueiro->select()
                ->from($this->dbTableJerereHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableJerereHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTJerereHasPesqueiro = new Application_Model_DbTable_JerereHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'jre_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTJerereHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTJerereHasPesqueiro = new Application_Model_DbTable_JerereHasPesqueiro();       
                
        $whereJerereHasPesqueiro = $this->dbTableTJerereHasPesqueiro->getAdapter()
                ->quoteInto('"jre_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTJerereHasPesqueiro->delete($whereJerereHasPesqueiro);
        
    }



}

