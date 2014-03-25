<?php

class Application_Model_Porto
{
    private $dbTablePorto;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $select = $this->dbTablePorto->select()
                ->from($this->dbTablePorto)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTablePorto->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $arr = $this->dbTablePorto->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        
        $dadosPorto = array(
            'PTO_Nome'  => $request['nome'],
            'TMun_ID'   => $request['municipo']
        );
        
        $this->dbTablePorto->insert($dadosPorto);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        
        $dadosPorto = array(
            'PTO_Nome'  => $request['nome'],
            'TMun_ID'   => $request['municipo']
        );
        
        $wherePorto= $this->dbTablePorto->getAdapter()
                ->quoteInto('"PTO_ID" = ?', $request['idPorto']);
        
        $this->dbTablePorto->update($dadosPorto, $wherePorto);
    }
    
    public function delete($idPorto)
    {
        $this->dbTablePorto = new Application_Model_DbTable_Porto();       
                
        $wherePorto= $this->dbTablePorto->getAdapter()
                ->quoteInto('"PTO_ID" = ?', $idPorto);
        
        $this->dbTablePorto->delete($wherePorto);
    }
    
}