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
        
        
        $dadosAmostraCamarao = array(
            
            'tu_id_estagiario' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'],
            'tamc_data' => $request['data_ficha'], 
            'pto_id' => $request['select_nome_porto'],
            'bar_id' => $request['barcoNome'],
            'paf_id' => $request['nomePesqueiro'],
            'tamc_captura_total' => $request['captura_total'],
            'esp_id' => $request['especie_camarao'],
            'sa_id' => $request['subamostra_id']
        );
        
        $idFicha = $this->dbTableAmostraCamarao->insert($dadosAmostraCamarao);
        return $idFicha;
    }
    
    public function update(array $request)
    {
        $this->dbTableAmostraCamarao = new Application_Model_DbTable_AmostraCamarao();
        
        $dadosAmostraCamarao = array(
            
            'tu_id_estagiario' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'],
            'tamc_data' => $request['data_ficha'], 
            'pto_id' => $request['select_nome_porto'],
            'bar_id' => $request['barcoNome'],
            'paf_id' => $request['nomePesqueiro'],
            'tamc_captura_total' => $request['captura_total'],
            'esp_id' => $request['especie_camarao'],
            'sa_id' => $request['subamostra_id']
        );
 
        
        $whereAmostraCamarao= $this->dbTableAmostraCamarao->getAdapter()
                ->quoteInto('"tamc_id" = ?', $request[0]);
        
        
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

}