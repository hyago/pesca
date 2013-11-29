<?php

/** 
 * Model Comunidade
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Comunidade
{
    private $dbTableComunidade;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableComunidade = new Application_Model_DbTable_Comunidade();
        $select = $this->dbTableComunidade->select()
                ->from($this->dbTableComunidade)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableComunidade->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableComunidade = new Application_Model_DbTable_Comunidade();
        $arr = $this->dbTableComunidade->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableComunidade = new Application_Model_DbTable_Comunidade();
        
        $dadosComunidade = array(
            'TCOM_Nome' => $request['nome']
        );
        
        $this->dbTableComunidade->insert($dadosComunidade);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableComunidade = new Application_Model_DbTable_Comunidade();
        
        $dadosComunidade = array(
            'TCOM_Nome' => $request['nome']
        );
        
        $whereComunidade= $this->dbTableComunidade->getAdapter()
                ->quoteInto('"TCOM_ID" = ?', $request['idComunidade']);
        
        $this->dbTableComunidade->update($dadosComunidade, $whereComunidade);
    }
    
    public function delete($idComunidade)
    {
        $this->dbTableComunidade = new Application_Model_DbTable_Comunidade();       
                
        $whereComunidade= $this->dbTableComunidade->getAdapter()
                ->quoteInto('"TCOM_ID" = ?', $idComunidade);
        
        $this->dbTableComunidade->delete($whereComunidade);
    }

}