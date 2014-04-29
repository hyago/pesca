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
            'TE_Logradouro'  => $request['logradouro'],
            'TE_Numero'      => $request['numero'],
            'TE_Bairro'      => $request['bairro'],
            'TE_CEP'         => $request['cep'],
            'TE_Comp'        => $request['complemento'],
            'TMun_ID'        => $request['municipio']
        );
        
        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
        
        $dadosColonia = array(
            'TC_Nome'           => $request['nome'],
            'TCOM_ID'           => $request['comunidade'],
            'TC_Especificidade' => $request['nome'],
            'TE_ID'             => $idEndereco
        );
        
        $this->dbTableColonia->insert($dadosColonia);

        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableColonia = new Application_Model_DbTable_Colonia();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        
        $dadosEndereco = array(
            'TE_Logradouro'  => $request['logradouro'],
            'TE_Numero'      => $request['numero'],
            'TE_Bairro'      => $request['bairro'],
            'TE_Cidade'      => $request['cidade'],
            'TE_Estado'      => $request['estado'],
            'TE_CEP'         => $request['cep'],
            'TE_Complemento' => $request['complemento']
        );
        
        $dadosColonia = array(
            'TC_Nome' => $request['nome']
        );
        
        $whereColonia= $this->dbTableColonia->getAdapter()
                ->quoteInto('"TC_ID" = ?', $request['idColonia']);
        $whereEndereco= $dbTableEndereco->getAdapter()
                ->quoteInto('"TE_ID" = ?', $request['idEndereco']);
        
        $this->dbTableColonia->update($dadosColonia, $whereColonia);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }
    
    public function delete($idColonia)
    {
        $this->dbTableColonia = new Application_Model_DbTable_Colonia();       
                
        $whereColonia= $this->dbTableColonia->getAdapter()
                ->quoteInto('"TC_ID" = ?', $idColonia);
        
        $this->dbTableColonia->delete($whereColonia);
    }
    public function selectWithEndereco()
    {
        $this->dbTableColonia = new Application_Model_DbTable_VColoniaByEndereco();
        $select = $this->dbTableColonia->select();


        return $this->dbTableColonia->fetchAll($select)->toArray();
    }

}