$(document).ready(function() {
    //funcoes para formulários

    $('input[id*=id_]').attr("disabled", true);
    $('input[id*=id_]').css("background-color", "#cccccc");
    $('input[id*=id_]').attr("size", "3px");


    $('input[id*=numeric]').attr("size", "3px");


    function removeCampo() {
        $(".removerCampo").unbind("click");
        $(".removerCampo").bind("click", function() {
            if ($("tr.linhas").length > 1) {
                $(this).parent().parent().remove();
            }
        });
    }
    function removeCampo1() {
        $(".removerCampo1").unbind("click");
        $(".removerCampo1").bind("click", function() {
            if ($("tr.linhas1").length > 1) {
                $(this).parent().parent().remove();
            }
        });
    }
    $(".adicionarCampo").click(function() {
        novoCampo = $("tr.linhas:first").clone();
        novoCampo.find("input").val("");
        novoCampo.insertAfter("tr.linhas:last");
        removeCampo();
    });
    $(".adicionarCampo1").click(function() {
        novoCampo1 = $("tr.linhas1:first").clone();
        novoCampo1.find("input").val("");
        novoCampo1.insertAfter("tr.linhas1:last");
        removeCampo1();
    });

    //funcoes para formularios


    //funcoes para entrevistas

    if ($('select.option').attr("value", "Pesca de Linha")) {
        $('#novaEntrevista').attr("href", "EntrevistaPescaLinha.html");
    }
    else if ($('select.option').attr("value", "Arrasto de Fundo")) {
        $('#novaEntrevista').attr("href", "EntrevistaArrastoFundo.html");
    }
    else if ($('select.option').attr("value", "Pesca de Rede")) {
        $('#novaEntrevista').attr("href", "EntrevistaPescaRede.html");
    }
    else if ($('select.option').attr("value", "Mariscagem")) {
        $('#novaEntrevista').attr("href", "EntrevistaMariscagem.html");
    }

    //funcoes para entrevistas


    //funções para menu-lateral
    if ($("fieldset").attr('id') == "Social") {
        $("#Social").show();
        $("#Filo").hide();
        $("#Dsbq").hide();
    }
    else if ($("fieldset").attr('id') == "Desembarque") {
        $("#Dsbq").show();
        $("#Filo").hide();
        $("#Social").hide();
    }
    else if ($("fieldset").attr('id') == "Filogenia") {
        $("#Dsbq").show();
        $("#Filo").show();
        $("#Social").hide();

    }
    else {
        $("#Dsbq").hide();
        $("#Filo").hide();
        $("#Social").hide();
    }



    $("#for-Social").click(function() {
        $("#Social").slideToggle();
    });
    $("#for-Dsbq").click(function() {
        $("#Dsbq").slideToggle();
    });
    $("#for-Filo").click(function() {
        $("#Filo").slideToggle();
    });
    //funcoes para menu

    //Entrevistas
    $(function() {
        $("#accordion").accordion({
            heightStyle: "content"
        });
        $("#active").accordion("disabled");
    });
    //Entrevistas



});


$(function() {
    function removeCampoTelefonesPescador() {
        $(".removeCampoTelefonesPescador").unbind("click");
        $(".removeCampoTelefonesPescador").bind("click", function() {
            if ($("tr.tr_listasTelefonesPescador").length > 1) {
                $(this).parent().parent().remove();
            }
        });
    }
    removeCampoTelefonesPescador();
    $(".adicionarCampoTelefonesPescador").click(function() {
        novoCampo1 = $("tr.tr_listasTelefonesPescador:first").clone();
        novoCampo1.find("input").val("");
        novoCampo1.insertAfter("tr.tr_listasTelefonesPescador:last");
        removeCampoTelefonesPescador();
    });
});

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Teste de Cadastro de itens /_/_/_/_/_/_/_/_/_/_/_/_/_/
function teste( localTeste )
{
    location.replace( localTeste );
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ MENSAGEM DE CONFIRMAÇÃO /_/_/_/_/_/_/_/_/_/_/_/_/_/
function beforeDelete(id)
{
//    var tmpString = document.URL;
//    tmpString = tmpString.slice(7, tmpString.length);
//    tmpString = tmpString.split("/");
//    tmpString = tmpString[0];
//    var delString = "http://";
//    delString = delString.concat(tmpString, id)
//
//    if (confirm("Realmente deseja excluir este item?")) {
//        location.replace(delString);
////                    location.href( delString ); Não funcionou para este caso!!!
//    }
    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(id);
    }
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Dependente /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumDependente = 1000;
function addRowDependente(frm, id) {
    rowNumDependente++;

    if (frm.inputQuantidadeDependente.value) {

        var linhaDependente = '<div class="noEditable"><p id="rowNumDependente' + rowNumDependente + '">';
        linhaDependente = linhaDependente.concat('<input type="button" value="Remove" onclick="removeRowNumDependente(' + rowNumDependente + ');">');

        linhaDependente = linhaDependente.concat('<input type="text" readonly size="15" name="inputQuantidadeDependente[]" value="' + frm.inputQuantidadeDependente.value + '">');

        linhaDependente = linhaDependente.concat('<input type="text" readonly size="10" name="inputTipoDependente[]" " value="' + frm.SelectDependente[frm.SelectDependente.selectedIndex].text + '">');
        linhaDependente = linhaDependente.concat('<input type="text" readonly size="2" name="inputTipoDependenteID[]" " value="' + frm.SelectDependente.value + '">');

        linhaDependente = linhaDependente.concat('<br></p></div>');

        jQuery('#itemDependenteRows').append(linhaDependente);
        
         location.replace( id );
    }
}

function removeRowNumDependente(localRowNumDependente) {
    jQuery('#rowNumDependente' + localRowNumDependente).remove();
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowRenda = 1000;
function addRowRenda(frm) {
    rowRenda++;

    var linhaRendas = '<div class="noEditable"><p id="rowRenda' + rowRenda + '">';
    linhaRendas = linhaRendas.concat('<input type="button" value="Remove" onclick="removeRowRenda(' + rowRenda + ');">');

    linhaRendas = linhaRendas.concat('<input type="text" readonly size="15" name="inputRenda[]" value="' + frm.SelectRenda[frm.SelectRenda.selectedIndex].text + '">');
    linhaRendas = linhaRendas.concat('<input type="text" readonly size="8" name="inputRendaID[]" value="' + frm.SelectRenda.value + '">');

    linhaRendas = linhaRendas.concat('<input type="text" readonly size="15" name="inputTipoRenda[]" value="' + frm.SelectTipoRenda[frm.SelectTipoRenda.selectedIndex].text + '">');
    linhaRendas = linhaRendas.concat('<input type="text" readonly size="8" name="inputTipoRendaID[]" value="' + frm.SelectTipoRenda.value + '">');
    linhaRendas = linhaRendas.concat('<br></p></div>');

    jQuery('#itemRendaRows').append(linhaRendas);
    frm.inputTelefone.value = '';
    frm.selectTipoTelefone.value = '';
}


function removeRowRenda(localRowRenda) {
    jQuery('#rowRenda' + localRowRenda).remove();
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumTelefone = 1000;
function addRowPhone(frm) {
    rowNumTelefone++;

    var tmpTelefone = frm.inputTelefone.value;
    var tmpSelectText = frm.selectTipoTelefone[frm.selectTipoTelefone.selectedIndex].text;
    var tmpSelectID = frm.selectTipoTelefone.value;

    if (tmpSelectText && tmpTelefone) {

        var linhaTelefones = '<div class="noEditable"><p id="rowNumTelefone' + rowNumTelefone + '">';
        linhaTelefones = linhaTelefones.concat('<input type="button" value="Remove" onclick="removeRowNumTelefone(' + rowNumTelefone + ');">');
        linhaTelefones = linhaTelefones.concat('<input type="text" readonly size="15" name="inputTelefone[]" class="telefone" value="' + tmpTelefone + '">');
        linhaTelefones = linhaTelefones.concat('<input type="text" readonly size="15" name="inputTipo[]" value="' + tmpSelectText + '">');
        linhaTelefones = linhaTelefones.concat('<input type="text" readonly size="8" name="inputTipoID[]" value="' + tmpSelectID + '">');
        linhaTelefones = linhaTelefones.concat('<br></p></div>');

        jQuery('#rowNumTelefone').append(linhaTelefones);
        frm.inputTelefone.value = '';
        frm.selectTipoTelefone.value = '';
    }
}

function removeRowNumTelefone(localRowNumTelefone) {
    jQuery('#rowNumTelefone' + localRowNumTelefone).remove();
}


//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumColonia = 1000;
function addRowColonia(frm) {
    rowNumColonia++;

    var linhaColonia = '<div class="noEditable"><p id="itemColoniaRows' + rowNumColonia + '">';
    linhaColonia = linhaColonia.concat('<input type="button" value="Remove" onclick="removeRowNumColonia(' + rowNumColonia + ');">');

    linhaColonia = linhaColonia.concat('<input type="text" readonly size="15" name="inputDataInscricaoColonia[]" id="data_Insc" value="' + frm.inputDataInscricaoColonia.value + '">');


    linhaColonia = linhaColonia.concat('<input type="text" readonly size="15" name="inputColonia[]" " value="' + frm.SelectColonia[frm.SelectColonia.selectedIndex].text + '">');
    linhaColonia = linhaColonia.concat('<input type="text" readonly size="2" name="inputColoniaID[]" " value="' + frm.SelectColonia.value + '">');

    linhaColonia = linhaColonia.concat('<br></p></div>');

    jQuery('#itemColoniaRows').append(linhaColonia);
}

function removeRowNumColonia(localRowNumColonia) {
    jQuery('#itemColoniaRows' + localRowNumColonia).remove();
}
//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ AreaPesca /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumArea = 1000;
function addRowAreaPesca(frm) {
    rowNumArea++;

    var linhaArea = '<div class="noEditable"><p id="linhaAreaPescaRows' + rowNumArea + '">';
    linhaArea = linhaArea.concat('<input type="button" value="Remove" onclick="removeRowAreaPesca(' + rowNumArea + ');">');

    linhaArea = linhaArea.concat('<input type="text" readonly size="10" name="inputArea[]" value="' + frm.selectAreaPesca[frm.selectAreaPesca.selectedIndex].text + '">');
    linhaArea = linhaArea.concat('<input type="text" readonly size="2" name="inputAreaID[]" value="' + frm.selectAreaPesca.value + '">');

    linhaArea = linhaArea.concat('<br></p></div>');

    jQuery('#itemAreaPescaRows').append(linhaArea);
}

function removeRowAreaPesca(localRowNumArea) {
    jQuery('#linhaAreaPescaRows' + localRowNumArea).remove();
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ ArtePesca /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumArte = 1000;
function addRowArte(frm) {
    rowNumArte++;

    var linhaArte = '<div class="noEditable"><p id="linhaArteTipoRows' + rowNumArte + '">';
    linhaArte = linhaArte.concat('<input type="button" value="Remove" onclick="removeRowNumArte(' + rowNumArte + ');">');

    linhaArte = linhaArte.concat('<input type="text" readonly size="10" name="inputTipo[]" " value="' + frm.selectTipocapturada[frm.selectTipocapturada.selectedIndex].text + '">');
    linhaArte = linhaArte.concat('<input type="text" readonly size="2" name="inputTipoID[]" " value="' + frm.selectTipocapturada.value + '">');

    linhaArte = linhaArte.concat('<input type="text" readonly size="10" name="inputArte[]" " value="' + frm.SelectArtePesca[frm.SelectArtePesca.selectedIndex].text + '">');
    linhaArte = linhaArte.concat('<input type="text" readonly size="2" name="inputArteID[]" " value="' + frm.SelectArtePesca.value + '">');

    linhaArte = linhaArte.concat('<br></p></div>');

    jQuery('#itemArteTipoRows').append(linhaArte);
}

function removeRowNumArte(localRowNumArte) {
    jQuery('#linhaArteTipoRows' + localRowNumArte).remove();
}

//            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
var rowNumEmbarcacao = 1000;
function addRowEmbarcacao(frm) {
    rowNumEmbarcacao++;

    var linhaEmbarcacao = '<div class="noEditable"><p id="itemEmbarcacoesRows' + rowNumEmbarcacao + '">';
    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="button" value="Remove" onclick="removeRowNumEmbarcacao(' + rowNumEmbarcacao + ');">');

    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="10" name="inputMotor[]" value="' + frm.selectMotorEmbarcacao[frm.selectMotorEmbarcacao.selectedIndex].text + '">');
    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="2" name="inputMotorID[]" value="' + frm.selectMotorEmbarcacao.value + '">');

    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="10" name="inputPorte[]" " value="' + frm.selectPorteEmbarcacao[frm.selectPorteEmbarcacao.selectedIndex].text + '">');
    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="2" name="inputPorteID[]" " value="' + frm.selectPorteEmbarcacao.value + '">');

    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="10" name="inputBarco[]" " value="' + frm.selectTipoEmbarcacao[frm.selectTipoEmbarcacao.selectedIndex].text + '">');
    linhaEmbarcacao = linhaEmbarcacao.concat('<input type="text" readonly size="2" name="inputBarcoID[]" " value="' + frm.selectTipoEmbarcacao.value + '">');

    linhaEmbarcacao = linhaEmbarcacao.concat('<br></p></div>');

    jQuery('#itemEmbarcacoesRows').append(linhaEmbarcacao);
}

function removeRowNumEmbarcacao(localRowNumEmbarcacao) {
    jQuery('#itemEmbarcacoesRows' + localRowNumEmbarcacao).remove();
}

