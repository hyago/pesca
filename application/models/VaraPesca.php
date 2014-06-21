<?php

class Application_Model_VaraPesca
{
    private $dbTableVaraPesca;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();
        $select = $this->dbTableVaraPesca->select()
                ->from($this->dbTableVaraPesca)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableVaraPesca->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();
        $arr = $this->dbTableVaraPesca->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();
        
        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        if($timestampSaida > $timestampVolta){
            $timestampVolta = 'Erro';
        }
        
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
        $diesel = $request['diesel'];
        $oleo = $request['oleo'];
        $alimento = $request['alimento'];
        $gelo = $request['gelo'];
        
        $numLinhas = $request['numLinhas'];
        $numAnzois = $request['numAnzois'];
        
        if(empty($numLinhas)){
            $numLinhas = NULL;
        }
        if(empty($numAnzois)){
            $numAnzois = NULL;
        }
        
        if(empty($diesel)){
            $diesel = NULL;
        }
        if(empty($oleo)){
            $oleo = NULL;
        }
        if(empty($alimento)){
            $alimento = NULL;
        }
        if(empty($gelo)){
            $gelo = NULL;
        }
        
        $dadosVaraPesca = array(
            'vp_embarcada' => $request['embarcada'],
            'vp_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'vp_quantpescadores' => $request['numPescadores'],
            'vp_dhvolta' => $timestampVolta,
            'vp_dhsaida' => $timestampSaida, 
            'vp_tempogasto' => $request['tempoGasto'],
            'vp_diesel' => $diesel,
            'vp_oleo' => $oleo,
            'vp_alimento' => $alimento,
            'vp_gelo' => $gelo,
            'vp_subamostra' => $request['subamostra'],
            'vp_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'vp_numanzoisplinha' => $numAnzois,
            'vp_numlinhas' => $numLinhas,
            'isc_id' => $request['isca'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'vp_mreviva' => $request['mareviva']
        );
        
        $insertArrasto = $this->dbTableVaraPesca->insert($dadosVaraPesca);
        return $insertArrasto;
    }
    
    public function update(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();
        
        $timestampSaida = $request['dataSaida']." ".$request['horaSaida'];
        $timestampVolta = $request['dataVolta']." ".$request['horaVolta'];
        if($timestampSaida > $timestampVolta){
            $timestampVolta = 'Erro';
        }
        
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
        $diesel = $request['diesel'];
        $oleo = $request['oleo'];
        $alimento = $request['alimento'];
        $gelo = $request['gelo'];
        
        $numLinhas = $request['numLinhas'];
        $numAnzois = $request['numAnzois'];
        
        if(empty($numLinhas)){
            $numLinhas = NULL;
        }
        if(empty($numAnzois)){
            $numAnzois = NULL;
        }
        
        if(empty($diesel)){
            $diesel = NULL;
        }
        if(empty($oleo)){
            $oleo = NULL;
        }
        if(empty($alimento)){
            $alimento = NULL;
        }
        if(empty($gelo)){
            $gelo = NULL;
        }
        
        $dadosVaraPesca = array(
            'vp_embarcada' => $request['embarcada'],
            'vp_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'vp_quantpescadores' => $request['numPescadores'],
            'vp_dhvolta' => $timestampVolta,
            'vp_dhsaida' => $timestampSaida, 
            'vp_tempogasto' => $request['tempoGasto'],
            'vp_diesel' => $diesel,
            'vp_oleo' => $oleo,
            'vp_alimento' => $alimento,
            'vp_gelo' => $gelo,
            'vp_subamostra' => $request['subamostra'],
            'vp_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'vp_numanzoisplinha' => $numAnzois,
            'vp_numlinhas' => $numLinhas,
            'isc_id' => $request['isca'],
            'mre_id' => $request['mare'],
            'vp_mreviva' => $request['mareviva']
        );
 
        
        $whereVaraPesca= $this->dbTableVaraPesca->getAdapter()
                ->quoteInto('"vp_id" = ?', $request['id_entrevista']);
        
        
        $this->dbTableVaraPesca->update($dadosVaraPesca, $whereVaraPesca);
    }
    
    public function delete($idVaraPesca)
    {
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();       
                
        $whereVaraPesca= $this->dbTableVaraPesca->getAdapter()
                ->quoteInto('"vp_id" = ?', $idVaraPesca);
        
        $this->dbTableVaraPesca->delete($whereVaraPesca);
    }
    public function selectId(){
        $this->dbTableVaraPesca = new Application_Model_DbTable_VaraPesca();
        
        $select = $this->dbTableVaraPesca->select()
                ->from($this->dbTableVaraPesca, 'vp_id')->order('vp_id DESC')->limit('1');
        
        return $this->dbTableVaraPesca->fetchAll($select)->toArray();
    }
    public function selectVaraPescaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableVaraPescaHasPesqueiro = new Application_Model_DbTable_VVaraPescaHasPesqueiro();
        $select = $this->dbTableVaraPescaHasPesqueiro->select()
                ->from($this->dbTableVaraPescaHasPesqueiro)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableVaraPescaHasPesqueiro->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro, $tempoAPesqueiro, $distAPesqueiro)
    {
        $this->dbTableTVaraPescaHasPesqueiro = new Application_Model_DbTable_VaraPescaHasPesqueiro();
        
        if(empty($distAPesqueiro)){
            $distAPesqueiro = NULL;
        }
        if(empty($tempoAPesqueiro)){
            $tempoAPesqueiro = NULL;
        }
        
        $dadosPesqueiro = array(
            'vp_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
            't_tempoapesqueiro' => $tempoAPesqueiro,
            't_distapesqueiro' => $distAPesqueiro
        );
        
        $this->dbTableTVaraPescaHasPesqueiro->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTVaraPescaHasPesqueiro = new Application_Model_DbTable_VaraPescaHasPesqueiro();       
                
        $whereVaraPescaHasPesqueiro = $this->dbTableTVaraPescaHasPesqueiro->getAdapter()
                ->quoteInto('"vp_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTVaraPescaHasPesqueiro->delete($whereVaraPescaHasPesqueiro);
        
    }
    public function selectVaraPescaHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableVaraPescaHasEspCapturada = new Application_Model_DbTable_VVaraPescaHasEspecieCapturada();
        
        $select = $this->dbTableVaraPescaHasEspCapturada->select()
                ->from($this->dbTableVaraPescaHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableVaraPescaHasEspCapturada->fetchAll($select)->toArray();
    }
    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTVaraPescaHasEspCapturada = new Application_Model_DbTable_VaraPescaHasEspecieCapturada();
        
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
            'vp_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTVaraPescaHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTVaraPescaHasEspCapturada = new Application_Model_DbTable_VaraPescaHasEspecieCapturada();       
                
        $whereVaraPescaHasEspCapturada = $this->dbTableTVaraPescaHasEspCapturada->getAdapter()
                ->quoteInto('"spc_vp_id" = ?', $idEspecie);
        
        $this->dbTableTVaraPescaHasEspCapturada->delete($whereVaraPescaHasEspCapturada);
    }
    
    public function selectEntrevistaVaraPesca($where = null, $order = null, $limit = null)
    {
        $this->dbTableVaraPesca = new Application_Model_DbTable_VEntrevistaVaraPesca();
        $select = $this->dbTableVaraPesca->select()
                ->from($this->dbTableVaraPesca)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableVaraPesca->fetchAll($select)->toArray();
    }
}

