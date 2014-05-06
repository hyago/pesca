<?php

/** 
 * Model Municipio
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Municipio
{
    public function select()
    {
        $dao = new Application_Model_DbTable_Municipio();
        $select = $dao->select()->from($dao);

        return $dao->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableMunicipio = new Application_Model_DbTable_Municipio();
        $arr = $this->dbTableMunicipio->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableMunicipio = new Application_Model_DbTable_Municipio();
        
        $dadosMunicipio = array(
            'tmun_municipio' => $request['municipio'],
            'tuf_sigla'      => $request['estado']
        );
        
        $this->dbTableMunicipio->insert($dadosMunicipio);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableMunicipio = new Application_Model_DbTable_Municipio();
        
        $dadosMunicipio = array(
            'tmun_municipio' => $request['municipio'],
            'tuf_sigla'      => $request['estado']
        );
        
        $whereMunicipio= $this->dbTableMunicipio->getAdapter()
                ->quoteInto('"tmun_id" = ?', $request['idMunicipio']);
        
        $this->dbTableMunicipio->update($dadosMunicipio, $whereMunicipio);
    }
    
    public function delete($idMunicipio)
    {
        $this->dbTableMunicipio = new Application_Model_DbTable_Municipio();       
                
        $whereMunicipio= $this->dbTableMunicipio->getAdapter()
                ->quoteInto('"tmun_id" = ?', $idMunicipio);
        
        $this->dbTableMunicipio->delete($whereMunicipio);
    }
}
