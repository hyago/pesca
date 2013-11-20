<?php

/** 
 * Model Arte de Pesca
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_ArtePesca
{
    private $dbTableArtePesca;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableArtePesca = new Application_Model_DbTable_ArtePesca();
        $select = $this->dbTableArtePesca->select()
                ->from($this->dbTableArtePesca)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArtePesca->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableArtePesca = new Application_Model_DbTable_ArtePesca();
        $arr = $this->dbTableArtePesca->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableArtePesca = new Application_Model_DbTable_ArtePesca();
        
        $dadosArtePesca = array(
            'TAP_ArtePesca' => $request['artePesca']
        );
        
        $this->dbTableArtePesca->insert($dadosArtePesca);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableArtePesca = new Application_Model_DbTable_ArtePesca();
        
        $dadosArtePesca = array(
            'TAP_ArtePesca' => $request['artePesca']
        );
        
        $whereArtePesca= $this->dbTableArtePesca->getAdapter()
                ->quoteInto('"TAP_ID" = ?', $request['idArtePesca']);
        
        $this->dbTableArtePesca->update($dadosArtePesca, $whereArtePesca);
    }
    
    public function delete($idArtePesca)
    {
        $this->dbTableArtePesca = new Application_Model_DbTable_ArtePesca();       
                
        $whereArtePesca= $this->dbTableArtePesca->getAdapter()
                ->quoteInto('"TAP_ID" = ?', $idArtePesca);
        
        $this->dbTableArtePesca->delete($whereArtePesca);
    }
    
}