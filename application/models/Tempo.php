<?php

class Application_Model_Tempo
{
    private $dbTableTempo;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableTempo = new Application_Model_DbTable_Tempo();
        $select = $this->dbTableTempo->select()
                ->from($this->dbTableTempo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableTempo->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableTempo = new Application_Model_DbTable_Tempo();
        $arr = $this->dbTableTempo->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableTempo = new Application_Model_DbTable_Tempo();
        
        $dadosTempo = array(
            'TMP_Tempo' => $request['tempo']
        );
        
        $this->dbTableTempo->insert($dadosTempo);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableTempo = new Application_Model_DbTable_Tempo();
        
        $dadosTempo = array(
            'TMP_Tempo' => $request['tempo']
        );
        
        $whereTempo= $this->dbTableTempo->getAdapter()
                ->quoteInto('"TMP_ID" = ?', $request['idTempo']);
        
        $this->dbTableTempo->update($dadosTempo, $whereTempo);
    }
    
    public function delete($idTempo)
    {
        $this->dbTableTempo = new Application_Model_DbTable_Tempo();       
                
        $whereTempo= $this->dbTableTempo->getAdapter()
                ->quoteInto('"TMP_ID" = ?', $idTempo);
        
        $this->dbTableTempo->delete($whereTempo);
    }
    
}

