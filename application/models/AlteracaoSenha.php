<?php

class Application_Model_AlteracaoSenha
{
    public function solicitar($idUsuario, $token)
    {
        date_default_timezone_set('America/Bahia');
        $dados = array(
            "TAS_Token"           => $token,
            "TAS_DataSolicitacao" => date('Y-m-d H:i:s'),
            "TU_ID"               => $idUsuario
        );
        
        $dbTableAlteracaoSenha = new Application_Model_DbTable_AlteracaoSenha();
        return $dbTableAlteracaoSenha->insert($dados);
    }
    
    public function find($token)
    {
        $dao = new Application_Model_DbTable_AlteracaoSenha();
        $arr = $dao->find($token)->toArray();
        return $arr;
    }
    
    public function update($token)
    {
        $dbTableAlteracaoSenha = new Application_Model_DbTable_AlteracaoSenha();
        
        date_default_timezone_set('America/Bahia');
        $dados = array(
            "TAS_DataAlteracao" => date('Y-m-d H:i:s')
        );
        
        $where = $dbTableAlteracaoSenha->getAdapter()->quoteInto('"TAS_Token" = ?', $token);
        return $dbTableAlteracaoSenha->update($dados, $where);
    }
}

