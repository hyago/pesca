<?php

class Application_Model_Genero
{
    private $dbTableGenero;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableGenero = new Application_Model_DbTable_Genero();
        
        $select = $this->dbTableGenero->select()
                ->from($this->dbTableGenero)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableGenero->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableGenero = new Application_Model_DbTable_Genero();
        $arr = $this->dbTableGenero->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableGenero = new Application_Model_DbTable_Genero();
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();
        
        $dadosGenero = array(
            'GEN_Nome' => $request['nome_genero'],
            'FAM_ID' => $request['select_familia_genero']
        );
        
        $this->dbTableGenero->insert($dadosGenero);
       
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableGenero = new Application_Model_DbTable_Genero();
        
        $dadosGenero = array(
            'GEN_Nome' => $request['nome_genero'],
            'FAM_ID' => $request['select_familia_genero']
        );
        
        
        $whereGenero = $this->dbTableGenero->getAdapter()
                ->quoteInto('"GEN_ID" = ?', $request['idGenero']);
        
        $this->dbTableGenero->update($dadosGenero, $whereGenero);
    }
    
    public function delete($idGenero)
    {
        $this->dbTableGenero = new Application_Model_DbTable_Genero();       
                
        $whereGenero = $this->dbTableGenero->getAdapter()
                ->quoteInto('"GEN_ID" = ?', $idGenero);
        
        $this->dbTableGenero->delete($whereGenero);
    }

}

