$(document).ready(function(){
		//funcoes para formulários
    
		$('input[id*=id_]').attr("disabled", true);
		$('input[id*=id_]').css("background-color", "#cccccc");
		$('input[id*=id_]').attr("size", "3px");
		
		
		$('input[id*=numeric]').attr("size", "3px");
		$('input[id*=nome]').attr("size", "25px");
        
		function removeCampo() {
			$(".removerCampo").unbind("click");
			$(".removerCampo").bind("click", function () {
				if($("tr.linhas").length > 1){
					$(this).parent().parent().remove();
				}
			});
		}
        function removeCampo1() {
			$(".removerCampo1").unbind("click");
			$(".removerCampo1").bind("click", function () {
				if($("tr.linhas1").length > 1){
					$(this).parent().parent().remove();
				}
			});
		}
		$(".adicionarCampo").click(function () {
			novoCampo = $("tr.linhas:first").clone();
			novoCampo.find("input").val("");
			novoCampo.insertAfter("tr.linhas:last");
			removeCampo();
		});
		$(".adicionarCampo1").click(function () {
			novoCampo1 = $("tr.linhas1:first").clone();
			novoCampo1.find("input").val("");
			novoCampo1.insertAfter("tr.linhas1:last");
			removeCampo1();
		});
	   
		//funcoes para formularios
		
		
		//funcoes para entrevistas
	/*	
		if($('option').attr("value","Pesca de Linha")){
			$('#novaEntrevista').attr("href","EntrevistaPescaLinha.html");
		}
		else if($('option').attr("value","Arrasto de Fundo")){
			$('#novaEntrevista').attr("href","EntrevistaArrastoFundo.html");
		}
		else if($('option').attr("value","Pesca de Rede")){
			$('#novaEntrevista').attr("href","EntrevistaPescaRede.html");
		}
		else if($('option').attr("value","Mariscagem")){
			$('#novaEntrevista').attr("href","EntrevistaMariscagem.html");
		}
	*/	
		//funcoes para entrevistas
		
		
		//funções para menu-lateral
		if($("fieldset").attr('id') == "Social"){
			$("#Social").show();
                        $("#Filo").hide();
			$("#Dsbq").hide();
		}
		else if($("fieldset").attr('id') == "Desembarque"){
			$("#Dsbq").show();
			$("#Filo").hide();
			$("#Social").hide();
		}
		else if($("fieldset").attr('id') == "Filogenia"){
			$("#Dsbq").show();
			$("#Filo").show();
			$("#Social").hide();
			
		}
		else{
			$("#Dsbq").hide();
			$("#Filo").hide();
			$("#Social").hide();
		}
		


		$("#for-Social").click(function(){
                $("#Social").slideToggle();
        });
        $("#for-Dsbq").click(function(){
                $("#Dsbq").slideToggle();
        });
        $("#for-Filo").click(function(){
                $("#Filo").slideToggle();
        });
        //funcoes para menu
        
        

        
});
