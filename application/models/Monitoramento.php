<?php

class Application_Model_Monitoramento
{
    private $dbTableMonitoramento;

    public function select($where = null, $order = null, $limit = null)
    {
        $this->dbTableMonitoramento = new Application_Model_DbTable_Monitoramento();
        $select = $this->dbTableMonitoramento->select()
                ->from($this->dbTableMonitoramento)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableMonitoramento->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $this->dbTableMonitoramento = new Application_Model_DbTable_Monitoramento();
        $arr = $this->dbTableMonitoramento->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $this->dbTableMonitoramento = new Application_Model_DbTable_Monitoramento();
        $this->dbTablePorto = new Application_Model_DbTable_Porto();
        $this->dbTableEstagiario = new Application_Model_Usuario();
        $this->dbTableMonitor = new Application_Model_Usuario();
        
        
        $dadosMonitoramento = array(
            
            't_estagiario_tu_id' => $request['select_nome_estagiario'],
            't_monitor_tu_id1' => $request['select_nome_monitor'],
            'fd_data' => $request['data_ficha'], 
            'fd_turno' => $request['select_turno'],
            'obs' => $request['observacao'],
            'pto_id' => $request['select_nome_porto'],
            'tmp_id' => $request['select_tempo'],
            'vnt_id' => $request['select_vento']
        );
        
        $this->dbTableMonitoramento->insert($dadosMonitoramento);
        return;
    }
    
    public function update(array $request)
    {
        $this->dbTableMonitoramento = new Application_Model_DbTable_Monitoramento();
        
        $dadosMonitoramento = array(
            
            't_estagiario_tu_id' => $request['select_nome_estagiario'],
            't_monitor_tu_id1' => $request['select_nome_monitor'],
            'fd_data' => $request['data_ficha'], 
            'fd_turno' => $request['select_turno'],
            'obs' => $request['observacao'],
            'pto_id' => $request['select_nome_porto'],
            'tmp_id' => $request['select_tempo'],
            'vnt_id' => $request['select_vento']
        );
 
        
        $whereMonitoramento = $this->dbTableMonitoramento->getAdapter()
                ->quoteInto('"fd_id" = ?', $request[0]);
        
        
        $this->dbTableMonitoramento->update($dadosMonitoramento, $whereMonitoramento);
    }
    
    public function delete($idMonitoramento)
    {
        $this->dbTableMonitoramento = new Application_Model_DbTable_Monitoramento();       
                
        $whereMonitoramento= $this->dbTableMonitoramento->getAdapter()
                ->quoteInto('"ESP_ID" = ?', $idMonitoramento);
        
        $this->dbTableMonitoramento->delete($whereMonitoramento);
    }

}

