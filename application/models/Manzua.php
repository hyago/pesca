<?php

class Application_Model_Manzua
{    
   private $dbTableManzua;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();
        $select = $this->dbTableManzua->select()
                ->from($this->dbTableManzua)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableManzua->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();
        $arr = $this->dbTableManzua->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();
        
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
        
        
        $dadosManzua = array(
            'man_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'man_quantpescadores' => $request['numPescadores'],
            'man_dhvolta' => $timestampVolta,
            'man_dhsaida' => $timestampSaida, 
            'man_avistamento' => $request['avistamento'],
            'man_subamostra' => $request['subamostra'],
            'man_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'man_tempogasto' => $request['tempoGasto'],
            'man_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'man_mreviva' => $request['mareviva']
        );
        
        $this->dbTableManzua->insert($dadosManzua);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosManzua = array(
            'man_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'man_quantpescadores' => $request['numPescadores'],
            'man_dhvolta' => $timestampVolta,
            'man_dhsaida' => $timestampSaida, 
            'man_avistamento' => $request['avistamento'],
            'man_subamostra' => $request['subamostra'],
            'man_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'man_tempogasto' => $request['tempoGasto'],
            'man_numarmadilhas' => $request['numArmadilhas'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'man_mreviva' => $request['mareviva']
        );
 
        
        $whereManzua= $this->dbTableManzua->getAdapter()
                ->quoteInto('"man_id" = ?', $request[0]);
        
        
        $this->dbTableManzua->update($dadosManzua, $whereManzua);
    }
    
    public function delete($idManzua)
    {
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();       
                
        $whereManzua= $this->dbTableManzua->getAdapter()
                ->quoteInto('"man_id" = ?', $idManzua);
        
        $this->dbTableManzua->delete($whereManzua);
    }
    public function selectId(){
        $this->dbTableManzua = new Application_Model_DbTable_Manzua();
        
        $select = $this->dbTableManzua->select()
                ->from($this->dbTableManzua, 'man_id')->order('man_id DESC')->limit('1');
        
        return $this->dbTableManzua->fetchAll($select)->toArray();
    }
    public function selectManzuaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableManzuaHasPesqueiro = new Application_Model_DbTable_VManzuaHasPesqueiro();
        $select = $this->dbTableManzuaHasPesqueiro->select()
                ->from($this->dbTableManzuaHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableManzuaHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTManzuaHasPesqueiro = new Application_Model_DbTable_ManzuaHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'man_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTManzuaHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTManzuaHasPesqueiro = new Application_Model_DbTable_ManzuaHasPesqueiro();       
                
        $whereManzuaHasPesqueiro = $this->dbTableTManzuaHasPesqueiro->getAdapter()
                ->quoteInto('"man_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTManzuaHasPesqueiro->delete($whereManzuaHasPesqueiro);
        
    }
    public function selectManzuaHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableManzuaHasEspCapturada = new Application_Model_DbTable_VManzuaHasEspecieCapturada();
        
        $select = $this->dbTableManzuaHasEspCapturada->select()
                ->from($this->dbTableManzuaHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableManzuaHasEspCapturada->fetchAll($select)->toArray();
    }

    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTManzuaHasEspCapturada = new Application_Model_DbTable_ManzuaHasEspecieCapturada();
        
        
        $dadosEspecie = array(
            'man_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTManzuaHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTManzuaHasEspCapturada = new Application_Model_DbTable_ManzuaHasEspecieCapturada();       
                
        $whereManzuaHasEspCapturada = $this->dbTableTManzuaHasEspCapturada->getAdapter()
                ->quoteInto('"spc_man_id" = ?', $idEspecie);
        
        $this->dbTableTManzuaHasEspCapturada->delete($whereManzuaHasEspCapturada);
    }




}

