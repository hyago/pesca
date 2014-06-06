<?php

class Application_Model_Linha
{
private $dbTableLinha;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinha = new Application_Model_DbTable_Linha();
        $select = $this->dbTableLinha->select()
                ->from($this->dbTableLinha)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinha->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableLinha = new Application_Model_DbTable_Linha();
        $arr = $this->dbTableLinha->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableLinha = new Application_Model_DbTable_Linha();
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
        
         $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        
        $dadosLinha = array(
            'lin_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'lin_motor'=> $request['motor'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'lin_numpescadores' => $request['numPescadores'],
            'lin_dhsaida' => $timestampSaida,
            'lin_dhvolta' => $timestampVolta,
            'lin_diesel' => $request['diesel'], 
            'lin_oleo' => $request['oleo'],
            'lin_alimento' => $request['alimento'],
            'lin_gelo' => $request['gelo'],
            'lin_numlinhas' => $request['numLinhas'],
            'lin_avistou' => $request['avistamento'],
            'lin_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'lin_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'isc_id' => $request['isca'],
            'lin_numanzoisplinha' => $request['numAnzois']
        );
        
        $insertArrasto = $this->dbTableLinha->insert($dadosLinha);
        return $insertArrasto;
    }
    
    public function update(array $request)
    {
        $this->dbTableLinha = new Application_Model_DbTable_Linha();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosLinha = array(
            'lin_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'lin_motor'=> $request['motor'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'lin_numpescadores' => $request['numPescadores'],
            'lin_dhsaida' => $timestampSaida,
            'lin_dhvolta' => $timestampVolta,
            'lin_diesel' => $request['diesel'], 
            'lin_oleo' => $request['oleo'],
            'lin_alimento' => $request['alimento'],
            'lin_gelo' => $request['gelo'],
            'lin_numlinhas' => $request['numLinhas'],
            'lin_avistou' => $request['avistamento'],
            'lin_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'lin_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'isc_id' => $request['isca'],
            'lin_numanzoisplinha' => $request['numAnzois']
        );
 
        
        $whereLinha= $this->dbTableLinha->getAdapter()
                ->quoteInto('"lin_id" = ?', $request[0]);
        
        
        $this->dbTableLinha->update($dadosLinha, $whereLinha);
    }
    
    public function delete($idLinha)
    {
        $this->dbTableLinha = new Application_Model_DbTable_Linha();       
                
        $whereLinha= $this->dbTableLinha->getAdapter()
                ->quoteInto('"lin_id" = ?', $idLinha);
        
        $this->dbTableLinha->delete($whereLinha);
    }
    public function selectId(){
        $this->dbTableLinha = new Application_Model_DbTable_Linha();
        
        $select = $this->dbTableLinha->select()
                ->from($this->dbTableLinha, 'lin_id')->order('lin_id DESC')->limit('1');
        
        return $this->dbTableLinha->fetchAll($select)->toArray();
    }
    
    public function selectLinhaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinhaHasPesqueiro = new Application_Model_DbTable_VLinhaHasPesqueiro();
        $select = $this->dbTableLinhaHasPesqueiro->select()
                ->from($this->dbTableLinhaHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinhaHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro)
    {
        $this->dbTableTLinhaHasPesqueiro = new Application_Model_DbTable_LinhaHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'lin_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro
        );
        
        $this->dbTableTLinhaHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTLinhaHasPesqueiro = new Application_Model_DbTable_LinhaHasPesqueiro();       
                
        $whereLinhaHasPesqueiro = $this->dbTableTLinhaHasPesqueiro->getAdapter()
                ->quoteInto('"lin_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTLinhaHasPesqueiro->delete($whereLinhaHasPesqueiro);
        
    }
    public function selectLinhaHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableLinhaHasEspCapturada = new Application_Model_DbTable_VLinhaHasEspecieCapturada();
        
        $select = $this->dbTableLinhaHasEspCapturada->select()
                ->from($this->dbTableLinhaHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableLinhaHasEspCapturada->fetchAll($select)->toArray();
    }

    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTLinhaHasEspCapturada = new Application_Model_DbTable_LinhaHasEspecieCapturada();
        
        
        $dadosEspecie = array(
            'lin_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTLinhaHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTLinhaHasEspCapturada = new Application_Model_DbTable_LinhaHasEspecieCapturada();       
                
        $whereLinhaHasEspCapturada = $this->dbTableTLinhaHasEspCapturada->getAdapter()
                ->quoteInto('"spc_lin_id" = ?', $idEspecie);
        
        $this->dbTableTLinhaHasEspCapturada->delete($whereLinhaHasEspCapturada);
    }
    public function selectEntrevistaLinha($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinha = new Application_Model_DbTable_VEntrevistaLinha();
        $select = $this->dbTableLinha->select()
                ->from($this->dbTableLinha)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinha->fetchAll($select)->toArray();
    }
}

