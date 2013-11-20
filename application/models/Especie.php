<?php

/** 
 * Model Especie
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Especie
{
    private $dbTableEspecie;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();
        $select = $this->dbTableEspecie->select()
                ->from($this->dbTableEspecie)->order($order)->limit($limit);

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
        
        $dadosEspecie = array(
            'TEC_Especie' => $request['especie']
        );
        
        $this->dbTableEspecie->insert($dadosEspecie);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();
        
        $dadosEspecie = array(
            'TEC_Especie' => $request['especie']
        );
        
        $whereEspecie= $this->dbTableEspecie->getAdapter()
                ->quoteInto('"TEC_ID" = ?', $request['idEspecie']);
        
        $this->dbTableEspecie->update($dadosEspecie, $whereEspecie);
    }
    
    public function delete($idEspecie)
    {
        $this->dbTableEspecie = new Application_Model_DbTable_Especie();       
                
        $whereEspecie= $this->dbTableEspecie->getAdapter()
                ->quoteInto('"TEC_ID" = ?', $idEspecie);
        
        $this->dbTableEspecie->delete($whereEspecie);
    }

}

