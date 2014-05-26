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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsBuscaPescadorId( frm, pag )
{
    if ( frm.inputId.value ) {
        var tmpUpdate = (pag + '/index/tp_id/' + frm.inputId.value  );
        
        location.replace( tmpUpdate );
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsBuscaPescadorNome( frm, pag )
{
    if ( frm.inputNome.value ) {
        var tmpUpdate = (pag + '/index/tp_nome/' + frm.inputNome.value  );
        
        location.replace( tmpUpdate );
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsClearBuscaPescador( pag )
{
        location.hash = '';
        location.replace( pag );
}

function scrollTo(hash) {
    location.hash = "#" + hash;
    location.hash = '';
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorEndereco( frm, pag )
{
    var TmpUrl = ('#top');

    var tmpUpdate = (pag +
            '/tp_nome/' + frm.nome.value +
            '/tp_sexo/' + frm.sexo.value +
            '/tp_rg/' + frm.rg.value +
            '/tp_cpf/' + frm.cpf.value +
            '/tp_apelido/' + frm.apelido.value +
            '/tp_matricula/' + frm.matricula.value +
            '/tp_filiacaopai/' + frm.filiacaoPai.value +
            '/tp_filiacaomae/' + frm.filiacaoMae.value +
            '/tp_ctps/' + frm.ctps.value +
            '/tp_pis/' + frm.pis.value +
            '/tp_inss/' + frm.inss.value +
            '/tp_nit_cei/' + frm.nit_cei.value +
            '/tp_cma/' + frm.cma.value +
            '/tp_rgb_maa_ibama/' + frm.rgb_maa_ibama.value +
            '/tp_cir_cap_porto/' + frm.cir_cap_porto.value +
            '/tp_datanasc/' + frm.dataNasc.value +
            '/tmun_id_natural/' + frm.municipioNat.value +
            '/esc_id/' + frm.selectEscolaridadeId.value +
 
            '/te_logradouro/' + frm.logradouro.value +
            '/te_numero/' + frm.numero.value +
            '/te_bairro/' + frm.bairro.value +
            '/te_cep/' + frm.cep.value +
            '/te_comp/' + frm.complemento.value +
            '/tmun_id/' + frm.municipio.value +
 
            '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Endereço /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsAtualizarPescadorEndereco( frm, pag )
{
    var TmpUrl = ('#top');

    var tmpUpdate = (pag +
            '/tp_id/' + frm.idPescador.value +
            '/tp_nome/' + frm.nome.value +
            '/tp_sexo/' + frm.sexo.value +
            '/tp_rg/' + frm.rg.value +
            '/tp_cpf/' + frm.cpf.value +
            '/tp_apelido/' + frm.apelido.value +
            '/tp_matricula/' + frm.matricula.value +
            '/tp_filiacaopai/' + frm.filiacaoPai.value +
            '/tp_filiacaomae/' + frm.filiacaoMae.value +
            '/tp_ctps/' + frm.ctps.value +
            '/tp_pis/' + frm.pis.value +
            '/tp_inss/' + frm.inss.value +
            '/tp_nit_cei/' + frm.nit_cei.value +
            '/tp_cma/' + frm.cma.value +
            '/tp_rgb_maa_ibama/' + frm.rgb_maa_ibama.value +
            '/tp_cir_cap_porto/' + frm.cir_cap_porto.value +
            '/tp_datanasc/' + frm.dataNasc.value +
            '/tmun_id_natural/' + frm.municipioNat.value +
            '/esc_id/' + frm.selectEscolaridadeId.value +
 
            '/te_id/' + frm.idEndereco.value +
            '/te_logradouro/' + frm.logradouro.value +
            '/te_numero/' + frm.numero.value +
            '/te_bairro/' + frm.bairro.value +
            '/te_cep/' + frm.cep.value +
            '/te_comp/' + frm.complemento.value +
            '/tmun_id/' + frm.municipio.value +
 
            '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Perfil /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPerfil( frm, pag )
{
    if (frm.inputTP_ID.value) {

        var tmpUpdate = ( '/perfil/update' + '/tp_id/' + frm.inputTP_ID.value + '/tp_perfil/' + frm.inputTP_Perfil.value);

        location.replace(tmpUpdate);
        
        return;
    }
    if (frm.inputTP_Perfil.value) {

        var tmpUpdate = (pag + '/tp_perfil/' + frm.inputTP_Perfil.value);

        location.replace(tmpUpdate);
    }
}

function jsDeletePerfil( idPerfil, pag )
{
    if (confirm("Realmente deseja excluir este item?")) {
        
        var tmpUpdate = (pag + '/tp_id/' + idPerfil);
        
        location.replace(tmpUpdate);
    }
}

function jsUpdatePerfil( tp_id, tp_perfil, frm )
{
    if ( confirm("Realmente deseja EDITAR este item?") ) {
        frm.inputTP_Perfil.value = tp_perfil;
        frm.inputTP_ID.value = tp_id;
    }
}

function jsReloadPerfil( frm ){
    if ( frm.inputTP_ID.value || frm.inputTP_Perfil.value) {
        location.replace('/perfil');
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasDependente( frm, pag )
{
    if (frm.inputQuantidadeDependente.value) {
        var TmpUrl = (+frm.idPescador.value + '#ancora_dependentes');

        var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idDependente/' + frm.SelectDependente.value + '/quant/' + frm.inputQuantidadeDependente.value + '/back_url/' + TmpUrl);
 
        location.replace( tmpUpdate );
    }
}

function jsDeletePescadorHasDependente(idDep, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_dependentes');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idDependente/' + idDep+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasRenda( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_rendas');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idTipoRenda/' + frm.SelectTipoRenda.value + '/idRenda/' + frm.SelectRenda.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasRenda(idTipoRenda, idRenda, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_rendas');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idTipoRenda/'+idTipoRenda+'/idRenda/'+ idRenda+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasTelefone( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_telefones');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idTelenone/' + frm.selectTipoTelefone.value + '/nTelefone/' + frm.inputTelefone.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasTelefone(idTeleone, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_telefones');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idTelenone/'+idTeleone+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasColonia( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_colonias');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idColonia/' + frm.SelectColonia.value + '/dtaColonia/' + frm.inputDataInscricaoColonia.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasColonia( idColonia, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_colonias');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idColonia/'+idColonia+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Area /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasArea( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_areas');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idArea/' + frm.selectAreaPesca.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasArea( idArea, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_areas');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idArea/'+idArea+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Arte/Tipo /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasArteTipo( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_artetipos');

   var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idArte/' + frm.SelectArtePesca.value + '/idTipo/' + frm.selectTipocapturada.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasArteTipo( idArte, idTipo, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_artetipos');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idArte/' + idArte + '/idTipo/' + idTipo + '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasEmbarcacoes( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_embarcacoes');

   var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idEmbarcacao/' + frm.selectTipoEmbarcacao.value + '/idPorte/' + frm.selectPorteEmbarcacao.value + '/isMotor/' + frm.selectMotorEmbarcacao.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasEmbarcacoes(idEmbarcacao, idPorte, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_embarcacoes');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idEmbarcacao/' + idEmbarcacao + '/idPorte/' + idPorte + '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}


///_/_/_/_/_/_/_/_/_/_/_/_/_/ MENSAGEM DE CONFIRMAÇÃO /_/_/_/_/_/_/_/_/_/_/_/_/_/
function beforeDelete(id)
{
    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(id);
    }
}

////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Dependente /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumDependente = 1000;
//function addRowDependente(frm) {
//    rowNumDependente++;
//
//    if (frm.inputQuantidadeDependente.value) {
//        var linhaDependente = '<tr id="rowNumDependente' + rowNumDependente + '">';
//        linhaDependente = linhaDependente.concat('<td> <input type="text" readonly size=2 name="inputTipoDependenteID[]" value="' + frm.SelectDependente.value +'"/></td>');
//        linhaDependente = linhaDependente.concat('<td name="inputTipoDependente[]" >' + frm.SelectDependente[frm.SelectDependente.selectedIndex].text + '</td>');
//        linhaDependente = linhaDependente.concat('<td> <input type="text" readonly name="inputQuantidadeDependente[]" value="' + frm.inputQuantidadeDependente.value + '"/></td>');
//        linhaDependente = linhaDependente.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowNumDependente(' + rowNumDependente + ');"></td>');
//        linhaDependente = linhaDependente.concat('</tr>');
//
//        jQuery('#tblDependentes').append(linhaDependente);
//    }
//}
//
//function removeRowNumDependente(localRowNumDependente) {
//    jQuery('#rowNumDependente' + localRowNumDependente).remove();
//}
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Renda /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowRenda = 1000;
//function addRowRenda(frm) {
//    rowRenda++;
//
//    var linhaRendas = '<tr id="rowRenda' + rowRenda + '">';
//    linhaRendas = linhaRendas.concat('<td> <input type="text" readonly size=2 name="inputTipoRendaID[]" value="' + frm.SelectTipoRenda.value +'"/></td>');
//    linhaRendas = linhaRendas.concat('<td name="inputTipoRenda[]" >' + frm.SelectTipoRenda[frm.SelectTipoRenda.selectedIndex].text + '</td>');
//    linhaRendas = linhaRendas.concat('<td> <input type="text" readonly size=2 name="inputRendaID[]" value="' + frm.SelectRenda.value +'"/></td>');
//    linhaRendas = linhaRendas.concat('<td name="inputRenda[]" >' + frm.SelectRenda[frm.SelectRenda.selectedIndex].text + '</td>');
//    linhaRendas = linhaRendas.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowRenda(' + rowRenda + ');"></td>');
//    linhaRendas = linhaRendas.concat('</tr>');
//
//    jQuery('#tblRenda').append(linhaRendas);
//}
//
//
//function removeRowRenda(localRowRenda) {
//    jQuery('#rowRenda' + localRowRenda).remove();
//}
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Telefone /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumTelefone = 1000;
//function addRowPhone(frm) {
//    rowNumTelefone++;
//
//    var tmpTelefone = frm.inputTelefone.value;
//    var tmpSelectText = frm.selectTipoTelefone[frm.selectTipoTelefone.selectedIndex].text;
//    var tmpSelectID = frm.selectTipoTelefone.value;
//
//    if (tmpSelectText && tmpTelefone) {
//
//        var linhaTelefones = '<tr id="rowNumTelefone' + rowNumTelefone + '">';
//        linhaTelefones = linhaTelefones.concat('<td> <input type="text" readonly size=2 name="inputTipoID[]" value="' + tmpSelectID + '"/></td>');
//        linhaTelefones = linhaTelefones.concat('<td name="inputTipo[]" >' + tmpSelectText + '</td>');
//        linhaTelefones = linhaTelefones.concat('<td> <input type="text" readonly name="inputTelefone[]" classe="telefone" value="' + tmpTelefone + '"/></td>');
//        linhaTelefones = linhaTelefones.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowNumTelefone(' + rowNumTelefone + ');"></td>');
//        linhaTelefones = linhaTelefones.concat('</tr>');
//
//        jQuery('#tblTelefones').append(linhaTelefones);
//        frm.inputTelefone.value = '';
//        frm.selectTipoTelefone.value = '';
//    }
//}
//
//function removeRowNumTelefone(localRowNumTelefone) {
//    jQuery('#rowNumTelefone' + localRowNumTelefone).remove();
//}
//
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Colonia /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumColonia = 1000;
//function addRowColonia(frm) {
//    rowNumColonia++;
//
//    var linhaColonia = '<tr id="rowNumColonias' + rowNumArea + '">';
//    linhaColonia = linhaColonia.concat('<td> <input type="text" readonly size=2 name="inputColoniaID[]" value="' + frm.SelectColonia.value + '"/></td>');
//    linhaColonia = linhaColonia.concat('<td name="inputColonia[]" >' + frm.SelectColonia[frm.SelectColonia.selectedIndex].text + '</td>');
//    linhaColonia = linhaColonia.concat('<td> <input type="date" readonly size=2 name="inputDataInscricaoColonia[]" value="' + frm.inputDataInscricaoColonia.value + '"/></td>');
//    linhaColonia = linhaColonia.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowNumColonia(' + rowNumArea + ');"></td>');
//    linhaColonia = linhaColonia.concat('</tr>');
//
//    jQuery('#tblColonias').append(linhaColonia);
//}
//
//function removeRowNumColonia(localRowNumColonia) {
//    jQuery('#rowNumColonias' + localRowNumColonia).remove();
//}
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ AreaPesca /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumArea = 1000;
//function addRowAreaPesca(frm) {
//    rowNumArea++;
//
//    var linhaArea = '<tr id="linhaAreaPescaRows' + rowNumArea + '">';
//    linhaArea = linhaArea.concat('<td> <input type="text" readonly size=2  name="inputArteID[]" value="' + frm.selectAreaPesca.value + '"/></td>');
//    linhaArea = linhaArea.concat('<td name="inputArte[]" >' + frm.selectAreaPesca[frm.selectAreaPesca.selectedIndex].text + '</td>');
//    linhaArea = linhaArea.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowAreaPesca(' + rowNumArea + ');"></td>');
//    linhaArea = linhaArea.concat('</tr>');
//
//    jQuery('#tblAreaPesca').append(linhaArea);
//}
//
//function removeRowAreaPesca(localRowNumArea) {
//    jQuery('#linhaAreaPescaRows' + localRowNumArea).remove();
//}
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ ArtePesca /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumArte = 1000;
//function addRowArte(frm) {
//    rowNumArte++;
//
//    var linhaArte = '<tr id="linhaArteTipoRows' + rowNumArte + '">';
//    linhaArte = linhaArte.concat('<td> <input type="text" readonly size=2  name="inputArteID[]" value="' + frm.SelectArtePesca.value + '"/></td>');
//    linhaArte = linhaArte.concat('<td name="inputArte[]" >' + frm.SelectArtePesca[frm.SelectArtePesca.selectedIndex].text + '</td>');
//    linhaArte = linhaArte.concat('<td> <input type="text" readonly size=2  name="inputTipoID[]"value="' + frm.selectTipocapturada.value + '"/></td>');
//    linhaArte = linhaArte.concat('<td name="inputTipo[]" >' + frm.selectTipocapturada[frm.selectTipocapturada.selectedIndex].text + '</td>');
//    linhaArte = linhaArte.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowNumArte(' + rowNumArte + ');"></td>');
//    linhaArte = linhaArte.concat('</tr>');
//
//    jQuery('#tblArteTipoPescas').append(linhaArte);
//}
//
//function removeRowNumArte(localRowNumArte) {
//    jQuery('#linhaArteTipoRows' + localRowNumArte).remove();
//}
//
////            /_/_/_/_/_/_/_/_/_/_/_/_/_/ Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
//var rowNumEmbarcacao = 1000;
//function addRowEmbarcacao(frm) {
//    rowNumEmbarcacao++;
//
//    var linhaEmbarcacao = '<tr id="itemEmbarcacoesRows' + rowNumEmbarcacao + '">';
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td> <input type="text" readonly size=2 name="inputBarcoID[]" value="' + frm.selectTipoEmbarcacao.value + '"/></td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td name="inputBarco[]" >' + frm.selectTipoEmbarcacao[frm.selectTipoEmbarcacao.selectedIndex].text + '</td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td> <input type="text" readonly size=2 name="inputPorteID[]" value="' + frm.selectPorteEmbarcacao.value + '"/></td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td name="inputPorte[]" >' + frm.selectPorteEmbarcacao[frm.selectPorteEmbarcacao.selectedIndex].text + '</td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td> <input type="text" readonly size=2 name="inputMotorID[]" value="' + frm.selectMotorEmbarcacao.value + '"/></td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td name="inputMotor[]" >' + frm.selectMotorEmbarcacao[frm.selectMotorEmbarcacao.selectedIndex].text + '</td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('<td><input type="button" class="button-del" width="5%" onclick="removeRowNumEmbarcacao(' + rowNumEmbarcacao + ');"></td>');
//    linhaEmbarcacao = linhaEmbarcacao.concat('</tr>');
//
//    jQuery('#tblEmbarcacoes').append(linhaEmbarcacao);
//}
//
//function removeRowNumEmbarcacao(localRowNumEmbarcacao) {
//    jQuery('#itemEmbarcacoesRows' + localRowNumEmbarcacao).remove();
//}
//
