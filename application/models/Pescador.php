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



class Application_Model_Pescador {

    public function select($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_Pescador();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }

    public function find($id) {
        $dao = new Application_Model_DbTable_VPescador();
        $arr = $dao->find($id)->toArray();
        return $arr[0];
    }

    public function insert(array $request) {
        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dbTablePescadorHasAreaPesca = new Application_Model_DbTable_PescadorHasAreaPesca();
        $dbTablePescadorHasArtePesca = new Application_Model_DbTable_PescadorHasArtePesca();
        $dbTablePescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();
        $dbTablePescadorHasEmbarcacao = new Application_Model_DbTable_PescadorHasEmbarcacao();
        $dbTablePescadorHasEspecieCapturada = new Application_Model_DbTable_PescadorHasEspecieCapturada();
        $dbTable_EspecieCapturada = new Application_Model_DbTable_EspecieCapturada();
        $dbTable_Escolaridade = new Application_Model_DbTable_EscolaridadeDbtable();
        $dbTablePescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();

//        $dadosEndereco = array(
//            'te_logradouro' => $request['logradouro'],
//            'te_numero' => $request['numero'],
//            'te_bairro' => $request['bairro'],
//            'te_cep' => $request['cep'],
//            'te_comp' => $request['complemento'],
//            'tmun_id' => $request['municipio']
//        );
//
//        $idEndereco = $dbTableEndereco->insert($dadosEndereco);
//
//        $data = explode('/', $request['dataNasc']);
//        $data = $data[2] . '-' . $data[1] . '-' . $data[0];
//
//        $dadosPescador = array(
//            'tp_nome' => $request['nome'],
//            'tp_sexo' => $request['sexo'],
//            'tp_rg' => $request['rg'],
//            'tp_cpf' => $request['cpf'],
////            'tp_telres'        => $request['telefoneResidencial'],
////            'tp_telcel'        => $request['telefoneCelular'],
//            'tp_apelido' => $request['apelido'],
//            'tp_matricula' => $request['matricula'],
//            'tp_filiacaopai' => $request['filiacaoPai'],
//            'tp_filiacaomae' => $request['filiacaoMae'],
//            'tp_ctps' => $request['ctps'],
//            'tp_pis' => $request['pis'],
//            'tp_inss' => $request['inss'],
//            'tp_nit_cei' => $request['nit_cei'],
//            'tp_cma' => $request['cma'],
//            'tp_rgb_maa_ibama' => $request['rgb_maa_ibama'],
//            'tp_cir_cap_porto' => $request['cir_cap_porto'],
//            'tp_datanasc' => $data,
//            'tmun_id_natural' => $request['municipioNat'],
//            'te_id' => $idEndereco,
//            'esc_id' => $request['escolaridade_pescador']
//        );
//
//        $idPescador = $dbTablePescador->insert($dadosPescador);
//
//        $dadosPescadorHasAreaPesca = array(
//            'tareap_id' => $request['areaPesca'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasAreaPesca->insert($dadosPescadorHasAreaPesca);
//
//        $dadosPescadorHasArtePesca = array(
//            'tap_id' => $request['artePesca'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasArtePesca->insert($dadosPescadorHasArtePesca);
//
//        $dadosPescadorHasColonia = array(
//            'tc_id' => $request['colonia'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasColonia->insert($dadosPescadorHasColonia);
//
//        $dadosPescadorHasEmbarcacao = array(
//            'tte_id' => $request['tipoEmbarcacao'],
//            'tpe_id' => $request['porteEmbarcacao'],
//            'tpte_motor' => TRUE,
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasEmbarcacao->insert($dadosPescadorHasEmbarcacao);
//
//        $dadosPescadorHasEspecieCapturada = array(
//            't_tipocapturada_itc_id' => $request['tipocapturada'],
//            'tp_id' => $idPescador
//        );
//
//        $dbTablePescadorHasEspecieCapturada->insert($dadosPescadorHasEspecieCapturada);
        
        
//        
                
//       $tables = $html1->find('table');
//        $rows = $tables[0]->find('tr'); //All rows of first table
//        foreach ($rows as $row) { //Loop through each row
//            //Loop through each child (cell) of the row
//            foreach ($row->children() as $cell) {
//                echo $cell->plaintext;
//            }
//        }


////        $rows = $request['tr_listasTelefonesPescador'];
////        foreach ($rows as $row) {
////            foreach ($row->children() as $cell) {
//                $dadosPescadorHasTelefone = array(
//                    'tpt_tp_id' => $idPescador,
//                    'tpt_ttel_id' => $request['selectTipoTelefone[1]'],
//                    'tpt_telefone' => $request['telefoneResidencial[1]']
//                );
//                $dbTablePescadorHasTelefone->insert($dadosPescadorHasTelefone);
//            }
//        }
// adding new products
                $idPescador = 10042;

	if(!empty($_POST['inputTelefone'])) {
		foreach($_POST['inputTelefone'] as $cnt => $inputTelefone) {
                    
                    $dadosPescadorHasTelefone = array(
                    'tpt_tp_id' => $idPescador,
                    'tpt_ttel_id' => $_POST['inputTipoID'][$cnt],
                    'tpt_telefone' => $inputTelefone
                );
                $dbTablePescadorHasTelefone->insert($dadosPescadorHasTelefone);
                        
		}
	}	

        return;
    }

    public function update(array $request) {
        $dbTablePescador = new Application_Model_DbTable_Pescador();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();
        $dbTable_EspecieCapturada = new Application_Model_DbTable_EspecieCapturada();

        $dbTablePescadorHasAreaPesca = new Application_Model_DbTable_PescadorHasAreaPesca();
        $dbTablePescadorHasArtePesca = new Application_Model_DbTable_PescadorHasArtePesca();
        $dbTablePescadorHasColonia = new Application_Model_DbTable_PescadorHasColonia();
        $dbTablePescadorHasEmbarcacao = new Application_Model_DbTable_PescadorHasEmbarcacao();
        $dbTablePescadorHasEspecieCapturada = new Application_Model_DbTable_PescadorHasEspecieCapturada();

        $dadosEndereco = array(
            'te_logradouro' => $request['logradouro'],
            'te_numero' => $request['numero'],
            'te_bairro' => $request['bairro'],
            'te_cep' => $request['cep'],
            'te_comp' => $request['complemento'],
            'tmun_id' => $request['municipio']
        );

        $data = explode('/', $request['dataNasc']);
        $data = $data[2] . '-' . $data[1] . '-' . $data[0];

        $dadosPescador = array(
            'tp_nome' => $request['nome'],
            'tp_sexo' => $request['sexo'],
            'tp_rg' => $request['rg'],
            'tp_cpf' => $request['cpf'],
//            'tp_telres' => $request['telefoneResidencial'],
//            'tp_telcel' => $request['telefoneCelular'],
            'tp_apelido' => $request['apelido'],
            'tp_matricula' => $request['matricula'],
            'tp_filiacaopai' => $request['filiacaoPai'],
            'tp_filiacaomae' => $request['filiacaoMae'],
            'tp_ctps' => $request['ctps'],
            'tp_pis' => $request['pis'],
            'tp_inss' => $request['inss'],
            'tp_nit_cei' => $request['nit_cei'],
            'tp_cma' => $request['cma'],
            'tp_rgb_maa_ibama' => $request['rgb_maa_ibama'],
            'tp_cir_cap_porto' => $request['cir_cap_porto'],
            'tp_datanasc' => $data,
            'tmun_id_natural' => $request['municipioNat'],
            'te_id' => $request['idEndereco']
        );
        /*
          $dadosPescadorHasArtePesca = array(
          'tap_id' => $request['artePesca'],
          'tp_id'  => $request['idPescador']
          );


          $dadosPescadorHasEmbarcacao = array(
          'tte_id'     => $request['tipoEmbarcacao'],
          'tpe_id'     => $request['porteEmbarcacao'],
          'tpte_motor' => TRUE,
          'tp_id'      => $idPescador
          ); */

        $wherePescador = $dbTablePescador->getAdapter()->quoteInto('"tp_id" = ?', $request['idPescador']);
        $whereEndereco = $dbTableEndereco->getAdapter()->quoteInto('"te_id" = ?', $request['idEndereco']);
//         $whereArtePesca= $dbTablePescadorHasArtePesca->getAdapter()->quoteInto('"tap_id" = ?', $request['artePesca']);
//         $whereArtePesca= $dbTablePescadorHasArtePesca->getAdapter()->quoteInto('"tap_id" = ?', $request['artePesca']);


        $dbTablePescador->update($dadosPescador, $wherePescador);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
        
        $dbTablePescadorHasTelefone = new Application_Model_DbTable_PescadorHasTelefone();    
        $idPescador = 10036;

	if(!empty($_POST['inputTelefone'])) {
		foreach($_POST['inputTelefone'] as $cnt => $inputTelefone) {
                    
                    $dadosPescadorHasTelefone = array(
                    'tpt_tp_id' => $idPescador,
                    'tpt_ttel_id' => $_POST['inputTipoID'][$cnt],
                    'tpt_telefone' => $inputTelefone
                );
                $dbTablePescadorHasTelefone->insert($dadosPescadorHasTelefone);
                        
		}
        }
                
//         $dbTablePescadorHasArtePesca->update($dadosPescadorHasArtePesca, $whereArtePesca);
    }

    public function delete($idPescador) {
        $dbTablePescador = new Application_Model_DbTable_Pescador();

        $dadosPescador = array(
            'tp_pescadordeletado' => TRUE
        );

        $wherePescador = $dbTablePescador->getAdapter()->quoteInto('"tp_id" = ?', $idPescador);

        $dbTablePescador->update($dadosPescador, $wherePescador);
    }

    public function select_Pescador_By_Municipio($where = null, $order = null, $limit = null) {
        $dao = new Application_Model_DbTable_VPescadorByMunicipio();
        $select = $dao->select()->from($dao)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $dao->fetchAll($select)->toArray();
    }
}
