<?php

class Application_Model_AmostraPeixe
{
    private $dbTableAmostraPeixe;
    private $dbTableAmostraPeixeView;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();
        $select = $this->dbTableAmostraPeixe->select()
                ->from($this->dbTableAmostraPeixe)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableAmostraPeixe->fetchAll($select)->toArray();
    }
    
    public function selectView($where = null, $order = null, $limit = null)
    {
        $this->dbTableAmostraPeixeView = new Application_Model_DbTable_VAmostraPeixe();
        $select = $this->dbTableAmostraPeixeView->select()
                ->from($this->dbTableAmostraPeixeView)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableAmostraPeixeView->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();
        $arr = $this->dbTableAmostraPeixe->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();
        
        $dadosAmostraPeixe = array(   
            'tu_id' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'], 
            'pto_id' => $request['select_nome_porto'],
            'sa_id' => $request['subamostra_id']
        );
        
        $idFicha = $this->dbTableAmostraPeixe->insert($dadosAmostraPeixe);
        return $idFicha;
    }
    
    public function update(array $request)
    {
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();
        
        $dadosAmostraPeixe = array(   
            'tu_id' => $request['select_nome_estagiario'],
            'tu_id_monitor' => $request['select_nome_monitor'], 
            'pto_id' => $request['select_nome_porto'],
            'sa_id' => $request['subamostra_id']
        );
 
        
        $whereAmostraPeixe= $this->dbTableAmostraPeixe->getAdapter()
                ->quoteInto('"tamp_id" = ?', $request['id_amostra']);
        
        
        $this->dbTableAmostraPeixe->update($dadosAmostraPeixe, $whereAmostraPeixe);
    }
    
    public function delete($idAmostraPeixe)
    {
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();       
                
        $whereAmostraPeixe= $this->dbTableAmostraPeixe->getAdapter()
                ->quoteInto('"tamp_id" = ?', $idAmostraPeixe);
        
        $this->dbTableAmostraPeixe->delete($whereAmostraPeixe);
    }
    public function selectId(){
        $this->dbTableAmostraPeixe = new Application_Model_DbTable_AmostraPeixe();
        
        $select = $this->dbTableAmostraPeixe->select()
                ->from($this->dbTableAmostraPeixe, 'tamp_id')->order('tamp_id DESC')->limit('1');
        
        return $this->dbTableAmostraPeixe->fetchAll($select)->toArray();
    }
    public function insertUnidade($idAmostra, $sexo, $especie, $comprimento, $peso)
    {
        $this->dbTableUnidadePeixe = new Application_Model_DbTable_UnidadePeixe();


        $dadosUnidade = array(
            'tamp_id' => $idAmostra,
            'esp_id' => $especie,
            'tup_sexo' => $sexo,
            'tup_comprimento' => $comprimento,
            'tup_peso' => $peso
        );

        $this->dbTableUnidadePeixe->insert($dadosUnidade);
        return;
    }
    public function deleteUnidade($idUnidade){
        
        $this->dbTableUnidadePeixe = new Application_Model_DbTable_UnidadePeixe();
        
        $whereUnidade= $this->dbTableUnidadePeixe->getAdapter()
                ->quoteInto('"tup_id" = ?', $idUnidade);
        
        $this->dbTableUnidadePeixe->delete($whereUnidade);
    }

}

