<?php

class Application_Model_AmostraCamarao
{
    private $dbTableAmostraCamarao;
    private $dbTableAmostraCamaraoView;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        $select = $this->dbTableAmostraCamarao->select()
                ->from($this->dbTableAmostraCamarao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableAmostraCamarao->fetchAll($select)->toArray();
    }
    
    public function selectView($where = null, $order = null, $limit = null)
    {
        $this->dbTableAmostraCamaraoView = new Application_Model_DbTable_VAmostraCamarao();
        $select = $this->dbTableAmostraCamaraoView->select()
                ->from($this->dbTableAmostraCamaraoView)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableAmostraCamaraoView->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        $arr = $this->dbTableAmostraCamarao->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $this->dbTableEstagiario = new Application_Model_Usuario();
        $this->dbTableMonitor = new Application_Model_Usuario();
        
        $capturaTotal = $request['captura_total'];
        
        if(empty($capturaTotal)){
            $capturaTotal = null;
        }
        $dadosAmostraCamarao = array(
            
            'tu_id' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'],
            'tamc_data' => $request['data_amostra'], 
            'pto_id' => $request['select_nome_porto'],
            'bar_id' => $request['nomeBarco'],
            'paf_id' => $request['nomePesqueiro'],
            'tamc_captura_total' => $capturaTotal,
            'esp_id' => $request['especie_camarao'],
            'sa_id' => $request['subamostra_id']
        );
        
        $idFicha = $this->dbTableAmostraCamarao->insert($dadosAmostraCamarao);
        return $idFicha;
    }
    
    public function update(array $request)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        
        $capturaTotal = $request['captura_total'];
        
        if(empty($capturaTotal)){
            $capturaTotal = null;
        }
        $dadosAmostraCamarao = array(
            
            'tu_id' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'],
            'tamc_data' => $request['data_amostra'], 
            'pto_id' => $request['select_nome_porto'],
            'bar_id' => $request['nomeBarco'],
            'paf_id' => $request['nomePesqueiro'],
            'tamc_captura_total' => $capturaTotal,
            'esp_id' => $request['especie_camarao'],
            'sa_id' => $request['subamostra_id']
        );
 
        
        $whereAmostraCamarao= $this->dbTableAmostraCamarao->getAdapter()
                ->quoteInto('"tamc_id" = ?', $request['id_amostra']);
        
        
        $this->dbTableAmostraCamarao->update($dadosAmostraCamarao, $whereAmostraCamarao);
    }
    
    public function delete($idAmostraCamarao)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();       
                
        $whereAmostraCamarao= $this->dbTableAmostraCamarao->getAdapter()
                ->quoteInto('"tamc_id" = ?', $idAmostraCamarao);
        
        $this->dbTableAmostraCamarao->delete($whereAmostraCamarao);
    }
    public function selectId(){
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        
        $select = $this->dbTableAmostraCamarao->select()
                ->from($this->dbTableAmostraCamarao, 'tamc_id')->order('tamc_id DESC')->limit('1');
        
        return $this->dbTableAmostraCamarao->fetchAll($select)->toArray();
    }
    public function insertUnidade($idAmostra, $sexo, $maturidade, $compCabeca, $peso)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_UnidadeCamarao();


        $dadosUnidade = array(
            'tamc_id' => $idAmostra,
            'tuc_sexo' => $sexo,
            'tmat_id' => $maturidade,
            'tuc_comprimento_cabeca' => $compCabeca,
            'tuc_peso' => $peso
        );

        $this->dbTableUnidadeCamarao->insert($dadosUnidade);
        return;
    }
}