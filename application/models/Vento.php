<?php

class Application_Model_Vento
{
    private $dbTableVento;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableVento = new Application_Model_DbTable_Vento();
        $select = $this->dbTableVento->select()
                ->from($this->dbTableVento)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableVento->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableVento = new Application_Model_DbTable_Vento();
        $arr = $this->dbTableVento->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableVento = new Application_Model_DbTable_Vento();
        
        $dadosVento = array(
            'VNT_Forca' => $request['vento']
        );
        
        $this->dbTableVento->insert($dadosVento);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableVento = new Application_Model_DbTable_Vento();
        
        $dadosVento = array(
            'VNT_Forca' => $request['vento']
        );
        
        $whereVento= $this->dbTableVento->getAdapter()
                ->quoteInto('"VNT_ID" = ?', $request['idVento']);
        
        $this->dbTableVento->update($dadosVento, $whereVento);
    }
    
    public function delete($idVento)
    {
        $this->dbTableVento = new Application_Model_DbTable_Vento();       
                
        $whereVento= $this->dbTableVento->getAdapter()
                ->quoteInto('"VNT_ID" = ?', $idVento);
        
        $this->dbTableVento->delete($whereVento);
    }
    
}