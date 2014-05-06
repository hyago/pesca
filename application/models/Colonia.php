<?php

/** 
 * Model Colonia
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Colonia
{
    private $dbTableColonia;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableColonia = new Application_Model_DbTable_VColonia();
        $select = $this->dbTableColonia->select()
                ->from($this->dbTableColonia)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColonia->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableColonia = new Application_Model_DbTable_VColonia();
        $arr = $this->dbTableColonia->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableColonia = new Application_Model_DbTable_Colonia();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        
        $dadosEndereco = array(
            'te_logradouro'  => $request['logradouro'],
            'te_numero'      => $request['numero'],
            'te_bairro'      => $request['bairro'],
            'te_cep'         => $request['cep'],
            'te_comp'        => $request['complemento'],
            'tmun_id'        => $request['municipio']
        );
        
        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
        
        $dadosColonia = array(
            'tc_nome'           => $request['nome'],
            'tcom_id'           => $request['comunidade'],
            'tc_especificidade' => $request['nome'],
            'te_id'             => $idEndereco
        );
        
        $this->dbTableColonia->insert($dadosColonia);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableColonia = new Application_Model_DbTable_Colonia();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        
        $dadosEndereco = array(
            'te_logradouro'  => $request['logradouro'],
            'te_numero'      => $request['numero'],
            'te_bairro'      => $request['bairro'],
            'te_cidade'      => $request['cidade'],
            'te_estado'      => $request['estado'],
            'te_cep'         => $request['cep'],
            'te_complemento' => $request['complemento']
        );
        
        $dadosColonia = array(
            'tc_nome' => $request['nome']
        );
        
        $whereColonia= $this->dbTableColonia->getAdapter()
                ->quoteInto('"tc_id" = ?', $request['idColonia']);
        $whereEndereco= $dbTableEndereco->getAdapter()
                ->quoteInto('"te_id" = ?', $request['idEndereco']);
        
        $this->dbTableColonia->update($dadosColonia, $whereColonia);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }
    
    public function delete($idColonia)
    {
        $this->dbTableColonia = new Application_Model_DbTable_Colonia();       
                
        $whereColonia= $this->dbTableColonia->getAdapter()
                ->quoteInto('"tc_id" = ?', $idColonia);
        
        $this->dbTableColonia->delete($whereColonia);
    }
    public function selectWithEndereco()
    {
        $this->dbTableColonia = new Application_Model_DbTable_VColoniaByEndereco();
        $select = $this->dbTableColonia->select();


        return $this->dbTableColonia->fetchAll($select)->toArray();
    }

}