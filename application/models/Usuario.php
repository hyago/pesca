<?php

/** 
 * Model Usuario
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Usuario
{
    
    public function select($where = null, $order = null, $limit = null)
    {
        $dao = new Application_Model_DbTable_Usuario();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $dao = new Application_Model_DbTable_VUsuario();
        $arr = $dao->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();
        $dbTableLogin = new Application_Model_DbTable_Login();
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
        
        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
        
        $dadosLogin = array(
            'TL_Login'     => $request['login'],
            'TL_HashSenha' => sha1($request['login'])
        );
        
        $idLogin = $dbTableLogin->insert($dadosLogin);
        
        $dadosUsuario = array(
            'TP_ID'       => $request['perfil'],
            'TE_ID'       => $idEndereco,
            'TL_ID'       => $idLogin,
            'TU_Nome'     => $request['nome'],
            'TU_Sexo'     => $request['sexo'],
            'TU_RG'       => $request['rg'],
            'TU_CPF'      => $request['cpf'],
            'TU_Email'    => $request['email'],
            'TU_Telefone' => $request['telefone']
        );
        
        $dbTableUsuario->insert($dadosUsuario);

        return;
    }
    
    public function update(array $request)
    {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();
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
        
        $dadosUsuario = array(
            'TP_ID'       => $request['perfil'],
            'TU_Nome'     => $request['nome'],
            'TU_Sexo'     => $request['sexo'],
            'TU_RG'       => $request['rg'],
            'TU_CPF'      => $request['cpf'],
            'TU_Email'    => $request['email'],
            'TU_Telefone' => $request['telefone']
        );
        
        $whereUsuario= $dbTableUsuario->getAdapter()->quoteInto('"TU_ID" = ?', $request['idUsuario']);
        $whereEndereco= $dbTableEndereco->getAdapter()->quoteInto('"TE_ID" = ?', $request['idEndereco']);
        
        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }
    
    public function delete($idUsuario)
    {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();        
                
        $dadosUsuario = array(
            'TU_UsuarioDeletado' => TRUE
        );
        
        $whereUsuario= $dbTableUsuario->getAdapter()->quoteInto('"TU_ID" = ?', $idUsuario);
        
        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
    }
}