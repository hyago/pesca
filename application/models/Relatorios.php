<?php

class Application_Model_Relatorios
{
    //ARRASTO DE FUNDO ////////////////////////////////////////////////////////////////////
    public function selectEntrevistaArrasto($where = null, $order = null, $limit = null)
    {
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
    public function selectArrastoHasEspCapturadas($where = null, $order = null, $limit = null){
         
        $this->modelArrastoFundo = new Application_Model_ArrastoFundo();
        
        $arrasto = $this->modelArrastoFundo->selectArrastoHasEspCapturadas($where, $order, $limit);
        
        return $arrasto;
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////
    
    //CALÃO////////////////////////////////////////////////////////////////////////////////
    public function selectEntrevistaCalao($where = null, $order = null, $limit = null)
    {
        $this->modelCalao = new Application_Model_Calao();
        
        $calao = $this->modelCalao->selectEntrevistaCalao($where, $order, $limit);
        
        return $calao;
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
        $this->modelColetaManual = new Application_Model_ColetaManual();
        
        $coleta = $this->modelColetaManual->selectEntrevistaColetaManual($where, $order, $limit);
        
        return $coleta;
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
        $this->modelEmalhe = new Application_Model_Emalhe();
        
        $emalhe = $this->modelEmalhe->selectEntrevistaEmalhe($where, $order, $limit);
        
        return $emalhe;
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
        $this->modelGrosseira = new Application_Model_Grosseira();
        
        $grosseira = $this->modelGrosseira->selectEntrevistaGrosseira($where, $order, $limit);
        
        return $grosseira;
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
    
    ///Linha//////////////////////////////////////////////////////////////////////////////
    
    public function selectEntrevistaLinha($where = null, $order = null, $limit = null)
    {
        $this->modelLinha = new Application_Model_Linha();
        
        $Linha = $this->modelLinha->selectEntrevistaLinha($where, $order, $limit);
        
        return $Linha;
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
        $this->modelLinhaFundo = new Application_Model_LinhaFundo();
        
        $LinhaFundo = $this->modelLinhaFundo->selectEntrevistaLinhaFundo($where, $order, $limit);
        
        return $LinhaFundo;
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
        $this->modelManzua = new Application_Model_Manzua();
        
        $Manzua = $this->modelManzua->selectEntrevistaManzua($where, $order, $limit);
        
        return $Manzua;
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
        $this->modelMergulho = new Application_Model_Mergulho();
        
        $Mergulho = $this->modelMergulho->selectEntrevistaMergulho($where, $order, $limit);
        
        return $Mergulho;
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
        $this->modelRatoeira = new Application_Model_Ratoeira();
        
        $Ratoeira = $this->modelRatoeira->selectEntrevistaRatoeira($where, $order, $limit);
        
        return $Ratoeira;
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
        $this->modelSiripoia = new Application_Model_Siripoia();
        
        $Siripoia = $this->modelSiripoia->selectEntrevistaSiripoia($where, $order, $limit);
        
        return $Siripoia;
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
        $this->modelTarrafa = new Application_Model_Tarrafa();
        
        $Tarrafa = $this->modelTarrafa->selectEntrevistaTarrafa($where, $order, $limit);
        
        return $Tarrafa;
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
        $this->modelVaraPesca = new Application_Model_VaraPesca();
        
        $VaraPesca = $this->modelVaraPesca->selectEntrevistaVaraPesca($where, $order, $limit);
        
        return $VaraPesca;
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

