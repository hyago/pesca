<?php

class Application_Model_LinhaFundo
{    private $dbTableLinhaFundo;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();
        $select = $this->dbTableLinhaFundo->select()
                ->from($this->dbTableLinhaFundo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinhaFundo->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();
        $arr = $this->dbTableLinhaFundo->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();
        
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
        
        
        $dadosLinhaFundo = array(
            'lf_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'lf_quantpescadores' => $request['numPescadores'],
            'lf_dhvolta' => $timestampVolta,
            'lf_dhsaida' => $timestampSaida, 
            'lf_tempogasto' => $request['tempoGasto'],
            'lf_diesel' => $request['diesel'],
            'lf_oleo' => $request['oleo'],
            'lf_alimento' => $request['alimento'],
            'lf_gelo' => $request['gelo'],
            'lf_avistamento' => $request['avistamento'],
            'lf_subamostra' => $request['subamostra'],
            'lf_obs' => $request['observacao'],
            'sa_id' => $idSubamostra,
            'lf_numanzoisplinha' => $request['numAnzois'],
            'lf_numlinhas' => $request['numLinhas'],
            'isc_id' => $request['isca'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'lf_mreviva' => $request['mareviva']
        );
        
        $this->dbTableLinhaFundo->insert($dadosLinhaFundo);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosLinhaFundo = array(
            'lf_embarcada' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'lf_quantpescadores' => $request['numPescadores'],
            'lf_dhvolta' => $timestampVolta,
            'lf_dhsaida' => $timestampSaida, 
            'lf_tempogasto' => $request['tempoGasto'],
            'lf_diesel' => $request['diesel'],
            'lf_oleo' => $request['oleo'],
            'lf_alimento' => $request['alimento'],
            'lf_gelo' => $request['gelo'],
            'lf_avistamento' => $request['avistamento'],
            'lf_subamostra' => $request['subamostra'],
            'lf_obs' => $request['observacao'],
            'sa_id' => $request['subamostra'],
            'lf_numanzoisplinha' => $request['numAnzois'],
            'lf_numlinhas' => $request['numLinhas'],
            'isc_id' => $request['isca'],
            'mnt_id' => $request['id_monitoramento'],
            'mre_id' => $request['mare'],
            'lf_mreviva' => $request['mareviva']
        );
 
        
        $whereLinhaFundo= $this->dbTableLinhaFundo->getAdapter()
                ->quoteInto('"lf_id" = ?', $request[0]);
        
        
        $this->dbTableLinhaFundo->update($dadosLinhaFundo, $whereLinhaFundo);
    }
    
    public function delete($idLinhaFundo)
    {
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();       
                
        $whereLinhaFundo= $this->dbTableLinhaFundo->getAdapter()
                ->quoteInto('"lf_id" = ?', $idLinhaFundo);
        
        $this->dbTableLinhaFundo->delete($whereLinhaFundo);
    }
    public function selectId(){
        $this->dbTableLinhaFundo = new Application_Model_DbTable_LinhaFundo();
        
        $select = $this->dbTableLinhaFundo->select()
                ->from($this->dbTableLinhaFundo, 'lf_id')->order('lf_id DESC')->limit('1');
        
        return $this->dbTableLinhaFundo->fetchAll($select)->toArray();
    }



}

