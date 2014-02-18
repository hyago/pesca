
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
			$(".adicionarCampo").click(function () {
				novoCampo = $("tr.linhas:first").clone();
				novoCampo.find("input").val("");
				novoCampo.insertAfter("tr.linhas:last");
				removeCampo();
			});
	   
		//funcoes para formularios
		
		//funções para menu-lateral
		if($("fieldset").attr('id') == "Social"){
			$("#Social").show();
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
