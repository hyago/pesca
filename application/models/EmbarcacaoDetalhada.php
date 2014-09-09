<?php

class Application_Model_EmbarcacaoDetalhada
{
public function select($where = null, $order = null, $limit = null) {
        $this->dbTableEmbarcacaoDetalhada = new Application_Model_DbTable_EmbarcacaoDetalhada();

        $select = $this->dbTableEmbarcacaoDetalhada->select()->from($this->dbTableEmbarcacaoDetalhada)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->dbTableEmbarcacaoDetalhada->fetchAll($select)->toArray();
    }

    public function find($id) {
        $this->dbTableEmbarcacaoDetalhada = new Application_Model_DbTable_EmbarcacaoDetalhada();
        $arr = $this->dbTableEmbarcacaoDetalhada->find($id)->toArray();
        return $arr[0];
    }

    public function insert(array $request) {
        $this->dbTableEmbarcacaoDetalhada = new Application_Model_DbTable_EmbarcacaoDetalhada();

        $dadosEmbarcacaoDetalhada = array();

        $this->dbTableEmbarcacaoDetalhada->insert($dadosEmbarcacaoDetalhada);

        return;
    }

    public function update(array $request) {
        $this->dbTableEmbarcacaoDetalhada = new Application_Model_DbTable_EmbarcacaoDetalhada();

        $dadosEmbarcacaoDetalhada = array();

        $whereEmbarcacaoDetalhada = $this->dbTableEmbarcacaoDetalhada->getAdapter()->quoteInto('"ted_id" = ?', $request['ted_id']);

        $this->dbTableEmbarcacaoDetalhada->update($dadosEmbarcacaoDetalhada, $whereEmbarcacaoDetalhada);
    }

    public function delete($input_id) {
        $this->dbTableEmbarcacaoDetalhada = new Application_Model_DbTable_EmbarcacaoDetalhada();

        $whereEmbarcacaoDetalhada = $this->dbTableEmbarcacaoDetalhada->getAdapter()->quoteInto('"ted_id" = ?', $input_id);

        $this->dbTableEmbarcacaoDetalhada->delete($whereEmbarcacaoDetalhada);
    }

}

