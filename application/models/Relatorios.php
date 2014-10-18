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
    public function selectArrasto($where = null, $order = null, $limit = null){
        
        $this->modelArrastoFundo = new Application_Model_ArrastoFundo();
        
        $arrasto = $this->modelArrastoFundo->selectEntrevistaArrasto($where, $order, $limit);
        
        return $arrasto;
    }
    
    public function selectArrastoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelArrastoFundo = new Application_Model_ArrastoFundo();
        
        $arrasto = $this->modelArrastoFundo->selectArrastoHasPesqueiro($where, $order, $limit);
        
        return $arrasto;
    }
    public function countPesqueirosArrasto()
    {
        $this->dbTableArrastoHasPesqueiro = new Application_Model_DbTable_VArrastoFundoHasPesqueiro();
        $select = $this->dbTableArrastoHasPesqueiro->select()
                ->from('v_arrasto_has_t_pesqueiro','count(af_paf_id)')->
                group('af_id')->
                order('count(af_paf_id) DESC')->limit('1');

        return $this->dbTableArrastoHasPesqueiro->fetchAll($select)->toArray();
    } 
    public function selectNomeEspecies($where = null, $order = null, $limit = null){
        $this->dbTableArrastoHasEspCapturada = new Application_Model_DbTable_VArrastoFundoHasEspecieCapturada();

        $select = $this->dbTableArrastoHasEspCapturada->select()
                ->from($this->dbTableArrastoHasEspCapturada,'esp_nome_comum')->distinct(true)->
                order('esp_nome_comum')->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableArrastoHasEspCapturada->fetchAll($select)->toArray();
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
        
        $this->dbTableCalao= new Application_Model_DbTable_VRelatorioCalao();
        $select = $this->dbTableCalao->select()
                ->from($this->dbTableCalao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalao->fetchAll($select)->toArray();
    }
    public function selectCalao($where = null, $order = null, $limit = null){
        
        $this->modelCalao = new Application_Model_Calao();
        
        $Calao = $this->modelCalao->selectEntrevistaCalao($where, $order, $limit);
        
        return $Calao;
    }
    
    public function selectCalaoHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelCalao = new Application_Model_Calao();
        
        $Calao = $this->modelCalao->selectCalaoHasPesqueiro($where, $order, $limit);
        
        return $Calao;
    }
    public function countPesqueirosCalao()
    {
        $this->dbTableCalaoHasPesqueiro = new Application_Model_DbTable_VCalaoHasPesqueiro();
        $select = $this->dbTableCalaoHasPesqueiro->select()
                ->from('v_calao_has_t_pesqueiro','count(cal_paf_id)')->
                group('cal_id')->
                order('count(cal_paf_id) DESC')->limit('1');

        return $this->dbTableCalaoHasPesqueiro->fetchAll($select)->toArray();
    } 
    public function selectNomeEspeciesCalao($where = null, $order = null, $limit = null){
        $this->dbTableCalaoHasEspCapturada = new Application_Model_DbTable_VCalaoHasEspecieCapturada();

        $select = $this->dbTableCalaoHasEspCapturada->select()
                ->from($this->dbTableCalaoHasEspCapturada,'esp_nome_comum')->distinct(true)->
                order('esp_nome_comum')->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableCalaoHasEspCapturada->fetchAll($select)->toArray();
    }
    public function selectCalaoHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelCalao = new Application_Model_Calao();
        
        $Calao = $this->modelCalao->selectCalaoHasEspCapturadas($where, $order, $limit);
        
        return $Calao;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    //COLETA MANUAL//////////////////////////////////////////////////////////////////////
    
   public function selectEntrevistaColetaManual($where = null, $order = null, $limit = null)
    {
        
        $this->dbTableColetaManual= new Application_Model_DbTable_VRelatorioColetaManual();
        $select = $this->dbTableColetaManual->select()
                ->from($this->dbTableColetaManual)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColetaManual->fetchAll($select)->toArray();
    }
    public function selectColetaManual($where = null, $order = null, $limit = null){
        
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $ColetaManual = $this->modelColetaManual->selectEntrevistaColetaManual($where, $order, $limit);
        
        return $ColetaManual;
    }
    
    public function selectColetaManualHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $ColetaManual = $this->modelColetaManual->selectColetaManualHasPesqueiro($where, $order, $limit);
        
        return $ColetaManual;
    }
    public function countPesqueirosColetaManual()
    {
        $this->dbTableColetaManualHasPesqueiro = new Application_Model_DbTable_VColetaManualHasPesqueiro();
        $select = $this->dbTableColetaManualHasPesqueiro->select()
                ->from('v_coletamanual_has_t_pesqueiro','count(cml_paf_id)')->
                group('cml_id')->
                order('count(cml_paf_id) DESC')->limit('1');

        return $this->dbTableColetaManualHasPesqueiro->fetchAll($select)->toArray();
    } 
    public function selectNomeEspeciesColetamanual($where = null, $order = null, $limit = null){
        $this->dbTableColetaManualHasEspCapturada = new Application_Model_DbTable_VColetaManualHasEspecieCapturada();

        $select = $this->dbTableColetaManualHasEspCapturada->select()
                ->from($this->dbTableColetaManualHasEspCapturada,'esp_nome_comum')->distinct(true)->
                order('esp_nome_comum')->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableColetaManualHasEspCapturada->fetchAll($select)->toArray();
    }
    public function selectColetaManualHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $ColetaManual = $this->modelColetaManual->selectColetaManualHasEspCapturadas($where, $order, $limit);
        
        return $ColetaManual;
    }
    //////////////////////////////////////////////////////////////////////////////////////
    
    
    ///EMALHE//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaEmalhe($where = null, $order = null, $limit = null)
    {
        
        $this->dbTableEmalhe= new Application_Model_DbTable_VRelatorioEmalhe();
        $select = $this->dbTableEmalhe->select()
                ->from($this->dbTableEmalhe)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEmalhe->fetchAll($select)->toArray();
    }
    public function selectEmalhe($where = null, $order = null, $limit = null){
        
        $this->modelEmalhe = new Application_Model_Emalhe();
        
        $Emalhe = $this->modelEmalhe->selectEntrevistaEmalhe($where, $order, $limit);
        
        return $Emalhe;
    }
    
    public function selectEmalheHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelEmalhe = new Application_Model_Emalhe();
        
        $Emalhe = $this->modelEmalhe->selectEmalheHasPesqueiro($where, $order, $limit);
        
        return $Emalhe;
    }
    public function countPesqueirosEmalhe()
    {
        $this->dbTableEmalheHasPesqueiro = new Application_Model_DbTable_VEmalheHasPesqueiro();
        $select = $this->dbTableEmalheHasPesqueiro->select()
                ->from('v_emalhe_has_t_pesqueiro','count(em_paf_id)')->
                group('em_id')->
                order('count(em_paf_id) DESC')->limit('1');

        return $this->dbTableEmalheHasPesqueiro->fetchAll($select)->toArray();
    } 
    public function selectNomeEspeciesEmalhe($where = null, $order = null, $limit = null){
        $this->dbTableEmalheHasEspCapturada = new Application_Model_DbTable_VEmalheHasEspecieCapturada();

        $select = $this->dbTableEmalheHasEspCapturada->select()
                ->from($this->dbTableEmalheHasEspCapturada,'esp_nome_comum')->distinct(true)->
                order('esp_nome_comum')->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableEmalheHasEspCapturada->fetchAll($select)->toArray();
    }
    public function selectEmalheHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelEmalhe = new Application_Model_Emalhe();
        
        $Emalhe = $this->modelEmalhe->selectEmalheHasEspCapturadas($where, $order, $limit);
        
        return $Emalhe;
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    
    ///Grosseira//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaGrosseira($where = null, $order = null, $limit = null)
    {
        
        $this->dbTableGrosseira= new Application_Model_DbTable_VRelatorioGrosseira();
        $select = $this->dbTableGrosseira->select()
                ->from($this->dbTableGrosseira)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableGrosseira->fetchAll($select)->toArray();
    }
    public function selectGrosseira($where = null, $order = null, $limit = null){
        
        $this->modelGrosseira = new Application_Model_Grosseira();
        
        $Grosseira = $this->modelGrosseira->selectEntrevistaGrosseira($where, $order, $limit);
        
        return $Grosseira;
    }
    
    public function selectGrosseiraHasPesqueiro($where = null, $order = null, $limit = null)
    {
        $this->modelGrosseira = new Application_Model_Grosseira();
        
        $Grosseira = $this->modelGrosseira->selectGrosseiraHasPesqueiro($where, $order, $limit);
        
        return $Grosseira;
    }
    public function countPesqueirosGrosseira()
    {
        $this->dbTableGrosseiraHasPesqueiro = new Application_Model_DbTable_VGrosseiraHasPesqueiro();
        $select = $this->dbTableGrosseiraHasPesqueiro->select()
                ->from('v_grosseira_has_t_pesqueiro','count(grs_paf_id)')->
                group('grs_id')->
                order('count(grs_paf_id) DESC')->limit('1');

        return $this->dbTableGrosseiraHasPesqueiro->fetchAll($select)->toArray();
    } 
    public function selectNomeEspeciesGrosseira($where = null, $order = null, $limit = null){
        $this->dbTableGrosseiraHasEspCapturada = new Application_Model_DbTable_VGrosseiraHasEspecieCapturada();

        $select = $this->dbTableGrosseiraHasEspCapturada->select()
                ->from($this->dbTableGrosseiraHasEspCapturada,'esp_nome_comum')->distinct(true)->
                order('esp_nome_comum')->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $this->dbTableGrosseiraHasEspCapturada->fetchAll($select)->toArray();
    }
    public function selectGrosseiraHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelGrosseira = new Application_Model_Grosseira();
        
        $Grosseira = $this->modelGrosseira->selectGrosseiraHasEspCapturadas($where, $order, $limit);
        
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

