<?php

class Application_Model_UnidadeCamarao
{
private $dbTableUnidadeCamarao;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_VUnidadeCamarao();
        $select = $this->dbTableUnidadeCamarao->select()
                ->from($this->dbTableUnidadeCamarao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableUnidadeCamarao->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_VUnidadeCamarao();
        $arr = $this->dbTableUnidadeCamarao->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_UnidadeCamarao();
        
        $dadosUnidadeCamarao = array(
            'tareap_areapesca' => $request['areaPesca']
        );
        
        $this->dbTableUnidadeCamarao->insert($dadosUnidadeCamarao);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_UnidadeCamarao();
        
        $dadosUnidadeCamarao = array(
            'tareap_areapesca' => $request['areaPesca']
        );
        
        $whereUnidadeCamarao= $this->dbTableUnidadeCamarao->getAdapter()
                ->quoteInto('"tareap_id" = ?', $request['idUnidadeCamarao']);
        
        $this->dbTableUnidadeCamarao->update($dadosUnidadeCamarao, $whereUnidadeCamarao);
    }
    
    public function delete($idUnidadeCamarao)
    {
        $this->dbTableUnidadeCamarao = new Application_Model_DbTable_UnidadeCamarao();       
                
        $whereUnidadeCamarao= $this->dbTableUnidadeCamarao->getAdapter()
                ->quoteInto('"tareap_id" = ?', $idUnidadeCamarao);
        
        $this->dbTableUnidadeCamarao->delete($whereUnidadeCamarao);
    }
    
}



