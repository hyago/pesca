<?php

class Application_Model_Relatorios
{
    //ARRASTO DE FUNDO ////////////////////////////////////////////////////////////////////
    public function selectEntrevistaArrasto($where = null, $order = null, $limit = null)
    {
        
        $this->dbTableArrastoFundo= new Application_Model_DbTable_VRelatorioArrastoFundo();
        $select = $this->dbTableArrastoFundo->select()
                ->from($this->dbTableArrastoFundo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoFundo->fetchAll($select)->toArray();
    }
    public function selectArrastoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelArrastoFundo = new Application_Model_ArrastoFundo();
        
        $arrasto = $this->modelArrastoFundo->selectArrastoHasPesqueiro($where, $order, $limit);
        
        return $arrasto;
    }
     
    public function selectArrastoHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelArrastoFundo = new Application_Model_ArrastoFundo();
        
        $arrasto = $this->modelArrastoFundo->selectArrastoHasEspCapturadas($where, $order, $limit);
        
        return $arrasto;
    }

    
    ///////////////////////////////////////////////////////////////////////////////////////
    
    //CALÃO////////////////////////////////////////////////////////////////////////////////
    public function selectEntrevistaCalao($where = null, $order = null, $limit = null)
    {
        $this->dbTableCalao = new Application_Model_DbTable_VRelatorioCalao();
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    
    public function selectCalaoHasPesqueiro($where = null, $order = null, $limit = null)
    {
       $this->modelCalao = new Application_Model_Calao();
        
        $calao = $this->modelCalao->selectCalaoHasPesqueiro($where, $order, $limit);
        
        return $calao;
    }
    public function selectCalaoHasEspCapturadas($where = null, $order = null, $limit = null){
        
        $this->modelCalao = new Application_Model_Calao();
        
        $calao = $this->modelCalao->selectCalaoHasEspCapturadas($where, $order, $limit);
        
        return $calao;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    //COLETA MANUAL//////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaColetaManual($where = null, $order = null, $limit = null)
    {
        $this->dbTableColetaManual = new Application_Model_DbTable_VRelatorioColetaManual();
        $select = $this->dbTableColetaManual->select()
                ->from($this->dbTableColetaManual)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColetaManual->fetchAll($select)->toArray();
    }    
    public function selectColetaManualHasEspCapturadas($where = null, $order = null, $limit = null)
    {
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $coleta = $this->modelColetaManual->selectColetaManualHasEspCapturadas($where, $order, $limit);
        
        return $coleta;
    }
        public function selectColetaManualHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $coleta = $this->modelColetaManual->selectColetaManualHasPesqueiro($where, $order, $limit);
        
        return $coleta;
    }
    //////////////////////////////////////////////////////////////////////////////////////
    
    
    ///EMALHE//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaEmalhe($where = null, $order = null, $limit = null)
    {
        $this->dbTableEmalhe = new Application_Model_DbTable_VRelatorioEmalhe();
        $select = $this->dbTableEmalhe->select()
                ->from($this->dbTableEmalhe)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEmalhe->fetchAll($select)->toArray();
    }
    public function selectEmalheHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelEmalhe = new Application_Model_Emalhe();
        
        $emalhe = $this->modelEmalhe->selectEmalheHasEspCapturadas($where, $order, $limit);
        
        return $emalhe;
    }
    public function selectEmalheHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelEmalhe = new Application_Model_Emalhe();
        
        $emalhe = $this->modelEmalhe->selectEmalheHasPesqueiro($where, $order, $limit);
        
        return $emalhe;
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    
    ///Grosseira//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaGrosseira($where = null, $order = null, $limit = null)
    {
        $this->dbTableGrosseira = new Application_Model_DbTable_VRelatorioGrosseira();
        $select = $this->dbTableGrosseira->select()
                ->from($this->dbTableGrosseira)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableGrosseira->fetchAll($select)->toArray();
    }
    public function selectGrosseiraHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelGrosseira = new Application_Model_Grosseira();
        
        $Grosseira = $this->modelGrosseira->selectGrosseiraHasEspCapturadas($where, $order, $limit);
        
        return $Grosseira;
    }
    public function selectGrosseiraHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelGrosseira = new Application_Model_Grosseira();
        
        $Grosseira = $this->modelGrosseira->selectGrosseiraHasPesqueiro($where, $order, $limit);
        
        return $Grosseira;
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    
    ///Jerere//////////////////////////////////////////////////////////////////////////////
    public function selectEntrevistaJerere($where = null, $order = null, $limit = null)
    {
        $this->dbTableJerere = new Application_Model_DbTable_VRelatorioJerere();
        $select = $this->dbTableJerere->select()
                ->from($this->dbTableJerere)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableJerere->fetchAll($select)->toArray();
    }    
    public function selectJerereHasEspCapturadas($where = null, $order = null, $limit = null)
    {
        $this->modelJerere = new Application_Model_Jerere();
        
        $coleta = $this->modelJerere->selectJerereHasEspCapturadas($where, $order, $limit);
        
        return $coleta;
    }
        public function selectJerereHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelJerere = new Application_Model_Jerere();
        
        $coleta = $this->modelJerere->selectJerereHasPesqueiro($where, $order, $limit);
        
        return $coleta;
    }
    //////////////////////////////////////////////////////////////////////////////////////
    
    ///Linha//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaLinha($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinha = new Application_Model_DbTable_VRelatorioLinha();
        $select = $this->dbTableLinha->select()
                ->from($this->dbTableLinha)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinha->fetchAll($select)->toArray();
    }
    public function selectLinhaHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelLinha = new Application_Model_Linha();
        
        $Linha = $this->modelLinha->selectLinhaHasEspCapturadas($where, $order, $limit);
        
        return $Linha;
    }
    public function selectLinhaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelLinha = new Application_Model_Linha();
        
        $Linha = $this->modelLinha->selectLinhaHasPesqueiro($where, $order, $limit);
        
        return $Linha;
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    
    ///LinhaFundo//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaLinhaFundo($where = null, $order = null, $limit = null)
    {
        $this->dbTableLinhaFundo = new Application_Model_DbTable_VRelatorioLinhaFundo();
        $select = $this->dbTableLinhaFundo->select()
                ->from($this->dbTableLinhaFundo)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableLinhaFundo->fetchAll($select)->toArray();
    }
    public function selectLinhaFundoHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelLinhaFundo = new Application_Model_LinhaFundo();
        
        $LinhaFundo = $this->modelLinhaFundo->selectLinhaFundoHasEspCapturadas($where, $order, $limit);
        
        return $LinhaFundo;
    }
    public function selectLinhaFundoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelLinhaFundo = new Application_Model_LinhaFundo();
        
        $LinhaFundo = $this->modelLinhaFundo->selectLinhaFundoHasPesqueiro($where, $order, $limit);
        
        return $LinhaFundo;
    }
    /////////////////////////////////////////////////////////////////////////////////////////////
    
    ///Manzua//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaManzua($where = null, $order = null, $limit = null)
    {
        $this->dbTableManzua = new Application_Model_DbTable_VRelatorioManzua();
        $select = $this->dbTableManzua->select()
                ->from($this->dbTableManzua)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableManzua->fetchAll($select)->toArray();
    }
    public function selectManzuaHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelManzua = new Application_Model_Manzua();
        
        $Manzua = $this->modelManzua->selectManzuaHasEspCapturadas($where, $order, $limit);
        
        return $Manzua;
    }
    public function selectManzuaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelManzua = new Application_Model_Manzua();
        
        $Manzua = $this->modelManzua->selectManzuaHasPesqueiro($where, $order, $limit);
        
        return $Manzua;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
    ///Mergulho//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaMergulho($where = null, $order = null, $limit = null)
    {
        $this->dbTableMergulho = new Application_Model_DbTable_VRelatorioMergulho();
        $select = $this->dbTableMergulho->select()
                ->from($this->dbTableMergulho)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableMergulho->fetchAll($select)->toArray();
    }
    public function selectMergulhoHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelMergulho = new Application_Model_Mergulho();
        
        $Mergulho = $this->modelMergulho->selectMergulhoHasEspCapturadas($where, $order, $limit);
        
        return $Mergulho;
    }
    public function selectMergulhoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelMergulho = new Application_Model_Mergulho();
        
        $Mergulho = $this->modelMergulho->selectMergulhoHasPesqueiro($where, $order, $limit);
        
        return $Mergulho;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
    ///Ratoeira//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaRatoeira($where = null, $order = null, $limit = null)
    {
        $this->dbTableRatoeira = new Application_Model_DbTable_VRelatorioRatoeira();
        $select = $this->dbTableRatoeira->select()
                ->from($this->dbTableRatoeira)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableRatoeira->fetchAll($select)->toArray();
    }
    public function selectRatoeiraHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelRatoeira = new Application_Model_Ratoeira();
        
        $Ratoeira = $this->modelRatoeira->selectRatoeiraHasEspCapturadas($where, $order, $limit);
        
        return $Ratoeira;
    }
    public function selectRatoeiraHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelRatoeira = new Application_Model_Ratoeira();
        
        $Ratoeira = $this->modelRatoeira->selectRatoeiraHasPesqueiro($where, $order, $limit);
        
        return $Ratoeira;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
    ///Siripoia//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaSiripoia($where = null, $order = null, $limit = null)
    {
        $this->dbTableSiripoia = new Application_Model_DbTable_VRelatorioSiripoia();
        $select = $this->dbTableSiripoia->select()
                ->from($this->dbTableSiripoia)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableSiripoia->fetchAll($select)->toArray();
    }
    public function selectSiripoiaHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelSiripoia = new Application_Model_Siripoia();
        
        $Siripoia = $this->modelSiripoia->selectSiripoiaHasEspCapturadas($where, $order, $limit);
        
        return $Siripoia;
    }
    public function selectSiripoiaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelSiripoia = new Application_Model_Siripoia();
        
        $Siripoia = $this->modelSiripoia->selectSiripoiaHasPesqueiro($where, $order, $limit);
        
        return $Siripoia;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
    ///Tarrafa//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaTarrafa($where = null, $order = null, $limit = null)
    {
        $this->dbTableTarrafa = new Application_Model_DbTable_VRelatorioTarrafa();
        $select = $this->dbTableTarrafa->select()
                ->from($this->dbTableTarrafa)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableTarrafa->fetchAll($select)->toArray();
    }
    public function selectTarrafaHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelTarrafa = new Application_Model_Tarrafa();
        
        $Tarrafa = $this->modelTarrafa->selectTarrafaHasEspCapturadas($where, $order, $limit);
        
        return $Tarrafa;
    }
    public function selectTarrafaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelTarrafa = new Application_Model_Tarrafa();
        
        $Tarrafa = $this->modelTarrafa->selectTarrafaHasPesqueiro($where, $order, $limit);
        
        return $Tarrafa;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
    ///VaraPesca//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaVaraPesca($where = null, $order = null, $limit = null)
    {
        $this->dbTableVaraPesca = new Application_Model_DbTable_VRelatorioVaraPesca();
        $select = $this->dbTableVaraPesca->select()
                ->from($this->dbTableVaraPesca)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableVaraPesca->fetchAll($select)->toArray();
    }
    public function selectVaraPescaHasEspCapturadas($where = null, $order = null, $limit = null){
         $this->modelVaraPesca = new Application_Model_VaraPesca();
        
        $VaraPesca = $this->modelVaraPesca->selectVaraPescaHasEspCapturadas($where, $order, $limit);
        
        return $VaraPesca;
    }
    public function selectVaraPescaHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelVaraPesca = new Application_Model_VaraPesca();
        
        $VaraPesca = $this->modelVaraPesca->selectVaraPescaHasPesqueiro($where, $order, $limit);
        
        return $VaraPesca;
    }
/////////////////////////////////////////////////////////////////////////////////////////////
    
   //Entrevistas Monitoradas////////////////////////////////////////////////////////////////
   
    
    
   /////////////////////////////////////////////////////////////////////////////////////////////
}
