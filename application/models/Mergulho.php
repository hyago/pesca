<?php

class Application_Model_Mergulho
{
private $dbTableMergulho;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();
        $select = $this->dbTableMergulho->select()
                ->from($this->dbTableMergulho)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableMergulho->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();
        $arr = $this->dbTableMergulho->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();
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
        
        $mareViva = $request['mareviva'];
        if($mareViva=='1'){
            $mareViva = true;
        }
        else {
            $mareViva = false;
        }
        
        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        
        $dadosMergulho = array(
            'mer_embarcada' => $request['embarcada'],
            'mer_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'mer_quantpescadores' => $request['numPescadores'],
            'mer_dhsaida' => $timestampSaida,
            'mer_dhvolta' => $timestampVolta,
            'mer_tempogasto' => $request['tempoGasto'],
            'mer_avistou' => $request['avistamento'],
            'mer_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'mer_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'mer_distapesqueiro' => $request['distanciaPesqueiro'],
            'mer_tempoatepesqueiro' => $request['tempoPesqueiro'],
            'mre_id' => $request['mare'],
            'mer_mreviva' => $request['mareviva']
        );
        
        $this->dbTableMergulho->insert($dadosMergulho);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosMergulho = array(
            'mer_embarcada' => $request['embarcada'],
            'mer_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'mer_quantpescadores' => $request['numPescadores'],
            'mer_dhsaida' => $timestampSaida,
            'mer_dhvolta' => $timestampVolta,
            'mer_tempogasto' => $request['tempoGasto'],
            'mer_avistou' => $request['avistamento'],
            'mer_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'mer_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'mer_distapesqueiro' => $request['distanciaPesqueiro'],
            'mer_tempoatepesqueiro' => $request['tempoPesqueiro'],
            'mre_id' => $request['mare'],
            'mer_mreviva' => $request['mareviva']
        );
 
        
        $whereMergulho= $this->dbTableMergulho->getAdapter()
                ->quoteInto('"mer_id" = ?', $request[0]);
        
        
        $this->dbTableMergulho->update($dadosMergulho, $whereMergulho);
    }
    
    public function delete($idMergulho)
    {
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();       
                
        $whereMergulho= $this->dbTableMergulho->getAdapter()
                ->quoteInto('"mer_id" = ?', $idMergulho);
        
        $this->dbTableMergulho->delete($whereMergulho);
    }
    public function selectId(){
        $this->dbTableMergulho = new Application_Model_DbTable_Mergulho();
        
        $select = $this->dbTableMergulho->select()
                ->from($this->dbTableMergulho, 'mer_id')->order('mer_id DESC')->limit('1');
        
        return $this->dbTableMergulho->fetchAll($select)->toArray();
    }
    
    
    public function selectMergulhoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableMergulhoHasPesqueiro = new Application_Model_DbTable_VMergulhoHasPesqueiro();
        $select = $this->dbTableMergulhoHasPesqueiro->select()
                ->from($this->dbTableMergulhoHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableMergulhoHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTMergulhoHasPesqueiro = new Application_Model_DbTable_MergulhoHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'mer_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTMergulhoHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTMergulhoHasPesqueiro = new Application_Model_DbTable_MergulhoHasPesqueiro();       
                
        $whereMergulhoHasPesqueiro = $this->dbTableTMergulhoHasPesqueiro->getAdapter()
                ->quoteInto('"mer_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTMergulhoHasPesqueiro->delete($whereMergulhoHasPesqueiro);
        
    }
    public function selectMergulhoHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableMergulhoHasEspCapturada = new Application_Model_DbTable_VMergulhoHasEspecieCapturada();
        
        $select = $this->dbTableMergulhoHasEspCapturada->select()
                ->from($this->dbTableMergulhoHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableMergulhoHasEspCapturada->fetchAll($select)->toArray();
    }
    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTMergulhoHasEspCapturada = new Application_Model_DbTable_MergulhoHasEspecieCapturada();
        
        
        $dadosEspecie = array(
            'mer_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTMergulhoHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTMergulhoHasEspCapturada = new Application_Model_DbTable_MergulhoHasEspecieCapturada();       
                
        $whereMergulhoHasEspCapturada = $this->dbTableTMergulhoHasEspCapturada->getAdapter()
                ->quoteInto('"spc_mer_id" = ?', $idEspecie);
        
        $this->dbTableTMergulhoHasEspCapturada->delete($whereMergulhoHasEspCapturada);
    }
}
