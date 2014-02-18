<?php

class Application_Model_PorteEmbarcacao
{
    private $dbTablePorteEmbarcacao;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTablePorteEmbarcacao = new Application_Model_DbTable_PorteEmbarcacao();
        $select = $this->dbTablePorteEmbarcacao->select()
                ->from($this->dbTablePorteEmbarcacao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTablePorteEmbarcacao->fetchAll($select)->toArray();
    }
}

