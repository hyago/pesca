-- Cria o banco de dados
--CREATE DATABASE "DB_Pesca" TEMPLATE template1 ENCODING "UTF8";

-- -----------------------------------------------------
-- Table "T_UF"
-- -----------------------------------------------------
CREATE  TABLE "T_UF" (
  "TUF_Sigla" VARCHAR(2) NOT NULL ,
  "TUF_Nome" VARCHAR(25) NOT NULL ,
  PRIMARY KEY ("TUF_Sigla") )
;


-- -----------------------------------------------------
-- Table "T_Municipio"
-- -----------------------------------------------------
CREATE  TABLE "T_Municipio" (
  "TMun_ID" SERIAL ,
  "TMun_Municipio" VARCHAR(50) NOT NULL ,
  "TUF_Sigla" VARCHAR(2) NOT NULL ,
  PRIMARY KEY ("TMun_ID") ,
  UNIQUE ("TMun_Municipio") ,
  CONSTRAINT "fk_T_Municipio_T_UF1"
    FOREIGN KEY ("TUF_Sigla" )
    REFERENCES "T_UF" ("TUF_Sigla" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Endereco"
-- -----------------------------------------------------
CREATE  TABLE "T_Endereco" (
  "TE_ID" SERIAL ,
  "TE_Logradouro" VARCHAR(50) NOT NULL ,
  "TE_Numero" VARCHAR(6) NOT NULL ,
  "TE_Bairro" VARCHAR(30) NOT NULL ,
  "TE_CEP" DECIMAL(8) NOT NULL ,
  "TE_Comp" VARCHAR(50) NULL ,
  "TMun_ID" INT NOT NULL ,
  PRIMARY KEY ("TE_ID") ,
  CONSTRAINT "fk_T_Endereco_T_Municipio1"
    FOREIGN KEY ("TMun_ID" )
    REFERENCES "T_Municipio" ("TMun_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_TipoTel"
-- -----------------------------------------------------
CREATE  TABLE "T_TipoTel" (
  "TTEL_ID" SERIAL ,
  "TTEL_Desc" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TTEL_ID") )
;


-- -----------------------------------------------------
-- Table "T_TelefoneContato"
-- -----------------------------------------------------
CREATE  TABLE "T_TelefoneContato" (
  "TTCont_ID" SERIAL ,
  "TTCont_DDD" DECIMAL(2) NOT NULL ,
  "TTCont_Telefone" DECIMAL(10) NOT NULL ,
  "TTEL_ID" INT NOT NULL ,
  PRIMARY KEY ("TTCont_ID") ,
  CONSTRAINT "fk_T_TelefoneContato_T_TipoTel1"
    FOREIGN KEY ("TTEL_ID" )
    REFERENCES "T_TipoTel" ("TTEL_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Pescador"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador" (
  "TP_ID" SERIAL ,
  "TP_Nome" VARCHAR(45) NOT NULL ,
  "TP_Sexo" VARCHAR(1) NOT NULL ,
  "TP_Matricula" VARCHAR(45) NULL ,
  "TP_Apelido" VARCHAR(20) NULL ,
  "TP_FiliacaoPai" VARCHAR(45) NULL ,
  "TP_FiliacaoMae" VARCHAR(45) NULL ,
  "TP_CTPS" VARCHAR(45) NULL ,
  "TP_PIS" VARCHAR(45) NULL ,
  "TP_INSS" VARCHAR(45) NULL ,
  "TP_NIT_CEI" VARCHAR(45) NULL ,
  "TP_RG" VARCHAR(45) NULL ,
  "TP_CMA" VARCHAR(45) NULL ,
  "TP_RGB_MAA_IBAMA" VARCHAR(45) NULL ,
  "TP_CIR_Cap_Porto" VARCHAR(45) NULL ,
  "TP_CPF" VARCHAR(14) NULL ,
  "TP_DataNasc" DATE NULL ,
  "TMun_ID_Natural" INT NOT NULL ,
  "TE_ID" INT NOT NULL ,
  PRIMARY KEY ("TP_ID") ,
  CONSTRAINT "fk_T_Pescador_T_Municipio1"
    FOREIGN KEY ("TMun_ID_Natural" )
    REFERENCES "T_Municipio" ("TMun_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_TipoDependente"
-- -----------------------------------------------------
CREATE  TABLE "T_TipoDependente" (
  "TTD_ID" SERIAL,
  "TTP_TipoDependente" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TTD_ID") )
;


-- -----------------------------------------------------
-- Table "T_Dependente"
-- -----------------------------------------------------
CREATE  TABLE "T_Dependente" (
  "TP_ID" INT NOT NULL ,
  "TTD_ID" INT NOT NULL ,
  "TDP_Nome" VARCHAR(50) NOT NULL ,
  "TDP_DtaNasc" VARCHAR(50) NULL ,
  PRIMARY KEY ("TP_ID", "TTD_ID") ,
  UNIQUE("TDP_Nome") ,
  CONSTRAINT "Responsavel"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Dependentes_T_TipoDependente1"
    FOREIGN KEY ("TTD_ID" )
    REFERENCES "T_TipoDependente" ("TTD_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Comunidade"
-- -----------------------------------------------------
CREATE  TABLE "T_Comunidade" (
  "TCOM_ID" SERIAL ,
  "TCOM_NOME" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TCOM_ID") ,
  UNIQUE ("TCOM_NOME") )
;


-- -----------------------------------------------------
-- Table "T_Colonia"
-- -----------------------------------------------------
CREATE  TABLE "T_Colonia" (
  "TC_ID" SERIAL ,
  "TC_Nome" VARCHAR(50) NOT NULL ,
  "TC_Especificidade" VARCHAR(50) NULL ,
  "TCOM_ID" INT NOT NULL ,
  "TE_ID" INT NOT NULL ,
  PRIMARY KEY ("TC_ID") ,
  UNIQUE ("TC_Nome") ,
  CONSTRAINT "fk_T_Colonia_T_Comunidade1"
    FOREIGN KEY ("TCOM_ID" )
    REFERENCES "T_Comunidade" ("TCOM_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Colonia_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_ArtePesca"
-- -----------------------------------------------------
CREATE  TABLE "T_ArtePesca" (
  "TAP_ID" SERIAL ,
  "TAP_ArtePesca" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TAP_ID") ,
  UNIQUE ("TAP_ArtePesca") )
;


-- -----------------------------------------------------
-- Table "T_TipoEmbarcacao"
-- -----------------------------------------------------
CREATE  TABLE "T_TipoEmbarcacao" (
  "TTE_ID" SERIAL ,
  "TTE_TipoEmbarcacao" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TTE_ID") ,
  UNIQUE ("TTE_TipoEmbarcacao") )
;


-- -----------------------------------------------------
-- Table "T_AreaPesca"
-- -----------------------------------------------------
CREATE  TABLE "T_AreaPesca" (
  "TAreaP_ID" SERIAL ,
  "TAreaP_AreaPesca" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TAreaP_ID") ,
  UNIQUE ("TAreaP_AreaPesca") )
;


-- -----------------------------------------------------
-- Table "T_EspecieCapturada"
-- -----------------------------------------------------
CREATE  TABLE "T_EspecieCapturada" (
  "TEC_ID" SERIAL ,
  "TEC_Especie" VARCHAR(50) NOT NULL ,
  PRIMARY KEY ("TEC_ID") ,
  UNIQUE ("TEC_Especie") )
;


-- -----------------------------------------------------
-- Table "T_Situacao"
-- -----------------------------------------------------
CREATE  TABLE "T_Situacao" (
  "TS_ID" SERIAL ,
  "TS_Situacao" BOOLEAN NOT NULL DEFAULT TRUE ,
  "TS_Motivo" VARCHAR(45) NULL ,
  PRIMARY KEY ("TS_ID") )
;


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
  "TP_ID" SERIAL ,
  "TP_Perfil" VARCHAR(14) NOT NULL ,
  PRIMARY KEY ("TP_ID") )
;


-- -----------------------------------------------------
-- Table "T_Usuario"
-- -----------------------------------------------------
CREATE  TABLE "T_Usuario" (
  "TU_ID" SERIAL ,
  "TU_Nome" VARCHAR(45) NOT NULL ,
  "TU_Sexo" VARCHAR(1) NOT NULL ,
  "TU_CPF" VARCHAR(14) NOT NULL ,
  "TU_RG" VARCHAR(11) NOT NULL ,
  "TU_Email" VARCHAR(30) NOT NULL ,
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
-- Table "T_HistoricoRecadastramento"
-- -----------------------------------------------------
CREATE  TABLE "T_HistoricoRecadastramento" (
  "THR_Data" DATE NOT NULL ,
  "TP_ID" INT NOT NULL ,
  "TS_ID" INT NOT NULL ,
  "THR_Descricao" VARCHAR(45) NULL ,
  "TU_ID_Resp_Coleta" INT NOT NULL ,
  "TU_ID_Resp_Digita" INT NOT NULL ,
  CONSTRAINT "fk_T_DataRecadastramento_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_HistooRecadastramento_T_SituacaoAtual1"
    FOREIGN KEY ("TS_ID" )
    REFERENCES "T_Situacao" ("TS_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_HistooRecadastramento_T_Usuario1"
    FOREIGN KEY ("TU_ID_Resp_Coleta" )
    REFERENCES "T_Usuario" ("TU_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_HistooRecadastramento_T_Usuario2"
    FOREIGN KEY ("TU_ID_Resp_Digita" )
    REFERENCES "T_Usuario" ("TU_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Pescador_has_T_TipoArtePesca"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador_has_T_TipoArtePesca" (
  "TP_ID" INT NOT NULL ,
  "TAP_ID" INT NOT NULL ,
  PRIMARY KEY ("TP_ID", "TAP_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_TipoArtePesca_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_TipoArtePesca_T_TipoArtePesca1"
    FOREIGN KEY ("TAP_ID" )
    REFERENCES "T_ArtePesca" ("TAP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Pescador_has_T_EspecieCapturadas"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador_has_T_EspecieCapturada" (
  "TP_ID" INT NOT NULL ,
  "TEC_ID" INT NOT NULL ,
  PRIMARY KEY ("TP_ID", "TEC_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_EspecieCapturadas_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_EspecieCapturadas_T_EspecieCapturadas1"
    FOREIGN KEY ("TEC_ID" )
    REFERENCES "T_EspecieCapturada" ("TEC_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_AreaPesca_has_T_Pescador"
-- -----------------------------------------------------
CREATE  TABLE "T_AreaPesca_has_T_Pescador" (
  "TAreaP_ID" INT NOT NULL ,
  "TP_ID" INT NOT NULL ,
  PRIMARY KEY ("TAreaP_ID", "TP_ID") ,
  CONSTRAINT "fk_T_AreaPesca_has_T_Pescador_T_AreaPesca1"
    FOREIGN KEY ("TAreaP_ID" )
    REFERENCES "T_AreaPesca" ("TAreaP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_AreaPesca_has_T_Pescador_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_PorteEmbarcacao"
-- -----------------------------------------------------
CREATE  TABLE "T_PorteEmbarcacao" (
  "TPE_ID" SERIAL ,
  "TPE_Porte" VARCHAR(7) NOT NULL ,
  PRIMARY KEY ("TPE_ID") )
;


-- -----------------------------------------------------
-- Table "T_Pescador_has_T_Embarcacao"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador_has_T_Embarcacao" (
  "TTE_ID" INT NOT NULL ,
  "TP_ID" INT NOT NULL ,
  "TPTE_Motor" BOOLEAN NOT NULL DEFAULT FALSE ,
  "TPE_ID" INT NOT NULL ,
  PRIMARY KEY ("TTE_ID", "TP_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_Embarcacao_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_Embarcacao_T_Embarcacao1"
    FOREIGN KEY ("TTE_ID" )
    REFERENCES "T_TipoEmbarcacao" ("TTE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_Embarcacao_T_PorteEmbarcacao1"
    FOREIGN KEY ("TPE_ID" )
    REFERENCES "T_PorteEmbarcacao" ("TPE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Pescador_has_T_Colonia"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador_has_T_Colonia" (
  "TP_ID" INT NOT NULL ,
  "TC_ID" INT NOT NULL ,
  "TPTC_DataInscColonia" DATE NULL ,
  PRIMARY KEY ("TP_ID", "TC_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_Colonia_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_Colonia_T_Colonia1"
    FOREIGN KEY ("TC_ID" )
    REFERENCES "T_Colonia" ("TC_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_AlteracaoSenha"
-- -----------------------------------------------------
CREATE  TABLE "T_AlteracaoSenha" (
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
-- Table "T_Usuario_has_T_TelefoneContato"
-- -----------------------------------------------------
CREATE  TABLE "T_Usuario_has_T_TelefoneContato" (
  "TU_ID" INT NOT NULL ,
  "TTCont_ID" INT NOT NULL ,
  PRIMARY KEY ("TU_ID", "TTCont_ID") ,
  CONSTRAINT "fk_T_Usuario_has_T_TelefoneContato_T_Usuario1"
    FOREIGN KEY ("TU_ID" )
    REFERENCES "T_Usuario" ("TU_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Usuario_has_T_TelefoneContato_T_TelefoneContato1"
    FOREIGN KEY ("TTCont_ID" )
    REFERENCES "T_TelefoneContato" ("TTCont_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_Pescador_has_T_TelefoneContato"
-- -----------------------------------------------------
CREATE  TABLE "T_Pescador_has_T_TelefoneContato" (
  "TP_ID" INT NOT NULL ,
  "TTCont_ID" INT NOT NULL ,
  PRIMARY KEY ("TP_ID", "TTCont_ID") ,
  CONSTRAINT "fk_T_Pescador_has_T_TelefoneContato_T_Pescador1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Pescador" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Pescador_has_T_TelefoneContato_T_TelefoneContato1"
    FOREIGN KEY ("TTCont_ID" )
    REFERENCES "T_TelefoneContato" ("TTCont_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
