-- Cria o banco de dados
--CREATE DATABASE "Pesca" TEMPLATE template1 ENCODING "UTF8";

CREATE  TABLE "Perfil" (
  "idPerfil" INT NOT NULL ,
  "perfil" VARCHAR(14) NOT NULL ,
  PRIMARY KEY ("idPerfil") )
;

CREATE  TABLE "Endereco" (
  "idEndereco" SERIAL ,
  "logradouro" VARCHAR(30) NOT NULL ,
  "numero" VARCHAR(4) NOT NULL ,
  "bairro" VARCHAR(30) NOT NULL ,
  "cidade" VARCHAR(20) NOT NULL ,
  "estado" CHAR(2) NOT NULL ,
  "cep" CHAR(8) NOT NULL ,
  "complemento" VARCHAR(45) NULL ,
  "enderecoDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  PRIMARY KEY ("idEndereco") )
;

CREATE  TABLE "Usuario" (
  "idUsuario" SERIAL ,
  "Perfil_idPerfil" INT NOT NULL ,
  "Endereco_idEndereco" INT NOT NULL ,
  "nome" VARCHAR(40) NOT NULL ,
  "sexo" CHAR(1) NOT NULL ,
  "cpf" CHAR(14) NOT NULL ,
  "rg" VARCHAR(11) NOT NULL ,
  "email" VARCHAR(30) NOT NULL ,
  "telefone" VARCHAR(12) NOT NULL ,
  "usuarioDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  PRIMARY KEY ("idUsuario") ,
  UNIQUE (cpf) ,
  UNIQUE (email) ,
  CONSTRAINT fk_Usuario_Perfil
    FOREIGN KEY ("Perfil_idPerfil" )
    REFERENCES "Perfil" ("idPerfil" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Usuario_Endereco1
    FOREIGN KEY ("Endereco_idEndereco" )
    REFERENCES "Endereco" ("idEndereco" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE  TABLE "Login" (
  "login" VARCHAR(12) NOT NULL ,
  "Usuario_idUsuario" INT NOT NULL ,
  "hashSenha" CHAR(40) NOT NULL ,
  "ultimoAcesso" TIMESTAMP NULL ,
  "loginDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  PRIMARY KEY (login) ,
  UNIQUE ("Usuario_idUsuario") ,
  CONSTRAINT fk_Login_Usuario1
    FOREIGN KEY ("Usuario_idUsuario" )
    REFERENCES "Usuario" ("idUsuario" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE  TABLE "AlteracaoSenha" (
  "chave" INT NOT NULL ,
  "Usuario_idUsuario" INT NOT NULL ,
  "dataSolicitacao" TIMESTAMP NOT NULL ,
  "dataAlteracao" TIMESTAMP NULL ,
  PRIMARY KEY (chave) ,
  CONSTRAINT fk_AlteracaoSenha_Usuario1
    FOREIGN KEY ("Usuario_idUsuario" )
    REFERENCES "Usuario" ("idUsuario" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
