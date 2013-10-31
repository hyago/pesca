CREATE OR REPLACE VIEW "vUsuario" ("idUsuario", nome, sexo, cpf, rg, email, telefone, "usuarioDeletado", login, "ultimoAcesso", "idPerfil", perfil, "idEndereco", logradouro, numero, bairro, cidade, estado, cep, complemento) AS

SELECT 
  "Usuario"."idUsuario", 
  "Usuario".nome, 
  "Usuario".sexo, 
  "Usuario".cpf, 
  "Usuario".rg, 
  "Usuario".email, 
  "Usuario".telefone, 
  "Usuario"."usuarioDeletado", 
  "Login".login, 
  "Login"."ultimoAcesso", 
  "Perfil"."idPerfil",
  "Perfil".perfil,   
  "Endereco"."idEndereco",
  "Endereco".logradouro, 
  "Endereco".numero, 
  "Endereco".bairro, 
  "Endereco".cidade, 
  "Endereco".estado, 
  "Endereco".cep, 
  "Endereco".complemento
FROM 
  "Usuario", 
  "Perfil", 
  "Login", 
  "Endereco"
WHERE 
  "Usuario"."Perfil_idPerfil" = "Perfil"."idPerfil" AND
  "Usuario"."Endereco_idEndereco" = "Endereco"."idEndereco" AND
  "Login"."Usuario_idUsuario" = "Usuario"."idUsuario"
ORDER BY
  "Usuario"."idUsuario" ASC;
