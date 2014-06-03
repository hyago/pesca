<?php 

class Application_Model_Tarrafa
{
    private $dbTableTarrafa;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();
        $select = $this->dbTableTarrafa->select()
                ->from($this->dbTableTarrafa)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableTarrafa->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();
        $arr = $this->dbTableTarrafa->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();
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
        $dadosTarrafa = array(
            'tar_embarcado' => $request['embarcada'],
            'tar_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'tar_quantpescadores' => $request['numPescadores'],
            'tar_data' => $request['data'],
            'tar_tempogasto' => $request['tempoGasto'], 
            'tar_roda' => $request['roda'],
            'tar_altura' => $request['altura'],
            'tar_malha' => $request['malha'],
            'tar_numlances' => $request['numLances'],
            'tar_avistou' => $request['avistamento'],
            'tar_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'tar_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
        
        $this->dbTableTarrafa->insert($dadosTarrafa);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosTarrafa = array(
            'tar_embarcado' => $request['embarcada'],
            'tar_motor'=> $request['motor'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'tar_quantpescadores' => $request['numPescadores'],
            'tar_data' => $request['data'],
            'tar_tempogasto' => $request['tempoGasto'], 
            'tar_roda' => $request['roda'],
            'tar_altura' => $request['altura'],
            'tar_malha' => $request['malha'],
            'tar_numlances' => $request['numLances'],
            'tar_avistou' => $request['avistamento'],
            'tar_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'tar_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
 
        
        $whereTarrafa= $this->dbTableTarrafa->getAdapter()
                ->quoteInto('"tar_id" = ?', $request[0]);
        
        
        $this->dbTableTarrafa->update($dadosTarrafa, $whereTarrafa);
    }
    
    public function delete($idTarrafa)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();       
                
        $whereTarrafa= $this->dbTableTarrafa->getAdapter()
                ->quoteInto('"tar_id" = ?', $idTarrafa);
        
        $this->dbTableTarrafa->delete($whereTarrafa);
    }
    public function selectId(){
        $this->dbTableTarrafa = new Application_Model_DbTable_Tarrafa();
        
        $select = $this->dbTableTarrafa->select()
                ->from($this->dbTableTarrafa, 'tar_id')->order('tar_id DESC')->limit('1');
        
        return $this->dbTableTarrafa->fetchAll($select)->toArray();
    }
    public function selectTarrafaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_VTarrafaHasPesqueiro();
        $select = $this->dbTableTarrafa->select()
                ->from($this->dbTableTarrafa)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableTarrafa->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro)
    {
        $this->dbTableTTarrafa = new Application_Model_DbTable_TarrafaHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'tar_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
        );
        
        $this->dbTableTTarrafa->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTTarrafa = new Application_Model_DbTable_TarrafaHasPesqueiro();       
                
        $whereTarrafaHasPesqueiro = $this->dbTableTTarrafa->getAdapter()
                ->quoteInto('"tar_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTTarrafa->delete($whereTarrafaHasPesqueiro);
        
    }



}
