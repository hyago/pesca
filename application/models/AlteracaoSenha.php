<?php

class Application_Model_AlteracaoSenha
{
    public function select($email)
    {
        $dao = new Application_Model_DbTable_Usuario();
        $select = $dao->select()->from($dao);
        $select->where($where);

        return $dao->fetchAll($select)->toArray();
    }
}

