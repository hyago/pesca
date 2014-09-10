<?php

class ConsultaPadraoController extends Zend_Controller_Action
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

    public function indexAction()
    {
        $consultaPadrao = new Application_Model_VConsultaPadrao();
        
        $selectConsulta = $consultaPadrao->select(); 
        $selectMonitoramentos = $consultaPadrao->selectMonitoramentos(); 
        $selectFichas = $consultaPadrao->selectFichas();
        $selectSubamostras = $consultaPadrao->selectSubamostras();
        $totalEntrevistas = $consultaPadrao->selectTotalEntrevistas();
        $diasByPorto = $consultaPadrao->selectDiasByPorto();
        $dias = $consultaPadrao->selectDias();
        
        
        $this->view->assign("totalEntrevistas", $totalEntrevistas);
        $this->view->assign("dias", $dias);
        $this->view->assign("diasByPorto", $diasByPorto);
        $this->view->assign("selectSubamostras", $selectSubamostras);
        $this->view->assign("selectFichas", $selectFichas);
        $this->view->assign("selectConsulta", $selectConsulta);
        $this->view->assign("selectMonitoramentos", $selectMonitoramentos);
        //print_r($selectConsulta);
    }

    public function relatorioAction(){
        $this->_helper->layout->disableLayout();
	$this->_helper->viewRenderer->setNoRender(true);
        
        $consultaPadrao = new Application_Model_VConsultaPadrao();
        
	$selectConsulta = $consultaPadrao->select(); 
        $selectMonitoramentos = $consultaPadrao->selectMonitoramentos(); 
        $selectFichas = $consultaPadrao->selectFichas();
        $selectSubamostras = $consultaPadrao->selectSubamostras();
        $totalEntrevistas = $consultaPadrao->selectTotalEntrevistas();
        $diasByPorto = $consultaPadrao->selectDiasByPorto();
        $dias = $consultaPadrao->selectDias();

	require_once "../library/ModeloRelatorio.php";
        $modeloRelatorio = new ModeloRelatorio();
        $modeloRelatorio->setTitulo('Relatório Consulta Padrão');
        
        $modeloRelatorio->setLegValue(30, 'Artes de Pesca');
        $modeloRelatorio->setLegValue(120, 'Quantidade');
        $modeloRelatorio->setLegValue(180, 'Porto');
        $modeloRelatorio->setNewLine();
	
        foreach ( $selectConsulta as $key => $consulta ) {
		$modeloRelatorio->setLegValue(30, '', $consulta['consulta']);
                $modeloRelatorio->setLegValue(120, '', $consulta['quantidade']);
                $modeloRelatorio->setLegValue(180, '', $consulta['pto_nome']);
		$modeloRelatorio->setNewLine();
        }
        $modeloRelatorio->setNewLine();
        
        $modeloRelatorio->setLegValue(30, 'Total de Entrevistas');
        $modeloRelatorio->setNewLine();
        foreach ( $totalEntrevistas as $key => $consulta ){
            $modeloRelatorio->setLegValue(30, '', $consulta['sum']);
        }
        $modeloRelatorio->setNewLine();
        $modeloRelatorio->setNewLine();
        
        $modeloRelatorio->setLegValue(30, 'Dias por Portos');
        $modeloRelatorio->setLegValue(120, 'Portos');
        $modeloRelatorio->setNewLine();
        foreach ( $diasByPorto as $key => $consulta ){
            $modeloRelatorio->setLegValue(30, '', $consulta['count']);
            $modeloRelatorio->setLegValue(120, '', $consulta['pto_nome']);
            $modeloRelatorio->setNewLine();
        }
        $modeloRelatorio->setNewLine();
        $modeloRelatorio->setNewLine();
        
        $modeloRelatorio->setLegValue(30, 'Total de Dias monitorados');
        $modeloRelatorio->setNewLine();
        foreach ( $dias as $key => $consulta ){
            $modeloRelatorio->setLegValue(30, '', $consulta['count']);
        }
        $modeloRelatorio->setNewLine();
        $modeloRelatorio->setNewLine();
        $modeloRelatorio->setLegValue(30, 'Monitoramentos');
        $modeloRelatorio->setLegValue(120, 'Quantidade');
        $modeloRelatorio->setNewLine();
        foreach ( $selectMonitoramentos as $key => $consulta ) {
		$modeloRelatorio->setLegValue(30, '', $consulta['consulta']);
                $modeloRelatorio->setLegValue(120, '', $consulta['quantidade']);
		$modeloRelatorio->setNewLine();
        }
        $modeloRelatorio->setNewLine();
        
        $modeloRelatorio->setLegValue(30, 'Porto');
        $modeloRelatorio->setLegValue(120, 'Quantidade de Fichas');
        $modeloRelatorio->setNewLine();
        foreach ( $selectFichas as $key => $consulta ) {
		$modeloRelatorio->setLegValue(30, '', $consulta['pto_nome']);
                $modeloRelatorio->setLegValue(120, '', $consulta['quantidade']);
		$modeloRelatorio->setNewLine();
        }
        
        $modeloRelatorio->setNewLine();
        $modeloRelatorio->setNewLine();
        
        $modeloRelatorio->setLegValue(30, 'Subamostras');
        $modeloRelatorio->setLegValue(120, 'Quantidade');
        $modeloRelatorio->setNewLine();
        foreach ( $selectSubamostras as $key => $consulta ) {
		$modeloRelatorio->setLegValue(30, '', $consulta['consulta']);
                $modeloRelatorio->setLegValue(120, '', $consulta['quantidade']);
		$modeloRelatorio->setNewLine();
        }
	$pdf = $modeloRelatorio->getRelatorio();

	ob_end_clean();
        
        header('Content-Disposition: attachment;filename="rel_consulta.pdf"');
        header("Content-type: application/x-pdf");
        echo $pdf->render();
    }
    
    public function relatorioxlsAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);

        $consultaPadrao = new Application_Model_VConsultaPadrao();
        
	$selectConsulta = $consultaPadrao->select(); 
        $selectMonitoramentos = $consultaPadrao->selectMonitoramentos(); 
        $selectFichas = $consultaPadrao->selectFichas();
        $selectSubamostras = $consultaPadrao->selectSubamostras();
        $totalEntrevistas = $consultaPadrao->selectTotalEntrevistas();
        $diasByPorto = $consultaPadrao->selectDiasByPorto();
        $dias = $consultaPadrao->selectDias();
        
        $selectPortosByData = $consultaPadrao->selectPortosByData();
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();

        $objPHPExcel->setActiveSheetIndex(0);
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 0, 'Entrevistas por porto e por Arte');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 3, 'Artes de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 3, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 3, 'Porto');

        $linha = 4;
        foreach ($selectConsulta as $key => $consulta):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha,  $consulta['quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $linha, $consulta['pto_nome']);
            $linha++;
        endforeach;
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Total de Entrevistas');
            $linha++;
        
        foreach($totalEntrevistas as $key => $consultaEntrevistas):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consultaEntrevistas['sum']);
            $linha++;
        endforeach;
        
        
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Dias por Portos');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, 'Portos');
            $linha++;
        
            
        foreach ( $diasByPorto as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['count']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['pto_nome']);
            $linha++;
        endforeach;
            
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Total de Dias');
            $linha++;
         
            
        foreach ($dias as $key => $consulta):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['count']);
            $linha++;
        endforeach;
        
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Monitoramentos');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, 'Quantidade');
            $linha++;
            
        foreach ( $selectMonitoramentos as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['quantidade']);
            $linha++;
        endforeach;
        
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Portos');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, 'Quantidade de Fichas');
            $linha++;
            
        foreach ( $selectFichas as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['quantidade']);
            $linha++;
        endforeach;
        
            $linha++;
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Subamostras');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, 'Quantidade');
            $linha++;
            
        foreach ( $selectSubamostras as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['quantidade']);
            $linha++;
        endforeach;
        
        $linha++;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Entrevistas por Arte, porto e Data');
        $linha++;
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, 'Artes de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, 'Quantidade');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $linha, 'Porto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $linha, 'Mês');

        $linha++;
        foreach ($selectPortosByData as $key => $consulta):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha,  $consulta['quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $linha, $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $linha, $consulta['data_ficha']);
            $linha++;
        endforeach;
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="teste.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function relatoriomensalxlsAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $modelConsulta = new Application_Model_VConsultaPadrao();
        
        $relatorioMensal = $modelConsulta->selectRelatorioMensal();
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 0, 'Relatorio Mensal');
        $linha = 2;
        foreach ( $relatorioMensal as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['quantidade']);
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="relatorioMensal.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    
    public function entrevistapesqueiroAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $modelConsulta = new Application_Model_VConsultaPadrao();
        
        $relatorioMensal = $modelConsulta->selectEntrevistaPesqueiro();
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, 'Porto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 1, 'Arte de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 1, 'Pesqueiro');
        $linha = 2;
        foreach ( $relatorioMensal as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $linha, $consulta['paf_pesqueiro']);
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="consultaPesqueiroEntrevistas.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
    public function entrevistasbyhoraAction() {
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        
        $modelConsulta = new Application_Model_VConsultaPadrao();
        
        $relatorioMensal = $modelConsulta->selectEntrevistasByHora();
        
        require_once "../library/Classes/PHPExcel.php";

        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, 'Arte de Pesca');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 1, 'Quantidade de Entrevistas');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 1, 'Porto');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, 1, 'Horário');
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(4, 1, 'Mês/Ano');
        $linha = 2;
        foreach ( $relatorioMensal as $key => $consulta ):
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $linha, $consulta['consulta']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $linha, $consulta['quantidade']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $linha, $consulta['pto_nome']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $linha, $consulta['hora_chegada']);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(4, $linha, $consulta['mes']);
            $linha++;
        endforeach;
        
        
        
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="entrevistasPorHora.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
}

