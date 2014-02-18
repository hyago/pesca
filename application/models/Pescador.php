<?php

/** 
 * Model Pescador
 * 
 * @package Pesca
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Pescador
{
    public function select($where = null, $order = null, $limit = null)
    {
        $dao = new Application_Model_DbTable_Pescador();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if(!is_null($where)){
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }
    
    public function find($id)
    {
        $dao = new Application_Model_DbTable_VPescador();
        $arr = $dao->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request)
    {
        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dbTablePescadorHasAreaPesca = new Application_Model_DbTable_PescadorHasAreaPesca();
        $dbTablePescadorHasArtePesca = new Application_Model_DbTable_PescadorHasArtePesca();
        $dbTablePescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();
        $dbTablePescadorHasEmbarcacao = new Application_Model_DbTable_PescadorHasEmbarcacao();
        $dbTablePescadorHasEspecieCapturada = new Application_Model_DbTable_PescadorHasEspecieCapturada();
        
        
        $dadosEndereco = array(
            'TE_Logradouro'  => $request['logradouro'],
            'TE_Numero'      => $request['numero'],
            'TE_Bairro'      => $request['bairro'],
            'TE_CEP'         => $request['cep'],
            'TE_Comp'        => $request['complemento'],
            'TMun_ID'        => $request['municipio']
        );
        
        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
        
        $dadosPescador = array(
            'TP_Nome'          => $request['nome'],
            'TP_Sexo'          => $request['sexo'],
            'TP_RG'            => $request['rg'],
            'TP_CPF'           => $request['cpf'],
            'TP_Apelido'       => $request['apelido'],
            'TP_Matricula'     => $request['matricula'],
            'TP_FiliacaoPai'   => $request['filiacaoPai'],
            'TP_FiliacaoMae'   => $request['filiacaoMae'],
            'TP_CTPS'          => $request['ctps'],
            'TP_PIS'           => $request['pis'],
            'TP_INSS'          => $request['inss'],
            'TP_NIT_CEI'       => $request['nit_cei'],
            'TP_CMA'           => $request['cma'],
            'TP_RGB_MAA_IBAMA' => $request['rgb_maa_ibama'],
            'TP_CIR_Cap_Porto' => $request['cir_cap_porto'],
            'TP_DataNasc'      => $request['dataNasc'],
            'TMun_ID_Natural'  => $request['municipioNat'],
            'TE_ID'            => $idEndereco
        );
        
        $idPescador = $dbTablePescador->insert($dadosPescador);
        
        $dadosPescadorHasAreaPesca = array(
            'TAreaP_ID' => $request['areaPesca'],
            'TP_ID'     => $idPescador
        );
        
        $dbTablePescadorHasAreaPesca->insert($dadosPescadorHasAreaPesca);
        
        $dadosPescadorHasArtePesca = array(
            'TAP_ID' => $request['artePesca'],
            'TP_ID'  => $idPescador
        );
        
        $dbTablePescadorHasArtePesca->insert($dadosPescadorHasArtePesca);
        
        $dadosPescadorHasColonia = array(
            'TC_ID' => $request['colonia'],
            'TP_ID' => $idPescador
        );
        
        $dbTablePescadorHasColonia->insert($dadosPescadorHasColonia);
        
        $dadosPescadorHasEmbarcacao = array(
            'TTE_ID'     => $request['tipoEmbarcacao'],
            'TPE_ID'     => $request['porteEmbarcacao'],
            'TPTE_Motor' => TRUE,
            'TP_ID'      => $idPescador
        );
        
        $dbTablePescadorHasEmbarcacao->insert($dadosPescadorHasEmbarcacao);
        
        $dadosPescadorHasEspecieCapturada = array(
            'TEC_ID'     => $request['especie'],
            'TP_ID'      => $idPescador
        );
        
        $dbTablePescadorHasEspecieCapturada->insert($dadosPescadorHasEspecieCapturada);
        
        return;
    }
    
    public function update(array $request)
    {
        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        
        $dadosEndereco = array(
            'TE_Logradouro'  => $request['logradouro'],
            'TE_Numero'      => $request['numero'],
            'TE_Bairro'      => $request['bairro'],
            'TE_CEP'         => $request['cep'],
            'TE_Comp'        => $request['complemento'],
            'TMun_ID'        => $request['municipio']
        );
        
        $dadosPescador = array(
            'TP_Nome'          => $request['nome'],
            'TP_Sexo'          => $request['sexo'],
            'TP_RG'            => $request['rg'],
            'TP_CPF'           => $request['cpf'],
            'TP_Apelido'       => $request['apelido'],
            'TP_Matricula'     => $request['matricula'],
            'TP_FiliacaoPai'   => $request['filiacaoPai'],
            'TP_FiliacaoMae'   => $request['filiacaoMae'],
            'TP_CTPS'          => $request['ctps'],
            'TP_PIS'           => $request['pis'],
            'TP_INSS'          => $request['inss'],
            'TP_NIT_CEI'       => $request['nit_cei'],
            'TP_CMA'           => $request['cma'],
            'TP_RGB_MAA_IBAMA' => $request['rgb_maa_ibama'],
            'TP_CIR_Cap_Porto' => $request['cir_cap_porto'],
            'TP_DataNasc'      => $request['dataNasc'],
            'TMun_ID_Natural'  => $request['municipioNat']
        );
        
        $wherePescador= $dbTablePescador->getAdapter()->quoteInto('"TP_ID" = ?', $request['idPescador']);
        $whereEndereco= $dbTableEndereco->getAdapter()->quoteInto('"TE_ID" = ?', $request['idEndereco']);
        
        $dbTablePescador->update($dadosPescador, $wherePescador);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }
    
    public function delete($idPescador)
    {
        $dbTablePescador = new Application_Model_DbTable_Pescador();        
                
        $dadosPescador = array(
            'TP_PescadorDeletado' => TRUE
        );
        
        $wherePescador= $dbTablePescador->getAdapter()->quoteInto('"TP_ID" = ?', $idPescador);
        
        $dbTablePescador->update($dadosPescador, $wherePescador);
    }
    
}

