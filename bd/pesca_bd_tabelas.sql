-- Cria o banco de dados
--CREATE DATABASE "DB_Pesca" TEMPLATE template1 ENCODING "UTF8";

-- -----------------------------------------------------
-- Table "T_Login"
-- -----------------------------------------------------
CREATE  TABLE "T_Login" (
  "TL_ID" SERIAL ,
  "TL_Login" VARCHAR(12) NOT NULL ,
  "TL_HashSenha" CHAR(40) NOT NULL ,
  "TL_UltimoAcesso" TIMESTAMP NULL ,
  PRIMARY KEY ("TL_ID") ,
  UNIQUE ("TL_Login") )
;


-- -----------------------------------------------------
-- Table "T_Perfil"
-- -----------------------------------------------------
CREATE  TABLE "T_Perfil" (
  "TP_ID" SERIAL,
  "TP_Perfil" VARCHAR(14) NOT NULL ,
  PRIMARY KEY ("TP_ID") )
;


-- -----------------------------------------------------
-- Table "T_Endereco"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Endereco" (
  "TE_ID" SERIAL,
  "TE_Logradouro" VARCHAR(30) NOT NULL ,
  "TE_Numero" VARCHAR(6) NOT NULL ,
  "TE_Bairro" VARCHAR(30) NOT NULL ,
  "TE_Cidade" VARCHAR(30) NOT NULL ,
  "TE_Estado" CHAR(2) NOT NULL ,
  "TE_CEP" CHAR(8) NOT NULL ,
  "TE_Complemento" VARCHAR(45) NULL ,
  PRIMARY KEY ("TE_ID") )
;


-- -----------------------------------------------------
-- Table "T_Usuario"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Usuario" (
  "TU_ID" SERIAL ,
  "TU_Nome" VARCHAR(45) NOT NULL ,
  "TU_Sexo" CHAR(1) NOT NULL ,
  "TU_CPF" VARCHAR(14) NOT NULL ,
  "TU_RG" VARCHAR(11) NOT NULL ,
  "TU_Email" VARCHAR(30) NOT NULL ,
  "TU_Telefone" VARCHAR(12) NOT NULL ,
  "TU_UsuarioDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  "TL_ID" INT NOT NULL ,
  "TP_ID" INT NOT NULL ,
  "TE_ID" INT NOT NULL ,
  PRIMARY KEY ("TU_ID") ,
  UNIQUE ("TU_CPF") ,
  UNIQUE ("TU_Email") ,
  CONSTRAINT "fk_T_Usuario_T_Login1"
    FOREIGN KEY ("TL_ID" )
    REFERENCES "T_Login" ("TL_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Usuario_T_Perfil1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Perfil" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Usuario_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_AlteracaoSenha"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_AlteracaoSenha" (
  "TAS_Token" CHAR(40) NOT NULL ,
  "TAS_DataSolicitacao" TIMESTAMP NOT NULL ,
  "TAS_DataAlteracao" TIMESTAMP NULL ,
  "TU_ID" INT NOT NULL ,
  PRIMARY KEY ("TAS_Token") ,
  CONSTRAINT "fk_T_AlteracaoSenha_T_Usuario1"
    FOREIGN KEY ("TU_ID" )
    REFERENCES "T_Usuario" ("TU_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_AreaPesca"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_AreaPesca" (
  "TAreaP_ID" SERIAL ,
  "TAreaP_AreaPesca" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("TAreaP_ID") )
;


-- -----------------------------------------------------
-- Table "T_TipoEmbarcacao"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_TipoEmbarcacao" (
  "TTE_ID" SERIAL ,
  "TTE_TipoEmbarcacao" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("TTE_ID") )
;


-- -----------------------------------------------------
-- Table "T_Colonia"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Colonia" (
  "TC_ID" SERIAL ,
  "TC_Nome" VARCHAR(45) NOT NULL ,
  "TE_ID" INT NOT NULL ,
  PRIMARY KEY ("TC_ID") ,
  CONSTRAINT "fk_T_Colonia_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Comunidade"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Comunidade" (
  "TCom_ID" SERIAL ,
  "TCom_Nome" VARCHAR(45) NULL ,
  PRIMARY KEY ("TCom_ID") )
;


-- -----------------------------------------------------
-- Table "T_Situacao"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Situacao" (
  "TS_ID" SERIAL ,
  "TS_Situacao" BOOLEAN NOT NULL DEFAULT TRUE ,
  "TS_Motivo" VARCHAR(45) NULL ,
  PRIMARY KEY ("TS_ID") )
;


-- -----------------------------------------------------
-- Table "T_Pescador"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Pescador" (
  "TPes_ID" SERIAL ,
  "TPes_Nome" VARCHAR(45) NOT NULL ,
  "TPes_Sexo" CHAR(1) NOT NULL ,
  "TPes_Matricula" VARCHAR(45) NOT NULL ,
  "TPes_Apelido" VARCHAR(20) NULL ,
  "TPes_NomePai" VARCHAR(45) NULL ,
  "TPes_NomeMae" VARCHAR(45) NULL ,
  "TPes_CTPS" VARCHAR(45) NULL ,
  "TPes_PIS" VARCHAR(45) NULL ,
  "TPes_INSS" VARCHAR(45) NULL ,
  "TPes_NIT" VARCHAR(45) NULL ,
  "TPes_CEI" VARCHAR(45) NULL ,
  "TPes_CMA" VARCHAR(45) NULL ,
  "TPes_RGB_MAA_IBAMA" VARCHAR(45) NULL ,
  "TPes_CIR_CapPorto" VARCHAR(45) NULL ,
  "TPes_CPF" VARCHAR(14) NOT NULL ,
  "TPes_DataNasc" DATE NOT NULL ,
  "TPes_Telefone" VARCHAR(12) NOT NULL ,
  "TPes_DataRecadastro" DATE NULL ,
  "TPes_PescadorDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  "TE_ID" INT NOT NULL ,
  "TAreaP_ID" INT NOT NULL ,
  "TTE_ID" INT NOT NULL ,
  "TC_ID" INT NOT NULL ,
  "TCom_ID" INT NOT NULL ,
  "TS_ID" INT NOT NULL ,
  PRIMARY KEY ("TPes_ID") ,
  UNIQUE ("TPes_CPF") ,
  CONSTRAINT "fk_T_Pescador_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_AreaPesca1"
    FOREIGN KEY ("TAreaP_ID" )
    REFERENCES "T_AreaPesca" ("TAreaP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_TipoEmbarcacao1"
    FOREIGN KEY ("TTE_ID" )
    REFERENCES "T_TipoEmbarcacao" ("TTE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_Colonia1"
    FOREIGN KEY ("TC_ID" )
    REFERENCES "T_Colonia" ("TC_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_Comunidade1"
    FOREIGN KEY ("TCom_ID" )
    REFERENCES "T_Comunidade" ("TCom_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_Situacao1"
    FOREIGN KEY ("TS_ID" )
    REFERENCES "T_Situacao" ("TS_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_TipoDependente"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_TipoDependente" (
  "TDP_ID" SERIAL ,
  "TDP_Tipo" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("TDP_ID") )
;


-- -----------------------------------------------------
-- Table "T_Dependente"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Dependente" (
  "TD_ID" SERIAL ,
  "TD_Nome" VARCHAR(45) NOT NULL ,
  "TDP_ID" INT NOT NULL ,
  "TPes_ID" INT NOT NULL ,
  PRIMARY KEY ("TD_ID") ,
  CONSTRAINT "fk_T_Dependente_T_TipoDependente1"
    FOREIGN KEY ("TDP_ID" )
    REFERENCES "T_TipoDependente" ("TDP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Dependente_T_Pescador1"
    FOREIGN KEY ("TPes_ID" )
    REFERENCES "T_Pescador" ("TPes_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_ArtePesca"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_ArtePesca" (
  "TAP_ID" SERIAL ,
  "TAP_ArtePesca" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("TAP_ID") )
;

-- -----------------------------------------------------
-- Table "T_Pescador_T_ArtePesca"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Pescador_T_ArtePesca" (
  "TPes_ID" INT NOT NULL ,
  "TAP_ID" INT NOT NULL ,
  PRIMARY KEY ("TPes_ID", "TAP_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_ArtePesca_T_Pescador1"
    FOREIGN KEY ("TPes_ID" )
    REFERENCES "T_Pescador" ("TPes_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_ArtePesca_T_ArtePesca1"
    FOREIGN KEY ("TAP_ID" )
    REFERENCES "T_ArtePesca" ("TAP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_EspecieCapturada"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_EspecieCapturada" (
  "TEC_ID" SERIAL ,
  "TEC_Especie" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("TEC_ID") )
;


-- -----------------------------------------------------
-- Table "T_Pescador_T_EspecieCapturada"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Pescador_T_EspecieCapturada" (
  "TPes_ID" INT NOT NULL ,
  "TEC_ID" INT NOT NULL ,
  PRIMARY KEY ("TPes_ID", "TEC_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_EspecieCapturada_T_Pescador1"
    FOREIGN KEY ("TPes_ID" )
    REFERENCES "T_Pescador" ("TPes_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_EspecieCapturada_T_EspecieCapturada1"
    FOREIGN KEY ("TEC_ID" )
    REFERENCES "T_EspecieCapturada" ("TEC_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Especificidade"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Especificidade" (
  "TEsp_ID" SERIAL ,
  "TEsp_Especificidade" VARCHAR(45) NOT NULL ,
  "TP_ID" INT NOT NULL ,
  PRIMARY KEY ("TEsp_ID") ,
  CONSTRAINT "fk_T_Especificidade_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TPes_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
