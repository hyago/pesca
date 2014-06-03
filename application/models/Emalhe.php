<?php

class Application_Model_Emalhe
{
    private $dbTableEmalhe;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();
        $select = $this->dbTableEmalhe->select()
                ->from($this->dbTableEmalhe)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEmalhe->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();
        $arr = $this->dbTableEmalhe->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableSubamostra = new Application_Model_DbTable_Subamostra();
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();
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
        
        $timestampLancamento = $request['dataLancamento']." ".$request['horaLancamento'];
        $timestampRecolhimento = $request['dataRecolhimento']." ".$request['horaRecolhimento'];
        
        $dadosEmalhe = array(
            'em_embarcado' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'em_motor'=> $request['motor'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'em_quantpescadores' => $request['numPescadores'],
            'em_dhlancamento' => $timestampLancamento, 
            'em_dhrecolhimento' => $timestampRecolhimento,
            'em_diesel' => $request['diesel'],
            'em_oleo' => $request['oleo'],
            'em_alimento' => $request['alimento'],
            'em_gelo' => $request['gelo'],
            'em_avistou' => $request['avistamento'],
            'em_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'em_tamanho' => $request['tamanho'],
            'em_altura' => $request['altura'],
            'em_numpanos' => $request['numPanos'],
            'em_malha' => $request['malha'],
            'em_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
        
        $this->dbTableEmalhe->insert($dadosEmalhe);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();
        
        $timestampSaida = $request['dataSaida']+$request['horaSaida'];
        $timestampVolta = $request['dataVolta']+$request['horaVolta'];
        
        
        $dadosEmalhe = array(
            'em_embarcado' => $request['embarcada'],
            'bar_id' => $request['nomeBarco'],
            'em_motor'=> $request['motor'],
            'tte_id' => $request['tipoBarco'],
            'tp_id_entrevistado' => $request['pescadorEntrevistado'],
            'em_quantpescadores' => $request['numPescadores'],
            'em_dhlancamento' => $timestampLancamento, 
            'em_dhrecolhimento' => $timestampRecolhimento,
            'em_diesel' => $request['diesel'],
            'em_oleo' => $request['oleo'],
            'em_alimento' => $request['alimento'],
            'em_gelo' => $request['gelo'],
            'em_avistou' => $request['avistamento'],
            'em_subamostra' => $request['subamostra'],
            'sa_id' => $idSubamostra,
            'em_tamanho' => $request['tamanho'],
            'em_altura' => $request['altura'],
            'em_numpanos' => $request['numPanos'],
            'em_malha' => $request['malha'],
            'em_obs' => $request['observacao'],
            'mnt_id' => $request['id_monitoramento']
        );
 
        
        $whereEmalhe= $this->dbTableEmalhe->getAdapter()
                ->quoteInto('"cal_id" = ?', $request[0]);
        
        
        $this->dbTableEmalhe->update($dadosEmalhe, $whereEmalhe);
    }
    
    public function delete($idEmalhe)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();       
                
        $whereEmalhe= $this->dbTableEmalhe->getAdapter()
                ->quoteInto('"em_id" = ?', $idEmalhe);
        
        $this->dbTableEmalhe->delete($whereEmalhe);
    }
    public function selectId(){
        $this->dbTableEmalhe = new Application_Model_DbTable_Emalhe();
        
        $select = $this->dbTableEmalhe->select()
                ->from($this->dbTableEmalhe, 'em_id')->order('em_id DESC')->limit('1');
        
        return $this->dbTableEmalhe->fetchAll($select)->toArray();
    }
    public function selectEmalheHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_VEmalheHasPesqueiro();
        $select = $this->dbTableEmalhe->select()
                ->from($this->dbTableEmalhe)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEmalhe->fetchAll($select)->toArray();
    }
    public function insertPesqueiro($idEntrevista,$pesqueiro)
    {
        $this->dbTableTEmalhe = new Application_Model_DbTable_EmalheHasPesqueiro();
        
        
        $dadosPesqueiro = array(
            'em_id' => $idEntrevista,
            'paf_id' => $pesqueiro,
        );
        
        $this->dbTableTEmalhe->insert($dadosPesqueiro);
        return;
    }
    public function deletePesqueiro($idPesqueiro){
        $this->dbTableTEmalhe = new Application_Model_DbTable_EmalheHasPesqueiro();       
                
        $whereEmalheHasPesqueiro = $this->dbTableTEmalhe->getAdapter()
                ->quoteInto('"em_paf_id" = ?', $idPesqueiro);
        
        $this->dbTableTEmalhe->delete($whereEmalheHasPesqueiro);
        
    }
    public function selectEmalheHasEspCapturadas($where = null, $order = null, $limit = null){
        $this->dbTableEmalheHasEspCapturada = new Application_Model_DbTable_VEmalheHasEspecieCapturada();
        
        $select = $this->dbTableEmalheHasEspCapturada->select()
                ->from($this->dbTableEmalheHasEspCapturada)->order($order)->limit($limit);
        
        if(!is_null($where)){
            $select->where($where);
        }
        
        return $this->dbTableEmalheHasEspCapturada->fetchAll($select)->toArray();
    }

    public function insertEspCapturada($idEntrevista, $especie, $quantidade, $peso, $precokg)
    {
        $this->dbTableTEmalheHasEspCapturada = new Application_Model_DbTable_EmalheHasEspecieCapturada();
        
        
        $dadosEspecie = array(
            'em_id' => $idEntrevista,
            'esp_id' => $especie,
            'spc_quantidade' => $quantidade,
            'spc_peso_kg' => $peso,
            'spc_preco' => $precokg
        );
        
        $this->dbTableTEmalheHasEspCapturada->insert($dadosEspecie);
        return;
    }
    public function deleteEspCapturada($idEspecie){
        $this->dbTableTEmalheHasEspCapturada = new Application_Model_DbTable_EmalheHasEspecieCapturada();       
                
        $whereEmalheHasEspCapturada = $this->dbTableTEmalheHasEspCapturada->getAdapter()
                ->quoteInto('"spc_em_id" = ?', $idEspecie);
        
        $this->dbTableTEmalheHasEspCapturada->delete($whereEmalheHasEspCapturada);
    }



}

