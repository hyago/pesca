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

	//ob_end_clean();
        
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

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        ob_end_clean();

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="teste.xls"');
        header('Cache-Control: max-age=0');

        ob_end_clean();
        $objWriter->save('php://output');
    }
}
