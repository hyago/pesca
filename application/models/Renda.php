<?php

class Application_Model_Renda {

    private $dbTableRenda;

    public function select($where = null, $order = null, $limit = null) {
        $this->dbTableRenda = new Application_Model_DbTable_RendaDbtable();

        $select = $this->dbTableRenda->select()->from($this->dbTableRenda)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->dbTableRenda->fetchAll($select)->toArray();
    }

    public function find($id) {
        $this->dbTableRenda = new Application_Model_DbTable_RendaDbtable();
        $arr = $this->dbTableRenda->find($id)->toArray();
        return $arr[0];
    }

    public function insert(array $request) {
        $this->dbTableRenda = new Application_Model_DbTable_RendaDbtable();
        
        $dadosMin = NULL;
        if ( $request['renFatorMax'] >= '0' ) {
            $dadosMin = $request['renFatorMax'];
        }
        
        $dadosMax = NULL;
        if ( $request['renFatorMax'] >= '0' ) {
            $dadosMax = $request['renFatorMax'];
        }

        $dadosRenda = array(
            'ren_renda' => $request['renRenda'],
            'ren_fatormin' => $dadosMin,
            'ren_fatormax' => $dadosMax
        );

        $this->dbTableRenda->insert($dadosRenda);

        return;
    }

    public function update(array $request) {
        $this->dbTableRenda = new Application_Model_DbTable_RendaDbtable();
        
        $dadosMin = NULL;
        if ( $request['renFatorMax'] >= '0' ) {
            $dadosMin = $request['renFatorMax'];
        }
        
        $dadosMax = NULL;
        if ( $request['renFatorMax'] >= '0' ) {
            $dadosMax = $request['renFatorMax'];
        }

        $dadosRenda = array(
            'ren_renda' => $request['renRenda'],
            'ren_fatormin' => $dadosMin,
            'ren_fatormax' => $dadosMax
        );

        $whereRenda = $this->dbTableRenda->getAdapter()->quoteInto('"ren_id" = ?', $request['idRenda']);

        $this->dbTableRenda->update($dadosRenda, $whereRenda);
    }

    public function delete($idRenda) {
        $this->dbTableRenda = new Application_Model_DbTable_RendaDbtable();

        $whereRenda = $this->dbTableRenda->getAdapter()->quoteInto('"ren_id" = ?', $idRenda);

        $this->dbTableRenda->delete($whereRenda);
    }

}
