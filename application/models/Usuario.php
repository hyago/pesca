<?php

/** 
 * Model de usuários
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
            'logradouro'  => $request['logradouro'],
            'numero'      => $request['numero'],
            'bairro'      => $request['bairro'],
            'cidade'      => $request['cidade'],
            'estado'      => $request['estado'],
            'cep'         => $request['cep'],
            'complemento' => $request['complemento']
        );
        
        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
        
        $dadosUsuario = array(
            'Perfil_idPerfil'     => $request['perfil'],
            'Endereco_idEndereco' => $idEndereco,
            'nome'                => $request['nome'],
            'sexo'                => $request['sexo'],
            'rg'                  => $request['rg'],
            'cpf'                 => $request['cpf'],
            'email'               => $request['email'],
            'telefone'            => $request['telefone']
        );
        
        $idUsuario = $dbTableUsuario->insert($dadosUsuario);
        
        $dadosLogin = array(
            'login'             => $request['login'],
            'Usuario_idUsuario' => $idUsuario,
            'hashSenha'         => sha1($request['login'])
        );
        
        $dbTableLogin->insert($dadosLogin);

        return;
    }
    
    public function update(array $request)
    {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        
        $dadosEndereco = array(
            'logradouro'  => $request['logradouro'],
            'numero'      => $request['numero'],
            'bairro'      => $request['bairro'],
            'cidade'      => $request['cidade'],
            'estado'      => $request['estado'],
            'cep'         => $request['cep'],
            'complemento' => $request['complemento']
        );
        
        $dadosUsuario = array(
            'Perfil_idPerfil'     => $request['perfil'],
            'nome'                => $request['nome'],
            'sexo'                => $request['sexo'],
            'rg'                  => $request['rg'],
            'cpf'                 => $request['cpf'],
            'email'               => $request['email'],
            'telefone'            => $request['telefone']
        );
        
        $whereUsuario= $dbTableUsuario->getAdapter()->quoteInto('"idUsuario" = ?', $request['idUsuario']);
        $whereEndereco= $dbTableEndereco->getAdapter()->quoteInto('"idEndereco" = ?', $request['idEndereco']);
        
        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }
    
    public function delete($idUsuario)
    {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();        
                
        $dadosUsuario = array(
            'usuarioDeletado' => TRUE
        );
        
        $whereUsuario= $dbTableUsuario->getAdapter()->quoteInto('"idUsuario" = ?', $idUsuario);
        
        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
    }   
}