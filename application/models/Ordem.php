<?php

class Application_Model_Ordem
{
    private $dbTableOrdem;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();
        
        $select = $this->dbTableOrdem->select()
                ->from($this->dbTableOrdem)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableOrdem->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();
        $arr = $this->dbTableOrdem->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableGrupo = new Application_Model_DbTable_Grupo();
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();
        
        $dadosOrdem = array(
            'ORD_Nome' => $request['nome_ordem'],
            'ORD_Caracteristica' => $request['caracteristica_ordem'],
            'GRP_ID' => $request['select_grupo_ordem']
        );
        
        $this->dbTableOrdem->insert($dadosOrdem);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableGrupo = new Application_Model_DbTable_Grupo();
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();

        
        $dadosOrdem = array(
            'ORD_Nome' => $request['nome_ordem'],
            'ORD_Caracteristica' => $request['caracteristica_ordem'],
            'GRP_ID' => $request['select_grupo_ordem']
        );
        $dadosGrupo = array(
            'GRP_Nome' => $request['nome_grupo']
        );
        
        $whereOrdem = $this->dbTableOrdem->getAdapter()
                ->quoteInto('"ORD_ID" = ?', $request['id_ordem']);

        
        $this->dbTableOrdem->update($dadosOrdem, $whereOrdem);
        $this->dbTableGrupo->update($dadosGrupo, $whereGrupo);
    }
    
    public function delete($idOrdem)
    {
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();       
                
        $whereOrdem = $this->dbTableOrdem->getAdapter()
                ->quoteInto('"ORD_ID" = ?', $idOrdem);
        
        $this->dbTableOrdem->delete($whereOrdem);
    }

}

