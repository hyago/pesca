<?php

class RelatoriosController extends Zend_Controller_Action
{

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }

        $this->_helper->layout->setLayout('admin');


        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $identity2 = get_object_vars($identity);

        }

        $this->modelUsuario = new Application_Model_Usuario();
        $this->usuario = $this->modelUsuario->selectLogin($identity2['tl_id']);
        $this->view->assign("usuario",$this->usuario);
    }

    public function indexAction(){
        $this->modelRelatorios = new Application_Model_Relatorios();
         $relatorioEspecies = $this->modelRelatorios->countPesqueirosArrasto();
         print_r($relatorioEspecies[0]['count']);
    }
    
    public function gerarAction(){
        $valueRelatorio = $this->_getAllParams();
        
        switch($valueRelatorio['artePesca']){
            
            case 1: $this->_redirect("/relatorios/relatoriocompletoarrasto");break;
            case 2:$this->_redirect("/relatorios/relatoriocompletocalao");break;
            case 3:$this->_redirect("/relatorios/relatoriocompletocoletamanual");break;
            case 4:$this->_redirect("/relatorios/relatoriocompletoemalhe");break;
            case 5:$this->_redirect("/relatorios/relatoriocompletogroseira");break;
            case 6:$this->_redirect("/relatorios/relatoriocompletojerere");break;
            case 7:$this->_redirect("/relatorios/relatoriocompletolinha");break;
            case 8:$this->_redirect("/relatorios/relatoriocompletolinhafundo");break;
            case 9:$this->_redirect("/relatorios/relatoriocompletomanzua");break;
            case 10:$this->_redirect("/relatorios/relatoriocompletomergulho");break;
            case 11:$this->_redirect("/relatorios/relatoriocompletoratoeira");break;
            case 12:$this->_redirect("/relatorios/relatoriocompletosiripoia");break;
            case 13:$this->_redirect("/relatorios/relatoriocompletotarrafa");break;
            case 14:$this->_redirect("/relatorios/relatoriocompletovarapesca");break;
            case 15:$this->_rerirect("/relatorios/relatoriocompleto");break;
            case 16:$this->_redirect("/relatorios/relatoriocompletomonitoramentos");break;
            case 17:$this->_redirect("/relatorios/relatoriocompletoespecies");break;
            case 18:$this->_redirect("/relatorios/relatoriocompletoespeciesmes");break;
            case 19:$this->_redirect("/relatorios/relatoriocompletopescadores");break;
            
        }
    }

    public function relatoriocompletoarrastoAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        
        
        $relatorioEspecies = $this->modelRelatorios->selectNomeEspecies();
        $maxPesqueiros = $this->modelRelatorios->countPesqueirosArrasto();
        $coluna = $maxPesqueiros[0]['count']*5;
        foreach($relatorioEspecies as $key => $especie):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna++, $linha,$especie['esp_nome_comum']);
        endforeach;
        
        $relatorioArrasto = $this->modelRelatorios->selectArrasto();
        $linha = 2;
        $coluna= 0;
        

        foreach ( $relatorioArrasto as $key => $consulta ):
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
                if($consulta['dias'] == '0'){
                    $consulta['dias']= '1';
                }
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_id']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_quantpescadores']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_diesel']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_oleo']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_alimento']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_gelo']);
                if($consulta['af_motor'] == false){
                    $consulta['af_motor'] = 'Não';
                }
                else{
                    $consulta['af_motor'] = 'Sim';
                }
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_motor']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['af_obs']);


                
                
                $Pesqueiros = $this->modelRelatorios->selectArrastoHasPesqueiro('af_id = '.$consulta['af_id']);
                
                $coluna++;
                foreach($Pesqueiros as $key => $nome):
                    $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna++, $linha, $nome['paf_pesqueiro']);
                endforeach;
                $coluna= $maxPesqueiros[0]['count']*4;
                foreach($Pesqueiros as $key => $tempo):
                    $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna++, $linha, $tempo['t_tempopesqueiro']);
                endforeach;
                
                $Relesp = $this->modelRelatorios->selectArrastoHasEspCapturadas('af_id = '.$consulta['af_id']);
                
                $coluna= $maxPesqueiros[0]['count']*5;
            foreach($relatorioEspecies as $key => $especie):
                 foreach($Relesp as $key => $esp):
                     if($esp['esp_nome_comum'] === $objPHPExcel->getActiveSheet()->getCellByColumnAndRow($coluna, 1)->getFormattedValue()){
                         $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna++, $linha, $esp['spc_peso_kg']);
                     }
                 endforeach;
                    $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna++, $linha, '0');
            endforeach;     
                $coluna=0;
                $linha++;
        endforeach;
             
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioArrasto.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    public function relatoriocompletocoletamanualAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaColetaManual();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');

        $linha = 2;
        $coluna= 0;
        $max = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['cml_mreviva'] == false){
                $consulta['cml_mreviva'] = 'Morta';
            }
            else{
                $consulta['cml_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_mreviva']);
            if($consulta['cml_motor'] == false){
                $consulta['cml_motor'] = 'Não';
            }
            else{
                $consulta['cml_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_obs']);
            
            

            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            
            
            
            $coluna=0;
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioColetaManual.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    
    public function relatoriocompletocalaoAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaCalao();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data do Calão');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Num panos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tamanhos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Altura');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha2');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha3');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Calão');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');

        $linha = 2;
        $coluna= 0;
        $max = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_npanos']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_tamanho']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_altura']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha1']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha2']);
            if($consulta['cal_motor'] == false){
                $consulta['cal_motor'] = 'Não';
            }
            else{
                $consulta['cal_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tcat_tipo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            
            
            
            $coluna=0;
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioCalao.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletoemalheAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaEmalhe();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Lançamento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Lançamento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Recolhimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Recolhimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tamanho');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Altura');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Panos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['drecolhimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dlancamento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hlancamento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['drecolhimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hrecolhimento']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_diesel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_oleo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_alimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_gelo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_tamanho']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_altura']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_numpanos']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_malha']);
            
            if($consulta['em_motor'] == false){
                $consulta['em_motor'] = 'Não';
            }
            else{
                $consulta['em_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['em_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);

            $coluna=0;
            $linha++;
        endforeach;
            
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioEmalhe.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletogroseiraAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaGrosseira();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Linhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Anzóis por Linha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Isca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_diesel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_oleo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_alimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_gelo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_numlinhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_numanzoisplinha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['isc_tipo']);
            
            if($consulta['grs_motor'] == false){
                $consulta['grs_motor'] = 'Não';
            }
            else{
                $consulta['grs_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['grs_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);

            $coluna=0;
            $linha++;
        endforeach;
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioGrosseira.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletojerereAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaJerere();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Armadilhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Combustível');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo da Venda');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_numarmadilhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['jre_mreviva'] == false){
                $consulta['jre_mreviva'] = 'Morta';
            }
            else{
                $consulta['jre_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_mreviva']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_combustivel']);
            if($consulta['jre_motor'] == false){
                $consulta['jre_motor'] = 'Não';
            }
            else{
                $consulta['jre_motor'] = 'Sim';
            }
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['jre_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);

            $coluna=0;
            $linha++;
        endforeach;
            
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioJereré.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
   public function relatoriocompletolinhaAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaLinha();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Linhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Anzóis por Linha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Isca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_diesel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_oleo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_alimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_gelo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_numlinhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_numanzoisplinha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['isc_tipo']);
            
            if($consulta['lin_motor'] == false){
                $consulta['lin_motor'] = 'Não';
            }
            else{
                $consulta['lin_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lin_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);

            $coluna=0;
            $linha++;
        endforeach;
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioLinha.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletolinhafundoAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaLinhaFundo();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Linhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Anzóis por Linha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Isca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Venda');

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_diesel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_oleo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_alimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_gelo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_numlinhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_numanzoisplinha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['isc_tipo']);
            
            if($consulta['lf_motor'] == false){
                $consulta['lf_motor'] = 'Não';
            }
            else{
                $consulta['lf_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['lf_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);
            
            $coluna=0;
            $linha++;
        endforeach;
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioLinhaFundo.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
     public function relatoriocompletomanzuaAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaManzua();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Combustível');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Armadilhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Venda');

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_combustivel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_numarmadilhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['man_mreviva'] == false){
                $consulta['man_mreviva'] = 'Morta';
            }
            else{
                $consulta['man_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_mreviva']);
            
            if($consulta['man_motor'] == false){
                $consulta['man_motor'] = 'Não';
            }
            else{
                $consulta['man_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['man_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);
            
            $coluna=0;
            $linha++;
        endforeach;
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioManzua.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletomergulhoAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaMergulho();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Chegada');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Venda');
        
        $linha = 2;
        $coluna= 0;
        $max = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mer_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mer_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['mer_mreviva'] == false){
                $consulta['mer_mreviva'] = 'Morta';
            }
            else{
                $consulta['mer_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mer_mreviva']);
            if($consulta['mer_motor'] == false){
                $consulta['mer_motor'] = 'Não';
            }
            else{
                $consulta['mer_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mer_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mer_obs']);
            
            

            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);
            
            
            $coluna=0;
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioMergulho.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    
    public function relatoriocompletoratoeiraAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaRatoeira();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Armadilhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Combustível');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo da Venda');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_numarmadilhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['rat_mreviva'] == false){
                $consulta['rat_mreviva'] = 'Morta';
            }
            else{
                $consulta['rat_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_mreviva']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_combustivel']);
            if($consulta['rat_motor'] == false){
                $consulta['rat_motor'] = 'Não';
            }
            else{
                $consulta['rat_motor'] = 'Sim';
            }
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['rat_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);

            $coluna=0;
            $linha++;
        endforeach;
            
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioRatoeira.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletosiripoiaAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaSiripoia();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Armadilhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Combustível');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo da Venda');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_numarmadilhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['sir_mreviva'] == false){
                $consulta['sir_mreviva'] = 'Morta';
            }
            else{
                $consulta['sir_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_mreviva']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_combustivel']);
            if($consulta['sir_motor'] == false){
                $consulta['sir_motor'] = 'Não';
            }
            else{
                $consulta['sir_motor'] = 'Sim';
            }
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['sir_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);

            $coluna=0;
            $linha++;
        endforeach;
            
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioSiripoia.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletotarrafaAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaTarrafa();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data do Calão');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Roda');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Altura');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Lances');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');

        $linha = 2;
        $coluna= 0;
        $max = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_roda']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_altura']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_malha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_numlances']);
            if($consulta['tar_motor'] == false){
                $consulta['tar_motor'] = 'Não';
            }
            else{
                $consulta['tar_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tar_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            
            
            
            $coluna=0;
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioTarrafa.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletovarapescaAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioArrasto = $this->modelRelatorios->selectEntrevistaVaraPesca();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saída');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Diesel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Óleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimentos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Linhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Anzois Por linha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Isca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo da Venda');
        

        
        $linha = 2;
        $coluna= 0;
        $i = 0;
        foreach ( $relatorioArrasto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['fd_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_diesel']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_oleo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_alimento']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_gelo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_numlinhas']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_numanzoisplinha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['isc_tipo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['vp_mreviva'] == false){
                $consulta['vp_mreviva'] = 'Morta';
            }
            else{
                $consulta['vp_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_mreviva']);
            if($consulta['vp_motor'] == false){
                $consulta['vp_motor'] = 'Não';
            }
            else{
                $consulta['vp_motor'] = 'Sim';
            }
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['vp_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['ttv_tipovenda']);

            $coluna=0;
            $linha++;
        endforeach;
            
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioVaraPesca.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriocompletoAction() {
        if($this->usuario['tp_id']==5){
            $this->_redirect('index');
        }
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        
        $this->modelRelatorios = new Application_Model_Relatorios();
        
        $relatorioCalao = $this->modelRelatorios->selectEntrevistaCalao();
        
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        $coluna = 0;
        $linha = 1;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna,   $linha, 'Porto de Desembarque');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Arte de pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Entrevista');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Saida');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Saida');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Data Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Hora Volta');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Dias de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tempo Gasto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Código');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Mestre');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Pescadores');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Barco');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Combustivel');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Oleo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Alimento');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Gelo');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Lances');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de panos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Roda');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tamanhos');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Altura');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha2');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Malha3');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Linhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Anzóis Por Linha');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Número de Armadilhas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Isca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Motor?');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Estado da Maré');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Destino da Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Observacao');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Tipo de Calão');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Espécie');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Peso (kg)');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, 'Preço (kg)');

        $linha = 2;
        $coluna= 0;
        $max = 0;
        foreach ( $relatorioCalao as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_data']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '1');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_npanos']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_tamanho']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_altura']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha1']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_malha2']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            if($consulta['cal_motor'] == false){
                $consulta['cal_motor'] = 'Não';
            }
            else{
                $consulta['cal_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cal_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tcat_tipo']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $coluna=0;
            $linha++;
        endforeach;
        
        $relatorioColeta = $this->modelRelatorios->selectEntrevistaColetaManual();
        foreach ( $relatorioColeta as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($coluna, $linha,   $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['artepesca']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hsaida']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dvolta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['hvolta']);
            if($consulta['dias'] == '0'){
                $consulta['dias']= '1';
            }
            
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dias']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_tempogasto']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_id']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['bar_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tp_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_quantpescadores']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['tte_tipoembarcacao']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, '');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['mre_tipo']);
            if($consulta['cml_mreviva'] == false){
                $consulta['cml_mreviva'] = 'Morta';
            }
            else{
                $consulta['cml_mreviva'] = 'Viva';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_mreviva']);
            if($consulta['cml_motor'] == false){
                $consulta['cml_motor'] = 'Não';
            }
            else{
                $consulta['cml_motor'] = 'Sim';
            }
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_motor']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['dp_destino']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['cml_obs']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['esp_nome_comum']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_peso_kg']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(++$coluna, $linha, $consulta['spc_preco']);
            $coluna=0;
            $linha++;
        endforeach;
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioCompleto.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
}

