<?php

class Application_Model_Familia
{
    private $dbTableFamilia;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();
        
        $select = $this->dbTableFamilia->select()
                ->from($this->dbTableFamilia)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableFamilia->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();
        $arr = $this->dbTableFamilia->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableOrdem= new Application_Model_DbTable_Ordem();
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();
        
        $dadosFamilia = array(
            'FAM_Nome' => $request['nome_familia'],
            'FAM_Ordem_Filogenetica' => $request['ordem_filogenetica'],
            'FAM_Tipo' => $request['tipo_familia'],
            'FAM_Caracteristica' => $request['caracteristica_familia'],
            'ORD_ID' => $request['select_ordem_familia']
        );
        
        $this->dbTableFamilia->insert($dadosFamilia);
      
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableOrdem = new Application_Model_DbTable_Ordem();
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();

        $dadosFamilia = array(
            'FAM_Nome' => $request['nome_familia'],
            'FAM_Ordem_Filogenetica' => $request['ordem_filogenetica'],
            'FAM_Tipo' => $request['tipo_familia'],
            'FAM_Caracteristica' => $request['caracteristica_familia'],
            'ORD_ID' => $request['select_ordem_familia']
        );
        
        $whereFamilia = $this->dbTableFamilia->getAdapter()
                ->quoteInto('"FAM_ID" = ?', $request['id_familia']);
        
        $this->dbTableFamilia->update($dadosFamilia, $whereFamilia);
    }
    
    public function delete($idFamilia)
    {
        $this->dbTableFamilia = new Application_Model_DbTable_Familia();       
                
        $whereFamilia = $this->dbTableFamilia->getAdapter()
                ->quoteInto('"FAM_ID" = ?', $idFamilia);
        
        $this->dbTableFamilia->delete($whereFamilia);
    }

}

