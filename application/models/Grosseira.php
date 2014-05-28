<?php

class Application_Model_Grosseira
{
private $dbTableGrosseira;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();
        $select = $this->dbTableGrosseira->select()
                ->from($this->dbTableGrosseira)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableGrosseira->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();
        $arr = $this->dbTableGrosseira->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();
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
        
        $dadosGrosseira = array(
            'grs_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'grs_numpescadores' => $request['numPescadores'],
            'grs_dhsaida' => $timestampSaida,
            'grs_dhvolta' => $timestampVolta,
            'grs_diesel' => $request['diesel'], 
            'grs_oleo' => $request['oleo'],
            'grs_alimento' => $request['alimento'],
            'grs_gelo' => $request['gelo'],
            'grs_numlinhas' => $request['numLinhas'],
            'grs_avistou' => $request['avistamento'],
            'grs_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'grs_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento'],
            'isc_id' => $request['isca'],
            'grs_numanzoisplinha' => $request['numAnzois'],
            'grs_tempoatepesqueiro' => $request['tempoaPesqueiro']
        );
        
        $this->dbTableGrosseira->insert($dadosGrosseira);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosGrosseira = array(
            'grs_embarcado' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'grs_quantpescadores' => $request['numPescadores'],
            'grs_dhvolta' => $timestampVolta,
            'grs_dhsaida' => $timestampSaida, 
            'grs_diesel' => $request['diesel'],
            'grs_oleo' => $request['oleo'],
            'grs_alimento' => $request['alimento'],
            'grs_gelo' => $request['gelo'],
            'grs_avistou' => $request['avistamento'],
            'grs_subamostra' => $request['subamostra'],
            'grs_obs' => $request['observacao'],
        );
 
        
        $whereGrosseira= $this->dbTableGrosseira->getAdapter()
                ->quoteInto('"grs_id" = ?', $request[0]);
        
        
        $this->dbTableGrosseira->update($dadosGrosseira, $whereGrosseira);
    }
    
    public function delete($idGrosseira)
    {
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();       
                
        $whereGrosseira= $this->dbTableGrosseira->getAdapter()
                ->quoteInto('"grs_id" = ?', $idGrosseira);
        
        $this->dbTableGrosseira->delete($whereGrosseira);
    }
    public function selectId(){
        $this->dbTableGrosseira = new Application_Model_DbTable_Grosseira();
        
        $select = $this->dbTableGrosseira->select()
                ->from($this->dbTableGrosseira, 'grs_id')->order('grs_id DESC')->limit('1');
        
        return $this->dbTableGrosseira->fetchAll($select)->toArray();
    }

}

