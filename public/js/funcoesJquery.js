$(document).ready(function() {
    //funções para menu-lateral
    if ($("fieldset").attr('id') === "Social") {
        $("#Social").show();
        $("#Filo").hide();
        $("#Dsbq").hide();
        $("#Entrevista").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "Desembarque") {
        $("#Dsbq").show();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Entrevista").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "Filogenia") {
        $("#Dsbq").show();
        $("#Filo").show();
        $("#Social").hide();
        $("#Entrevista").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "Entrevista"){
        $("#Dsbq").show();
        $("#Entrevista").show();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "Relatorio"){
        $("#Dsbq").hide();
        $("#Entrevista").hide();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").show();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "RelListas"){
        $("#Dsbq").hide();
        $("#Entrevista").hide();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").show();
        $("#RelListas").show();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if ($("fieldset").attr('id') === "RelConsolidados"){
        $("#Dsbq").hide();
        $("#Entrevista").hide();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").show();
        $("#RelListas").hide();
        $("#RelConsolidados").show();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
    }
    else if($("fieldset").attr('id') === "Amostras"){
        $("#Entrevista").hide();
        $("#Dsbq").hide();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").show();
    }
    else {
        $("#Entrevista").hide();
        $("#Dsbq").hide();
        $("#Filo").hide();
        $("#Social").hide();
        $("#Relatorio").hide();
        $("#RelListas").hide();
        $("#RelConsolidados").hide();
        $("#RelPescador").hide();
        $("#RelPerfilSocial").hide();
        $("#RelDesembarque").hide();
        $("#Amostras").hide();
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
    $("#for-Entrevista").click(function(){
        $("#Entrevista").slideToggle();
    });
    $("#for-Relatorio").click(function(){
        $("#Relatorio").slideToggle();
    });
    $("#for-RelListas").click(function(){
        $("#RelListas").slideToggle();
    });
    $("#for-RelConsolidados").click(function(){
        $("#RelConsolidados").slideToggle();
    });
    $("#for-RelPescador").click(function(){
        $("#RelPescador").slideToggle();
    });
    $("#for-RelPerfilSocial").click(function(){
        $("#RelPerfilSocial").slideToggle();
    });
    $("#for-RelDesembarque").click(function(){
        $("#RelDesembarque").slideToggle();
    });
    $("#for-Amostra").click(function(){
        $("#Amostras").slideToggle();
    });
    //funcoes para menu
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
function jsBuscaPescadorApelido( frm, pag )
{
    if ( frm.inputApelido.value ) {
        var tmpUpdate = (pag + '/index/tp_apelido/' + frm.inputApelido.value  );
        
        location.replace( tmpUpdate );
    }
}
function jsBuscaBarcoEntrevista( frm, pag )
{
    if ( frm.inputBarco.value ) {
        var tmpUpdate = (pag + '/bar_nome/' + frm.inputBarco.value  );
        
        location.replace( tmpUpdate );
    }
}
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsBuscaEntrevistaId( frm, pag )
{
    if ( frm.inputId.value ) {
        var tmpUpdate = (pag + '/ent_id/' + frm.inputId.value  );
        
        location.replace( tmpUpdate );
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Entrevistas /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsBuscaPescadorEntrevista( frm, pag )
{
    if ( frm.inputPescador.value ) {
        var tmpUpdate = (pag + '/tp_nome/' + frm.inputPescador.value  );
        
        location.replace( tmpUpdate );
    }
}
//Necessário quando é na index
function jsBuscaPescadorGeral( frm, pag )
{
    if ( frm.inputPescador.value ) {
        var tmpUpdate = (pag + '/index/tp_nome/' + frm.inputPescador.value  );
        
        location.replace( tmpUpdate );
    }
}
function jsBuscaBarcoGeral( frm, pag )
{
    if ( frm.inputBarco.value ) {
        var tmpUpdate = (pag + '/index/bar_nome/' + frm.inputBarco.value  );
        
        location.replace( tmpUpdate );
    }
}
function jsEditarEntrevistas(nomeArtePesca,idEntrevista) {
            var Entrevista;
            if (nomeArtePesca.toLowerCase() === "Arrasto-Fundo".toLowerCase()) {
                Entrevista = "arrasto-fundo";
            }
            else if (nomeArtePesca.toLowerCase() === "Calão".toLowerCase()) {
                Entrevista = 'calao';
            }
            else if (nomeArtePesca.toLowerCase() === "Espinhel/Groseira".toLowerCase()) {
                Entrevista = 'grosseira';
            }
            else if (nomeArtePesca.toLowerCase() === "Pesca de Linha".toLowerCase()) {
                Entrevista = 'linha';
            }
            else if (nomeArtePesca.toLowerCase() === "Emalhe".toLowerCase()) {
                Entrevista = 'emalhe';
            }
            else if (nomeArtePesca.toLowerCase() === "Tarrafa".toLowerCase()) {
                Entrevista = 'tarrafa';
            }
            else if (nomeArtePesca.toLowerCase() === "Vara de Pesca".toLowerCase()) {
                Entrevista = 'vara-pesca';
            }
            else if (nomeArtePesca.toLowerCase() === "Jereré".toLowerCase()) {
                Entrevista = 'jerere';
            }
            else if (nomeArtePesca.toLowerCase() === "Manzuá".toLowerCase()) {
                Entrevista = 'manzua';
            }
            else if (nomeArtePesca.toLowerCase() === "Ratoeira".toLowerCase()) {
                Entrevista = 'ratoeira';
            }
            else if (nomeArtePesca.toLowerCase() === "Coleta Manual".toLowerCase()) {
                Entrevista = 'coleta-manual';
            }
            else if (nomeArtePesca.toLowerCase() === "Mergulho".toLowerCase()) {
                Entrevista = 'mergulho';
            }
            else if (nomeArtePesca.toLowerCase() === "Linha de Fundo".toLowerCase()) {
                Entrevista = 'linha-fundo';
            }
            else if (nomeArtePesca.toLowerCase() === "Siripóia".toLowerCase()) {
                Entrevista = 'siripoia';
            }
            else
                Entrevista = 'error';
            var pag = (Entrevista + '/editar');
            var tmpUpdate = (pag + '/id/' + idEntrevista);
            location.replace(tmpUpdate);
}

function jsClearBuscaEntrevista( pag )
{
        location.hash = '';
        location.replace( pag );
}



///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Dependentes /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsClearBuscaPescador( pag )
{
        location.hash = '';
        location.replace( pag );
}
function jsBuscaTodosPescadores( pag )
{
        location.hash = '';
        location.replace( pag );
}

function scrollTo(hash) {
    location.hash = "#" + hash;
    location.hash = '';
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Fichas diárias /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsClearBuscaFichaDiaria( pag )
{
    location.hash = '';
    location.replace(pag);
}
function jsBuscaTodasFichas( pag )
{
    location.hash = '';
    location.replace(pag);
}

function jsBuscaFichaDiariaId( frm, pag )
{
    if ( frm.inputId.value ) {
        var tmpUpdate = (pag + '/index/fd_id/' + frm.inputId.value  );
               
        location.replace( tmpUpdate );
    }
}

function jsBuscaFichaDiariaPortoData( frm, pag )
{
    if ( frm.selectPortoName.value ) {
        var tmpUpdate = (pag + '/index/pto_id/' + frm.selectPortoName.value);
        
        location.replace( tmpUpdate );
    }
}
function jsBuscaFichaDiariaData( frm, pag )
{
    if ( frm.inputDate.value ) {
        var tmpUpdate = (pag + '/index/pto_id/'+'/fd_data/'+ frm.inputDate.value );
        
        location.replace( tmpUpdate );
    }
}

function jsBuscaApelidoEntrevista( frm, pag )
{
    if ( frm.inputApelido.value ) {
        var tmpUpdate = (pag + '/tp_apelido/' + frm.inputApelido.value  );
        
        location.replace( tmpUpdate );
    }
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
            '/tp_resp_lan/' + frm.respLancamento.value +
            '/tp_resp_cad/' + frm.respCadastro.value +
            '/tp_obs/' + frm.obs.value +
            '/tpr_id/' + frm.selectProjeto.value +
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
            '/tp_resp_lan/' + frm.respLancamento.value +
            '/tp_resp_cad/' + frm.respCadastro.value +
            '/tp_obs/' + frm.obs.value +
 
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
///_/_/_/_/_/_/_/_/_/_/_/_/_/ DestinoPescado /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertDestinoPescado( frm, pag )
{
    if (frm.inputdp_id.value) {

        var tmpUpdate = ( '/destino-pescado/update' + '/dp_id/' + frm.inputdp_id.value + '/dp_destino/' + frm.inputdp_destino.value);

        location.replace(tmpUpdate);
        
        return;
    }
    if (frm.inputdp_destino.value) {

        var tmpUpdate = (pag + '/dp_destino/' + frm.inputdp_destino.value);

        location.replace(tmpUpdate);
    }
}

function jsDeleteDestinoPescado( idDestino, pag )
{
    if (confirm("Realmente deseja excluir este item?")) {
        
        var tmpUpdate = (pag + '/dp_id/' + idDestino);
        
        location.replace(tmpUpdate);
    }
}

function jsUpdateDestinoPescado( dp_id, dp_destino, frm )
{
    if ( confirm("Realmente deseja EDITAR este item?") ) {
        frm.inputdp_destino.value = dp_destino;
        frm.inputdp_id.value = dp_id;
    }
}

function jsReloadDestinoPescado( frm ){
    if ( frm.inputdp_id.value || frm.inputdp_destino.value) {
        location.replace('/destino-pescado');
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
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Comunidade /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasComunidade( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_comunidade');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idComunidade/' + frm.selectComunidade.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasComunidade( idComunidade, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_comunidade');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idComunidade/'+idComunidade+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Porto /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasPorto( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_porto');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idPorto/' + frm.selectPorto.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasPorto( idPorto, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_porto');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idPorto/'+idPorto+'/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_ProgramaSocial /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasProgramaSocial( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_programasocial');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idProgramaSocial/' + frm.selectProgramaSocial.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasProgramaSocial( idProgramaSocial, frm, pag)
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_programasocial');

    var tmpUpdate = (pag + '/id/'+frm.idPescador.value+'/idProgramaSocial/'+idProgramaSocial+'/back_url/' + TmpUrl);

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

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Arte /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasArteTipo( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_arte');

   var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idArte/' + frm.SelectArtePesca.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasArteTipo( idArte, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_arte');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idArte/' + idArte +  '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}
///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Tipo /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasTipoCapturada( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_tipos');

   var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idTipo/' + frm.selectTipoCapturada.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasTipoCapturada( idTipo, frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_tipos');

    var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idTipo/' + idTipo +  '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

///_/_/_/_/_/_/_/_/_/_/_/_/_/ Pescador_has_Embarcações /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsInsertPescadorHasEmbarcacoes( frm, pag )
{
    var TmpUrl = (+frm.idPescador.value + '#ancora_embarcacoes');

   var tmpUpdate = (pag + '/id/' + frm.idPescador.value + '/idDono/' + frm.selectDonoEmbarcacao.value + '/idEmbarcacao/' + frm.selectTipoEmbarcacao.value + '/idPorte/' + frm.selectPorteEmbarcacao.value + '/isMotor/' + frm.selectMotorEmbarcacao.value + '/back_url/' + TmpUrl);

    location.replace(tmpUpdate);
}

function jsDeletePescadorHasEmbarcacoes(idPescador,idEmbarcacao, frm, pag )
{
    var TmpUrl = (+idPescador + '#ancora_embarcacoes');

    var tmpUpdate = (pag +'/idPescador/' +idPescador + '/idPescadorEmbarcacao/' + idEmbarcacao + '/back_url/' + TmpUrl);

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


///_/_/_/_/_/_/_/_/_/_/_/_/_/ Entrevista_has_Pesqueiro /_/_/_/_/_/_/_/_/_/_/_/_/_/
function jsDeletePesqueiro(fichaId,pag, idEntHasPesqueiro) {
    var TmpUrl = (+fichaId + '#base');

    var tmpUpdate = (pag + '/id/' + idEntHasPesqueiro + '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}
function jsInsertPesqueiro(frm, pag, entrevista) {

        var TmpUrl = (entrevista + '#base');

        var tmpUpdate = (pag + '/nomePesqueiro/' + frm.nomePesqueiro.value + '/tempoPesqueiro/' + frm.tempoPesqueiro.value + '/id_entrevista/' + entrevista + '/back_url/' + TmpUrl);

        location.replace(tmpUpdate);
}

function jsInsertPesqueiroWithoutTime(frm, pag, entrevista) {

        var TmpUrl = (entrevista + '#base');

        var tmpUpdate = (pag + '/nomePesqueiro/' + frm.nomePesqueiro.value + '/id_entrevista/' + entrevista + '/back_url/' + TmpUrl);

        location.replace(tmpUpdate);
}


function jsInsertPesqueiroWithTime(frm, pag, entrevista) {

        var TmpUrl = (entrevista + '#base');

        var tmpUpdate = (pag + '/nomePesqueiro/' + frm.nomePesqueiro.value + '/tempoAPesqueiro/' + frm.tempoAPesqueiro.value +'/id_entrevista/' + entrevista + '/back_url/' + TmpUrl);

        location.replace(tmpUpdate);
}

function jsInsertPesqueiroWithTimeAndRange(frm, pag, entrevista) {

        var TmpUrl = (entrevista + '#base');

        var tmpUpdate = (pag + '/nomePesqueiro/' + frm.nomePesqueiro.value + '/tempoAPesqueiro/' + frm.tempoAPesqueiro.value +'/distAPesqueiro/'+ frm.distAPesqueiro.value + '/id_entrevista/' + entrevista + '/back_url/' + TmpUrl);

        location.replace(tmpUpdate);
}

function jsInsertEspecieCapturadaTipoVenda(frm, pag, entrevista){
    
    var TmpUrl  = (entrevista+ '#base');
    
    var tmpUpdate = (pag + '/selectEspecie/' + frm.SelectEspecie.value + '/quantidade/' + frm.quantidade.value + '/peso/' + frm.peso.value + '/precokg/' + frm.precokg.value + '/id_entrevista/' + entrevista + '/id_tipovenda/'+frm.tipoVenda.value+'/back_url/' + TmpUrl);
    
    location.replace(tmpUpdate);
    
}
function jsInsertEspecieCapturada(frm, pag, entrevista){
    
    var TmpUrl  = (entrevista+ '#base');
    
    var tmpUpdate = (pag + '/selectEspecie/' + frm.SelectEspecie.value + '/quantidade/' + frm.quantidade.value + '/peso/' + frm.peso.value + '/precokg/' + frm.precokg.value + '/id_entrevista/' + entrevista +'/back_url/' + TmpUrl);
    
    location.replace(tmpUpdate);
    
}


function jsDeleteEspecieCapturada(fichaId, pag, idEntHasEspecie) {
    var TmpUrl = (+fichaId + '#base');

    var tmpUpdate = (pag + '/id/' + idEntHasEspecie + '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}
function jsInsertAvistamento(frm, pag, entrevista){
    
    var TmpUrl  = (entrevista+ '#base');
    
    var tmpUpdate = (pag + '/SelectAvistamento/' + frm.SelectAvistamento.value +'/id_entrevista/' + entrevista + '/back_url/' + TmpUrl);
    
    location.replace(tmpUpdate);
    
}
function jsDeleteAvistamento(fichaId, pag, idAvistamento) {
    var TmpUrl = (+fichaId + '#base');

    var tmpUpdate = (pag + '/id_entrevista/' + fichaId + '/id_avistamento/'+idAvistamento+ '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}

function jsEntrevista(nomeArtePesca, idMonitoramento, idFichaDiaria) {
            var Entrevista;
            if (nomeArtePesca.toLowerCase() === "Arrasto de Fundo".toLowerCase()) {
                Entrevista = "arrasto-fundo";
            }
            else if (nomeArtePesca.toLowerCase() === "Calão".toLowerCase()) {
                Entrevista = 'calao';
            }
            else if (nomeArtePesca.toLowerCase() === "Espinhel/Groseira".toLowerCase()) {
                Entrevista = 'grosseira';
            }
            else if (nomeArtePesca.toLowerCase() === "Pesca de Linha".toLowerCase()) {
                Entrevista = 'linha';
            }
            else if (nomeArtePesca.toLowerCase() === "Rede de Emalhar".toLowerCase()) {
                Entrevista = 'emalhe';
            }
            else if (nomeArtePesca.toLowerCase() === "Tarrafa".toLowerCase()) {
                Entrevista = 'tarrafa';
            }
            else if (nomeArtePesca.toLowerCase() === "Vara de Pesca".toLowerCase()) {
                Entrevista = 'vara-pesca';
            }
            else if (nomeArtePesca.toLowerCase() === "Jereré".toLowerCase()) {
                Entrevista = 'jerere';
            }
            else if (nomeArtePesca.toLowerCase() === "Manzuá".toLowerCase()) {
                Entrevista = 'manzua';
            }
            else if (nomeArtePesca.toLowerCase() === "Ratoeira".toLowerCase()) {
                Entrevista = 'ratoeira';
            }
            else if (nomeArtePesca.toLowerCase() === "Coleta Manual".toLowerCase()) {
                Entrevista = 'coleta-manual';
            }
            else if (nomeArtePesca.toLowerCase() === "Mergulho".toLowerCase()) {
                Entrevista = 'mergulho';
            }
            else if (nomeArtePesca.toLowerCase() === "Linha de Fundo".toLowerCase()) {
                Entrevista = 'linha-fundo';
            }
            else if (nomeArtePesca.toLowerCase() === "Siripóia".toLowerCase()) {
                Entrevista = 'siripoia';
            }
            else
                Entrevista = 'error';
            var pag = (Entrevista + '/index');
            var tmpUpdate = (pag + '/id/' + idFichaDiaria + '/idMonitoramento/' + idMonitoramento);
            location.replace(tmpUpdate);
        }
function jsDeleteMonitoramento(idMnt, frm, pag, fichaId) {
      var TmpUrl = (+fichaId + '#base');

      var tmpUpdate = (pag + '/id/' + idMnt + '/back_url/' + TmpUrl);

      if (confirm("Realmente deseja excluir este item?")) {
                location.replace(tmpUpdate);
            }
}

        function jsInsertMonitoramento(frm, pag)
        {
            if (frm.QuantidadeEmbarcacoes.value) {
                var TmpUrl = (+frm.id_fichaDiaria.value + '#base');

                var tmpUpdate = (pag + '/SelectArtePesca/' + frm.SelectArtePesca.value + '/SelectMonitorada/' + frm.SelectMonitorada.value + '/QuantidadeEmbarcacoes/' + frm.QuantidadeEmbarcacoes.value + '/id_fichaDiaria/' + frm.id_fichaDiaria.value + '/back_url/' + TmpUrl);

                window.location.replace(tmpUpdate);
            }
        }

function jsInsertIsca( frm, pag )
{
    if (frm.inputIsc_id.value) {

        var tmpUpdate = (pag + '/isc_id/' + frm.inputIsc_id.value);

        location.replace(tmpUpdate);
        
        return;
    }
    if (frm.inputIsc_tipo.value) {

        var tmpUpdate = (pag + '/isc_tipo/' + frm.inputIsc_tipo.value);

        location.replace(tmpUpdate);
    }
}

function jsDeleteIsca( idIsca, pag )
{
    if (confirm("Realmente deseja excluir este item?")) {
        
        var tmpUpdate = (pag + '/isc_id/' + idIsca);
        
        location.replace(tmpUpdate);
    }
}

function jsUpdateIsca( isc_id, isc_tipo, frm )
{
    if ( confirm("Realmente deseja EDITAR este item?") ) {
        frm.inputIsc_tipo.value = isc_tipo;
        frm.inputIsc_id.value = isc_id;
    }
}

function jsReloadIsca( frm ){
    if ( frm.inputIsc_id.value || frm.inputIsc_tipo.value) {
        location.replace('/perfil');
    }
}

function relatorioIndividualPescador(id_pescador){
    
    location.reload('pescador/relpdfpescador/id_pescador/'.id_pescador);
}

function jsInsertAmostraCamarao(frm, pag, amostragem){
    
    var TmpUrl  = (amostragem+ '#base');
    
    var tmpUpdate = (pag + '/id_amostragem/'+amostragem+'/SelectSexo/' + frm.SelectSexo.value +'/SelectMaturidade/' + frm.SelectMaturidade.value + '/comprimentoCabeca/'+ frm.comprimentoCabeca.value + '/peso/'+frm.peso.value+'/back_url/' + TmpUrl);
    
    location.replace(tmpUpdate);
    
}
function jsDeleteUnidade(amostragemId, pag, idUnidade) {
    var TmpUrl = (+amostragemId + '#base');

    var tmpUpdate = (pag + '/id_amostragem/' + amostragemId + '/id/'+idUnidade+ '/back_url/' + TmpUrl);

    if (confirm("Realmente deseja excluir este item?")) {
        location.replace(tmpUpdate);
    }
}
function jsInsertAmostraPeixe(frm, pag, amostragem){
    
    var TmpUrl  = (amostragem+ '#base');
    
    var tmpUpdate = (pag + '/id_amostragem/'+amostragem+'/SelectSexo/' + frm.SelectSexo.value +'/SelectEspecie/' + frm.SelectEspecie.value + '/comprimento/'+ frm.comprimento.value + '/peso/'+frm.peso.value+'/back_url/' + TmpUrl);
    
    location.replace(tmpUpdate);
    
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

