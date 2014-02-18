jQuery(function($){
    $(".telefone").mask("(99) 9999-9999");
    $("#cep").mask("99999-999");
    $("#cpf").mask("999.999.999-99");

    $("#cadastro-usuario").submit(function() {
        $(".telefone").mask("9999999999");
        $("#cep").mask("99999999");
        $("#cpf").mask("99999999999");
        return true;
    });
});
