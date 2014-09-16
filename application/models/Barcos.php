<?php
/** 
 * Model Barcos
 * 
 * @package Pesca
 * @subpackage Models
 * @author Stefano Azevedo Silva <stefanouesc@gmail.com>
 * @author Marcelo Ossamu Honda <mohonda@uesc.com>
 * @version 1.0
 * @access public
 *
 */

class Application_Model_Barcos
{
private $dbTableBarcos;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableBarcos = new Application_Model_DbTable_Barcos();
        $select = $this->dbTableBarcos->select()
                ->from($this->dbTableBarcos)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableBarcos->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableBarcos = new Application_Model_DbTable_Barcos();
        $arr = $this->dbTableBarcos->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableBarcos = new Application_Model_DbTable_Barcos();
        
        $dadosBarcos = array(
            'bar_nome' => $request['tbar_nome']
        );
        
        $this->dbTableBarcos->insert($dadosBarcos);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableBarcos = new Application_Model_DbTable_Barcos();
        
        $dadosBarcos = array(
            'bar_nome' => $request['tbar_nome']
        );
        
        $whereBarcos= $this->dbTableBarcos->getAdapter()
                ->quoteInto('"bar_id" = ?', $request['tbar_id']);
        
        $this->dbTableBarcos->update($dadosBarcos, $whereBarcos);
    }
    
    public function delete($idBarcos)
    {
        $this->dbTableBarcos = new Application_Model_DbTable_Barcos();       
                
        $whereBarcos= $this->dbTableBarcos->getAdapter()
                ->quoteInto('"bar_id" = ?', $idBarcos);
        
        $this->dbTableBarcos->delete($whereBarcos);
    }

}

