<?php

class Application_Model_EspecieCapturada
{
    private $dbTableEspecieCapturada;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableEspecieCapturada = new Application_Model_DbTable_Especie();
        $select = $this->dbTableEspecieCapturada->select()
                ->from($this->dbTableEspecieCapturada)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEspecie->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();
        $arr = $this->dbTableEspecie->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();
        $this->dbTableGenero = new Application_Model_DbTable_Genero();
        
        $dadosEspecie = array(
            'ESP_Nome' => $request['nome_especie'],
            'ESP_Descritor' => $request['descritor_especie'],
            'ESP_Nome_Comum' => $request['nome_comum'], 
            'GEN_ID' => $request['select_genero_especie']
        );
        
        $this->dbTableEspecie->insert($dadosEspecie);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();
        
        $dadosEspecie = array(
            'ESP_Nome' => $request['nome_especie'],
            'ESP_Descritor' => $request['descritor_especie'],
            'ESP_Nome_Comum' => $request['nome_comum'], 
            'GEN_ID' => $request['select_genero_especie']
        );
 
        
        $whereEspecie= $this->dbTableEspecie->getAdapter()
                ->quoteInto('"ESP_ID" = ?', $request['id_especie']);
        
        
        $this->dbTableEspecie->update($dadosEspecie, $whereEspecie);
    }
    
    public function delete($idEspecie)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();       
                
        $whereEspecie= $this->dbTableEspecie->getAdapter()
                ->quoteInto('"ESP_ID" = ?', $idEspecie);
        
        $this->dbTableEspecie->delete($whereEspecie);
    }


}

