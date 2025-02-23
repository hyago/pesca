
--SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
--SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
--SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- ALTERADO: T_ESPECIE_CAPTURADA SPC_PESO(KG) -> SPC_PESO_KG

-- select tablename, 'T' from pg_tables;
DROP TABLE IF EXISTS T_ARRASTOFUNDO_HAS_T_AVISTAMENTO CASCADE;
DROP TABLE IF EXISTS T_ALTERACAOSENHA CASCADE;
DROP TABLE IF EXISTS T_AREAPESCA CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_AREAPESCA CASCADE;
DROP TABLE IF EXISTS T_ARTEPESCA CASCADE;
DROP TABLE IF EXISTS T_COLONIA CASCADE;
DROP TABLE IF EXISTS T_COMUNIDADE CASCADE;
DROP TABLE IF EXISTS T_DADOS_CALAO CASCADE;
DROP TABLE IF EXISTS T_DADOS_EMALHE CASCADE;
DROP TABLE IF EXISTS T_DADOS_TARRAFA CASCADE;
DROP TABLE IF EXISTS T_ENDERECO CASCADE;
DROP TABLE IF EXISTS T_ENTREVISTA_PESCADOR CASCADE;
DROP TABLE IF EXISTS T_ESCOLARIDADE CASCADE;
DROP TABLE IF EXISTS T_ESPECIE CASCADE;
DROP TABLE IF EXISTS T_FAMILIA CASCADE;
DROP TABLE IF EXISTS T_FICHA_DIARIA CASCADE;
DROP TABLE IF EXISTS T_GENERO CASCADE;
DROP TABLE IF EXISTS T_GRUPO CASCADE;
DROP TABLE IF EXISTS T_HISTORICORECADASTRAMENTO CASCADE;
DROP TABLE IF EXISTS T_ISCA CASCADE;
DROP TABLE IF EXISTS T_LOGIN CASCADE;
DROP TABLE IF EXISTS T_MARE CASCADE;
DROP TABLE IF EXISTS T_MONITORAMENTO CASCADE;
DROP TABLE IF EXISTS T_MUNICIPIO CASCADE;
DROP TABLE IF EXISTS T_ORDEM CASCADE;
DROP TABLE IF EXISTS T_PERFIL CASCADE;
DROP TABLE IF EXISTS T_PESCADOR CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_COLONIA CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_COMUNIDADE CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_EMBARCACAO CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_PROGRAMASOCIAL CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_RENDA CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_TT_DEPENDENTE CASCADE;
DROP TABLE IF EXISTS T_PORTEEMBARCACAO CASCADE;
DROP TABLE IF EXISTS T_PORTO CASCADE;
DROP TABLE IF EXISTS T_PROGRAMASOCIAL CASCADE;
DROP TABLE IF EXISTS T_RENDA CASCADE;
DROP TABLE IF EXISTS T_SITUACAO CASCADE;
DROP TABLE IF EXISTS T_SUBAMOSTRA CASCADE;
DROP TABLE IF EXISTS T_TELEFONECONTATO CASCADE;
DROP TABLE IF EXISTS T_TEMPO CASCADE;
DROP TABLE IF EXISTS T_TIPOCAPTURADA CASCADE;
DROP TABLE IF EXISTS T_TIPODEPENDENTE CASCADE;
DROP TABLE IF EXISTS T_TIPOEMBARCACAO CASCADE;
DROP TABLE IF EXISTS T_TIPOTEL CASCADE;
DROP TABLE IF EXISTS T_UF CASCADE;
DROP TABLE IF EXISTS T_USUARIO CASCADE;
DROP TABLE IF EXISTS T_USUARIO_HAS_T_TELEFONECONTATO CASCADE;
DROP TABLE IF EXISTS T_VENTO CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_AREAPESCA CASCADE;
DROP TABLE IF EXISTS T_TIPORENDA CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_TIPODEPENDENTE CASCADE;
DROP TABLE IF EXISTS T_ESP_ARTE_PESCA CASCADE;
DROP TABLE IF EXISTS T_ARRASTOFUNDO CASCADE;
DROP TABLE IF EXISTS T_PESQUEIRO_AF CASCADE;
DROP TABLE IF EXISTS T_REDE CASCADE;
DROP TABLE IF EXISTS T_PESCALINHA CASCADE;
DROP TABLE IF EXISTS T_MARISCAGEM CASCADE;
DROP TABLE IF EXISTS T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_TELEFONE CASCADE;
DROP TABLE IF EXISTS T_AVISTAMENTO CASCADE;
DROP TABLE IF EXISTS T_PESCADOR_HAS_T_PORTO CASCADE;

DROP TABLE IF EXISTS  T_TIPOMARE CASCADE;
DROP TABLE IF EXISTS  T_BARCO CASCADE;
DROP TABLE IF EXISTS  T_CALAO_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_ARRASTOFUNDO_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_ARRASTOFUNDO_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_TARRAFA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_EMALHE CASCADE;
DROP TABLE IF EXISTS  T_CALAO_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_EMALHE_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_CALAO CASCADE;
DROP TABLE IF EXISTS  T_TARRAFA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_EMALHE_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_TARRAFA CASCADE;
DROP TABLE IF EXISTS  T_MERGULHO_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_GROSSEIRA CASCADE;
DROP TABLE IF EXISTS  T_GROSSEIRA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_LINHA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_LINHA CASCADE;
DROP TABLE IF EXISTS  T_LINHA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_MERGULHO_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_MERGULHO CASCADE;
DROP TABLE IF EXISTS  T_GROSSEIRA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_COLETAMANUAL CASCADE;
DROP TABLE IF EXISTS  T_COLETAMANUAL_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_COLETAMANUAL_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_VARAPESCA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_VARAPESCA CASCADE;
DROP TABLE IF EXISTS  T_VARAPESCA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_LINHAFUNDO CASCADE;
DROP TABLE IF EXISTS  T_LINHAFUNDO_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_LINHAFUNDO_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_JERERE CASCADE;
DROP TABLE IF EXISTS  T_JERERE_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_RATOEIRA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_SIRIPOIA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_JERERE_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_MANZUA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_MANZUA CASCADE;
DROP TABLE IF EXISTS  T_RATOEIRA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_MANZUA_HAS_T_PESQUEIRO CASCADE;
DROP TABLE IF EXISTS  T_SIRIPOIA_HAS_T_ESPECIE_CAPTURADA CASCADE;
DROP TABLE IF EXISTS  T_SIRIPOIA CASCADE;
DROP TABLE IF EXISTS  T_RATOEIRA CASCADE;
DROP TABLE IF EXISTS  T_PESCADOR_HAS_T_ARTEPESCA CASCADE;
DROP TABLE IF EXISTS  T_PESCADOR_HAS_T_TIPOCAPTURADA CASCADE;


Drop view if exists  v_arrasto_has_t_pesqueiro;
Drop view if exists  v_varapesca_has_t_pesqueiro;
Drop view if exists  v_tarrafa_has_t_pesqueiro;
Drop view if exists  v_siripoia_has_t_pesqueiro;
Drop view if exists  v_ratoeira_has_t_pesqueiro;
Drop view if exists  v_mergulho_has_t_pesqueiro;
Drop view if exists  v_manzua_has_t_pesqueiro;
Drop view if exists  v_linhafundo_has_t_pesqueiro;
Drop view if exists  v_linha_has_t_pesqueiro;
Drop view if exists  v_jerere_has_t_pesqueiro;
Drop view if exists  v_grosseira_has_t_pesqueiro;
Drop view if exists  v_coletamanual_has_t_pesqueiro;
Drop view if exists  v_emalhe_has_t_pesqueiro;
Drop view if exists  v_calao_has_t_pesqueiro;

Drop table if exists  t_calao_has_t_pesqueiro;
Drop table if exists  t_emalhe_has_t_pesqueiro;
Drop table if exists  t_coletamanual_has_t_pesqueiro;
Drop table if exists  t_grosseira_has_t_pesqueiro;
Drop table if exists  t_jerere_has_t_pesqueiro;
Drop table if exists  t_linha_has_t_pesqueiro;
Drop table if exists  t_linhafundo_has_t_pesqueiro;
Drop table if exists  t_manzua_has_t_pesqueiro;
Drop table if exists  t_mergulho_has_t_pesqueiro;
Drop table if exists  t_ratoeira_has_t_pesqueiro;
Drop table if exists  t_siripoia_has_t_pesqueiro;
Drop table if exists  t_tarrafa_has_t_pesqueiro;
Drop table if exists  t_varapesca_has_t_pesqueiro;
Drop table if exists  t_arrastofundo_has_t_pesqueiro;

Drop view if exists  v_arrastofundo_has_t_especie_capturada;
Drop view if exists  v_varapesca_has_t_especie_capturada;
Drop view if exists  v_tarrafa_has_t_especie_capturada;
Drop view if exists  v_siripoia_has_t_especie_capturada;
Drop view if exists  v_ratoeira_has_t_especie_capturada;
Drop view if exists  v_mergulho_has_t_especie_capturada;
Drop view if exists  v_manzua_has_t_especie_capturada;
Drop view if exists  v_linhafundo_has_t_especie_capturada;
Drop view if exists  v_linha_has_t_especie_capturada;
Drop view if exists  v_jerere_has_t_especie_capturada;
Drop view if exists  v_grosseira_has_t_especie_capturada;
Drop view if exists  v_coletamanual_has_t_especie_capturada;
Drop view if exists  v_emalhe_has_t_especie_capturada;
Drop view if exists  v_calao_has_t_especie_capturada;

Drop table if exists  t_calao_has_t_especie_capturada;
Drop table if exists  t_emalhe_has_t_especie_capturada;
Drop table if exists  t_coletamanual_has_t_especie_capturada;
Drop table if exists  t_grosseira_has_t_especie_capturada;
Drop table if exists  t_jerere_has_t_especie_capturada;
Drop table if exists  t_linha_has_t_especie_capturada;
Drop table if exists  t_linhafundo_has_t_especie_capturada;
Drop table if exists  t_manzua_has_t_especie_capturada;
Drop table if exists  t_mergulho_has_t_especie_capturada;
Drop table if exists  t_ratoeira_has_t_especie_capturada;
Drop table if exists  t_siripoia_has_t_especie_capturada;
Drop table if exists  t_tarrafa_has_t_especie_capturada;
Drop table if exists  t_varapesca_has_t_especie_capturada;
Drop table if exists  t_arrastofundo_has_t_especie_capturada;

Drop table if exists t_arrastofundo;
Drop table if exists t_varapesca;
Drop table if exists t_tarrafa;
Drop table if exists t_siripoia;
Drop table if exists t_ratoeira;
Drop table if exists t_mergulho;
Drop table if exists t_manzua;
Drop table if exists t_linhafundo;
Drop table if exists t_linha;
Drop table if exists t_jerere;
Drop table if exists t_grosseira;
Drop table if exists t_coletamanual;
Drop table if exists t_emalhe;
Drop table if exists t_calao;

DROP TABLE IF EXISTS T_MATURIDADE CASCADE;
DROP TABLE IF EXISTS T_UNIDADE_PEIXE CASCADE;
DROP TABLE IF EXISTS T_PROJETO CASCADE;
DROP TABLE IF EXISTS T_ENTREVISTA_HAS_T_AVISTAMENTO CASCADE;
DROP TABLE IF EXISTS T_TURNO CASCADE;
DROP TABLE IF EXISTS T_UNIDADE_CAMARAO CASCADE;

-- -----------------------------------------------------
-- TABLE T_UF
-- -----------------------------------------------------
CREATE TABLE T_UF (
 TUF_SIGLA VARCHAR(2) NOT NULL,
 TUF_NOME VARCHAR(25) NOT NULL,
 PRIMARY KEY (TUF_SIGLA)
 );

-- -----------------------------------------------------
-- TABLE T_MUNICIPIO
-- -----------------------------------------------------
CREATE TABLE T_MUNICIPIO (
 TMUN_ID SERIAL,
 TMUN_MUNICIPIO VARCHAR(50) NOT NULL,
 TUF_SIGLA VARCHAR(2) NOT NULL,
 PRIMARY KEY (TMUN_ID),
 CONSTRAINT FK_T_MUNICIPIO_T_UF FOREIGN KEY (TUF_SIGLA) REFERENCES T_UF (TUF_SIGLA)
);

-- -----------------------------------------------------
-- TABLE T_ENDERECO
-- -----------------------------------------------------
CREATE TABLE T_ENDERECO (
 TE_ID SERIAL,
 TE_LOGRADOURO VARCHAR(100) NULL,
 TE_NUMERO VARCHAR(45) NULL,
 TE_BAIRRO VARCHAR(50) NULL,
 TE_CEP DECIMAL(8) NULL,
 TE_COMP VARCHAR(50) NULL,
 TMUN_ID INT NULL,
 PRIMARY KEY (TE_ID),
 CONSTRAINT FK_T_ENDERECO_T_MUNICIPIO1 FOREIGN KEY (TMUN_ID) REFERENCES T_MUNICIPIO (TMUN_ID)
);

-- -----------------------------------------------------
-- TABLE T_ESCOLARIDADE
-- -----------------------------------------------------
CREATE TABLE T_ESCOLARIDADE (
 ESC_ID SERIAL,
 ESC_NIVEL VARCHAR(25) NULL,
 PRIMARY KEY (ESC_ID)
);

-- -----------------------------------------------------
-- TABLE T_PESCADOR
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR (
 TP_ID SERIAL,
 TP_NOME VARCHAR(60) NOT NULL,
 TP_SEXO VARCHAR(1) NULL,
 TP_MATRICULA VARCHAR(45) NULL,
 TP_APELIDO VARCHAR(45) NULL,
 TP_FILIACAOPAI VARCHAR(60) NULL,
 TP_FILIACAOMAE VARCHAR(60) NULL,
 TP_CTPS VARCHAR(45) NULL,
 TP_PIS VARCHAR(45) NULL,
 TP_INSS VARCHAR(45) NULL,
 TP_NIT_CEI VARCHAR(45) NULL,
 TP_RG VARCHAR(45) NULL,
 TP_CMA VARCHAR(45) NULL,
 TP_RGB_MAA_IBAMA VARCHAR(45) NULL,
 TP_CIR_CAP_PORTO VARCHAR(45) NULL,
 TP_CPF VARCHAR(14) NULL,
 TP_DATANASC DATE NULL,
 TMUN_ID_NATURAL INT NULL,
 TE_ID INT NULL,
 TP_ESPECIFICIDADE VARCHAR(255) NULL,
 ESC_ID INT NULL,
 TP_RESP_LAN int null,
 TP_RESP_CAD int null,
 TP_DTA_CAD date,
 TP_OBS VARCHAR(255) NULL,
 PRIMARY KEY (TP_ID),
 CONSTRAINT FK_T_PESCADOR_T_MUNICIPIO1 FOREIGN KEY (TMUN_ID_NATURAL) REFERENCES T_MUNICIPIO (TMUN_ID),
 CONSTRAINT FK_T_PESCADOR_T_ENDERECO1 FOREIGN KEY (TE_ID) REFERENCES T_ENDERECO (TE_ID),
 CONSTRAINT FK_PESCADOR_ESC_ID FOREIGN KEY (ESC_ID) REFERENCES T_ESCOLARIDADE(ESC_ID)
);

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_ESCOLARIDADE
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_ESCOLARIDADE (
--  ESC_ID INT NOT NULL,
--  TP_ID INT NOT NULL,
--  PRIMARY KEY (ESC_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ESCOLARIDADE_T_PESCADOR1
--  FOREIGN KEY (TP_ID)
--  REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ESCOLARIDADE_T_ESCOLARIDADE1 FOREIGN KEY (ESC_ID) REFERENCES T_ESCOLARIDADE (ESC_ID)
--  );

-- -----------------------------------------------------
-- TABLE T_RENDA
-- -----------------------------------------------------
CREATE TABLE T_RENDA (
 REN_ID SERIAL,
 REN_RENDA VARCHAR(40) NULL,
 REN_FATORMIN NUMERIC(4,2) NULL,
 REN_FATORMAX NUMERIC(4,2) NULL,
 PRIMARY KEY (REN_ID)
);

-- -----------------------------------------------------
-- TABLE T_PROGRAMASOCIAL
-- -----------------------------------------------------
CREATE TABLE T_PROGRAMASOCIAL (
 PRS_ID SERIAL NOT NULL,
 PRS_PROGRAMA VARCHAR(100) NULL,
 PRIMARY KEY (PRS_ID)
);

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_PROGRAMASOCIAL
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_PROGRAMASOCIAL (
 TP_ID INT NOT NULL,
 PRS_ID INT NOT NULL,
 PRIMARY KEY (TP_ID, PRS_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_PROGRAMASOCIAL_T_PESCADOR1
 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_PROGRAMASOCIAL_T_PROGRAMASOCIAL1
FOREIGN KEY (PRS_ID) REFERENCES T_PROGRAMASOCIAL (PRS_ID)
);

-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASPROGRAMASOCIAL AS
SELECT
PS.TP_ID, PS.PRS_ID, TBS.PRS_PROGRAMA
FROM
T_PESCADOR_HAS_T_PROGRAMASOCIAL AS PS,
T_PROGRAMASOCIAL AS TBS
WHERE
PS.PRS_ID = TBS.PRS_ID;

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_ENDERECO
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_ENDERECO (
--  TP_ID INT NOT NULL,
--  TE_ID INT NOT NULL,
--  PRIMARY KEY (TE_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ENDERECO_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ENDERECO_T_ENDERECO1 FOREIGN KEY (TE_ID) REFERENCES T_ENDERECO (TE_ID)
-- );

-- -----------------------------------------------------
-- TABLE T_COMUNIDADE
-- -----------------------------------------------------
CREATE TABLE T_COMUNIDADE (
 TCOM_ID SERIAL,
 TCOM_NOME VARCHAR(50) NOT NULL,
 PRIMARY KEY (TCOM_ID),
 UNIQUE (TCOM_NOME)
);

-- -----------------------------------------------------
-- TABLE T_COLONIA
-- -----------------------------------------------------
CREATE TABLE T_COLONIA (
 TC_ID SERIAL,
 TC_NOME VARCHAR(50) NOT NULL,
 TC_ESPECIFICIDADE CHARACTER VARYING(50) NULL,
 TCOM_ID INTEGER NULL,
 TE_ID INTEGER NULL,
 PRIMARY KEY (TC_ID),
 UNIQUE (TC_NOME)
);

-- -----------------------------------------------------
-- TABLE T_ARTEPESCA
-- -----------------------------------------------------
CREATE TABLE T_ARTEPESCA (
 TAP_ID SERIAL,
 TAP_ARTEPESCA VARCHAR(50) NOT NULL,
 tap_arteficha Varchar(50) null,
 PRIMARY KEY (TAP_ID),
 UNIQUE (TAP_ARTEPESCA)
);

-- -----------------------------------------------------
-- TABLE T_TIPOEMBARCACAO
-- -----------------------------------------------------
CREATE TABLE T_TIPOEMBARCACAO (
 TTE_ID SERIAL,
 TTE_TIPOEMBARCACAO VARCHAR(50) NOT NULL,
 PRIMARY KEY (TTE_ID),
 UNIQUE (TTE_TIPOEMBARCACAO)
);

-- -----------------------------------------------------
-- TABLE T_TIPODEPENDENTE
-- -----------------------------------------------------
CREATE TABLE T_TIPODEPENDENTE (
 TTD_ID SERIAL,
 TTD_TIPODEPENDENTE VARCHAR(30) NOT NULL,
 PRIMARY KEY (TTD_ID)
);

-- -----------------------------------------------------
-- TABLE T_AREAPESCA
-- -----------------------------------------------------
CREATE TABLE T_AREAPESCA (
 TAREAP_ID SERIAL,
 TAREAP_AREAPESCA VARCHAR(50) NOT NULL,
 PRIMARY KEY (TAREAP_ID),
 UNIQUE (TAREAP_AREAPESCA)
);

-- -----------------------------------------------------
-- TABLE T_SITUACAO
-- -----------------------------------------------------
CREATE TABLE T_SITUACAO (
 TS_ID SERIAL,
 TS_SITUACAO BOOLEAN DEFAULT TRUE NULL,
 TS_MOTIVO VARCHAR(100) NULL,
 PRIMARY KEY (TS_ID)
);

-- -----------------------------------------------------
-- TABLE T_TIPOTEL
-- -----------------------------------------------------
CREATE TABLE T_TIPOTEL (
 TTEL_ID SERIAL,
 TTEL_DESC VARCHAR(50) NOT NULL,
 PRIMARY KEY (TTEL_ID)
);

-- -----------------------------------------------------
-- TABLE T_TELEFONECONTATO
-- -----------------------------------------------------
CREATE TABLE T_TELEFONECONTATO (
 TTCONT_ID SERIAL,
 TTCONT_DDD DECIMAL(2) NOT NULL,
 TTCONT_TELEFONE DECIMAL(10) NOT NULL,
 TTEL_ID INT NOT NULL,
 PRIMARY KEY (TTCONT_ID),
 CONSTRAINT FK_T_TELEFONECONTATO_T_TIPOTEL1 FOREIGN KEY (TTEL_ID) REFERENCES T_TIPOTEL (TTEL_ID)
);

-- -----------------------------------------------------
-- TABLE T_LOGIN
-- -----------------------------------------------------
CREATE TABLE T_LOGIN (
 TL_ID SERIAL,
 TL_LOGIN VARCHAR(45) NOT NULL,
 TL_HASHSENHA CHAR(40) NOT NULL,
 TL_ULTIMOACESSO TIMESTAMP NULL,
 PRIMARY KEY (TL_ID),
 UNIQUE (TL_LOGIN)
);

-- -----------------------------------------------------
-- TABLE T_PERFIL
-- -----------------------------------------------------
CREATE TABLE T_PERFIL (
 TP_ID SERIAL,
 TP_PERFIL VARCHAR(40) NOT NULL,
 PRIMARY KEY (TP_ID)
);

-- -----------------------------------------------------
-- TABLE T_USUARIO
-- -----------------------------------------------------
CREATE TABLE T_USUARIO (
 TU_ID SERIAL,
 TU_NOME VARCHAR(45) NOT NULL,
 TU_SEXO VARCHAR(1) NOT NULL,
 TU_CPF VARCHAR(14) NOT NULL,
 TU_RG VARCHAR(11) NOT NULL,
 TU_EMAIL VARCHAR(30) NOT NULL,
 TU_TELRES VARCHAR (20) NULL,
 TU_TELCEL VARCHAR (20) NULL,
 TU_USUARIODELETADO BOOLEAN DEFAULT FALSE NOT NULL,
 TL_ID INT NOT NULL,
 TP_ID INT NOT NULL,
 TE_ID INT NOT NULL,
 PRIMARY KEY (TU_ID),
 CONSTRAINT FK_T_USUARIO_T_LOGIN1 FOREIGN KEY (TL_ID) REFERENCES T_LOGIN (TL_ID),
 CONSTRAINT FK_T_USUARIO_T_PERFIL1 FOREIGN KEY (TP_ID) REFERENCES T_PERFIL (TP_ID),
 CONSTRAINT FK_T_USUARIO_T_ENDERECO1 FOREIGN KEY (TE_ID) REFERENCES T_ENDERECO (TE_ID)
 );

-- -----------------------------------------------------
-- TABLE T_HISTORICORECADASTRAMENTO
-- -----------------------------------------------------
CREATE TABLE T_HISTORICORECADASTRAMENTO (
 THR_DATA DATE NOT NULL,
 TP_ID INT NULL,
 TS_ID INT NULL,
 THR_DESCRICAO VARCHAR(45) NULL,
 TU_ID_RESP_COLETA INT NULL,
 TU_ID_RESP_DIGITA INT NULL,
 PRIMARY KEY (THR_DATA, TP_ID, TS_ID),
 CONSTRAINT FK_T_DATARECADASTRAMENTO_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_HISTOORECADASTRAMENTO_T_SITUACAOATUAL1 FOREIGN KEY (TS_ID) REFERENCES T_SITUACAO (TS_ID),
 CONSTRAINT FK_T_HISTOORECADASTRAMENTO_T_USUARIO1 FOREIGN KEY (TU_ID_RESP_COLETA) REFERENCES T_USUARIO (TU_ID),
 CONSTRAINT FK_T_HISTOORECADASTRAMENTO_T_USUARIO2 FOREIGN KEY (TU_ID_RESP_DIGITA) REFERENCES T_USUARIO (TU_ID)
);

-- -----------------------------------------------------
-- TABLE T_TIPOCAPTURADA
-- -----------------------------------------------------
CREATE TABLE T_TIPOCAPTURADA (
 ITC_ID SERIAL,
 ITC_TIPO VARCHAR(30) NULL,
 PRIMARY KEY (ITC_ID)
);

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_TIPOCAPTURADA
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_TIPOCAPTURADA (
 TP_ID INT NOT NULL,
 ITC_ID INT NOT NULL,
 PRIMARY KEY (TP_ID, ITC_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOARTEPESCA_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOCAPTURADA FOREIGN KEY (ITC_ID) REFERENCES T_TIPOCAPTURADA (ITC_ID)
);

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_TIPOARTEPESCA
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_TIPOARTEPESCA (
--  TP_ID INT NOT NULL,
--  TAP_ID INT NOT NULL,
--  ITC_ID INT NULL,
--  PRIMARY KEY (TP_ID, TAP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOARTEPESCA_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOARTEPESCA_T_TIPOARTEPESCA1 FOREIGN KEY (TAP_ID) REFERENCES T_ARTEPESCA (TAP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOCAPTURADA FOREIGN KEY (ITC_ID) REFERENCES T_TIPOCAPTURADA (ITC_ID)
-- );

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_ESPECIECAPTURADAS
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_ESPECIECAPTURADAS (
--  TP_ID INT NOT NULL,
--  T_TIPOCAPTURADA_ITC_ID INT NOT NULL,
--  PRIMARY KEY (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ESPECIECAPTURADAS_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_ESPECIECAPTURADAS_T_TIPOCAPTURADA1 FOREIGN KEY (T_TIPOCAPTURADA_ITC_ID) REFERENCES T_TIPOCAPTURADA (ITC_ID)
-- );

-- -----------------------------------------------------
-- TABLE T_PORTEEMBARCACAO
-- -----------------------------------------------------
CREATE TABLE T_PORTEEMBARCACAO (
 TPE_ID SERIAL,
 TPE_PORTE VARCHAR(30) NOT NULL,
 PRIMARY KEY (TPE_ID)
);

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_EMBARCACAO
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_EMBARCACAO (
--  TTE_ID INT NOT NULL,
--  TP_ID INT NOT NULL,
--  TPTE_MOTOR BOOLEAN NOT NULL,
--  TPE_ID INT NOT NULL,
--  PRIMARY KEY (TTE_ID, TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_EMBARCACAO1 FOREIGN KEY (TTE_ID) REFERENCES T_TIPOEMBARCACAO (TTE_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_PORTEEMBARCACAO1 FOREIGN KEY (TPE_ID) REFERENCES T_PORTEEMBARCACAO (TPE_ID)
-- );

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_EMBARCACAO
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_EMBARCACAO (
 TTE_ID INT NOT NULL,
 TP_ID INT NOT NULL,
 TPTE_MOTOR BOOLEAN NULL,
 TPE_ID INT NULL,
TPTE_DONO INT NULL,
 PRIMARY KEY (TTE_ID, TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_EMBARCACAO1 FOREIGN KEY (TTE_ID) REFERENCES T_TIPOEMBARCACAO (TTE_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_EMBARCACAO_T_PORTEEMBARCACAO1 FOREIGN KEY (TPE_ID) REFERENCES T_PORTEEMBARCACAO (TPE_ID)
);

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_COLONIA
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_COLONIA (
 TP_ID INT NOT NULL,
 TC_ID INT NOT NULL,
 TPTC_DATAINSCCOLONIA DATE NULL,
 PRIMARY KEY (TP_ID, TC_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_COLONIA_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_COLONIA_T_COLONIA1 FOREIGN KEY (TC_ID) REFERENCES T_COLONIA (TC_ID)
);

-- -----------------------------------------------------
-- TABLE T_ALTERACAOSENHA
-- -----------------------------------------------------
CREATE TABLE T_ALTERACAOSENHA (
 TAS_TOKEN CHAR(40) NOT NULL,
 TAS_DATASOLICITACAO TIMESTAMP NOT NULL,
 TAS_DATAALTERACAO TIMESTAMP NULL,
 TU_ID INT NOT NULL,
 PRIMARY KEY (TAS_TOKEN),
 CONSTRAINT FK_T_ALTERACAOSENHA_T_USUARIO1 FOREIGN KEY (TU_ID) REFERENCES T_USUARIO (TU_ID)
);

-- -----------------------------------------------------
-- TABLE T_USUARIO_HAS_T_TELEFONECONTATO
-- -----------------------------------------------------
CREATE TABLE T_USUARIO_HAS_T_TELEFONECONTATO (
 TU_ID INT NOT NULL,
 TTCONT_ID INT NOT NULL,
 PRIMARY KEY (TU_ID, TTCONT_ID),
 CONSTRAINT FK_T_USUARIO_HAS_T_TELEFONECONTATO_T_USUARIO1 FOREIGN KEY (TU_ID) REFERENCES T_USUARIO (TU_ID),
 CONSTRAINT FK_T_USUARIO_HAS_T_TELEFONECONTATO_T_TELEFONECONTATO1 FOREIGN KEY (TTCONT_ID) REFERENCES T_TELEFONECONTATO (TTCONT_ID)
);

-- -- -----------------------------------------------------
-- -- TABLE T_PESCADOR_HAS_T_TELEFONECONTATO
-- -- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_T_TELEFONECONTATO (
--  TP_ID INT NOT NULL,
--  TTCONT_ID INT NOT NULL,
--  PRIMARY KEY (TP_ID, TTCONT_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_TELEFONECONTATO_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_T_TELEFONECONTATO_T_TELEFONECONTATO1 FOREIGN KEY (TTCONT_ID) REFERENCES T_TELEFONECONTATO (TTCONT_ID)
-- );

-- -----------------------------------------------------
-- TABLE T_GRUPO
-- -----------------------------------------------------
CREATE TABLE T_GRUPO (
 GRP_ID SERIAL,
 GRP_NOME VARCHAR(45) NULL,
 PRIMARY KEY (GRP_ID)
);

-- -----------------------------------------------------
-- TABLE T_ORDEM
-- -----------------------------------------------------
CREATE TABLE T_ORDEM (
 ORD_ID SERIAL,
 ORD_NOME VARCHAR(30) NULL,
 ORD_CARACTERISTICA VARCHAR(45) NULL,
 GRP_ID INT NOT NULL,
 PRIMARY KEY (ORD_ID),
 CONSTRAINT FK_DSBQ_ORDEM_DSBQ_GRUPO FOREIGN KEY (GRP_ID) REFERENCES T_GRUPO (GRP_ID)
);

-- -----------------------------------------------------
-- TABLE T_FAMILIA
-- -----------------------------------------------------
CREATE TABLE T_FAMILIA (
 FAM_ID SERIAL,
 FAM_NOME VARCHAR(45) NULL,
 FAM_ORDEM_FILOGENETICA INT NULL,
 FAM_TIPO VARCHAR(45) NULL,
 FAM_CARACTERISTICA VARCHAR(255) NULL,
 ORD_ID INT NOT NULL,
 PRIMARY KEY (FAM_ID),
 CONSTRAINT FK_DSBQ_FAMILIA_DSBQ_ORDEM1 FOREIGN KEY (ORD_ID) REFERENCES T_ORDEM (ORD_ID)
);

-- -----------------------------------------------------
-- TABLE T_GENERO
-- -----------------------------------------------------
CREATE TABLE T_GENERO (
 GEN_ID SERIAL,
 GEN_NOME VARCHAR(45) NULL,
 FAM_ID INT NOT NULL,
 PRIMARY KEY (GEN_ID),
 CONSTRAINT FK_DSBQ_GENERO_DSBQ_FAMILIA1 FOREIGN KEY (FAM_ID) REFERENCES T_FAMILIA (FAM_ID)
);

-- -----------------------------------------------------
-- TABLE T_ESPECIE
-- -----------------------------------------------------
CREATE TABLE T_ESPECIE (
 ESP_ID SERIAL,
 ESP_NOME VARCHAR(45) NULL,
 ESP_DESCRITOR VARCHAR(45) NULL,
 ESP_NOME_COMUM VARCHAR(45) NULL,
 GEN_ID INT NOT NULL,
 PRIMARY KEY (ESP_ID),
 CONSTRAINT FK_DSBQ_ESPÉCIE_DSBQ_GENERO1 FOREIGN KEY (GEN_ID) REFERENCES T_GENERO (GEN_ID)
);

-- -----------------------------------------------------
-- TABLE T_SUBAMOSTRA
-- -----------------------------------------------------
CREATE TABLE t_subamostra
(
  sa_id serial NOT NULL,
  sa_pescador text,
  sa_datachegada date,
  CONSTRAINT t_subamostra_pkey PRIMARY KEY (sa_id)
);
-- -----------------------------------------------------
-- TABLE T_PORTO
-- -----------------------------------------------------
CREATE TABLE T_PORTO (
 PTO_ID SERIAL,
 PTO_NOME VARCHAR(45) NULL,
 PTO_LOCAL VARCHAR(45) NULL,
 TMUN_ID INT NOT NULL,
 PRIMARY KEY (PTO_ID),
 CONSTRAINT FK_DSBQ_PORTO_T_MUNICIPIO1 FOREIGN KEY (TMUN_ID) REFERENCES T_MUNICIPIO (TMUN_ID)
);


-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_PORTO (
 TP_ID INT NOT NULL,
 PTO_ID INT NOT NULL,
 PRIMARY KEY (TP_ID,  PTO_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_PORTO_TP_ID FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_PORTO_PTO_ID FOREIGN KEY (PTO_ID) REFERENCES T_PORTO (PTO_ID)
);

-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASPORTO AS
 SELECT PP.TP_ID, PP.PTO_ID, PTO.PTO_NOME, PTO.PTO_LOCAL
 FROM T_PESCADOR_HAS_T_PORTO AS PP, T_PORTO AS PTO
 WHERE PP.PTO_ID=PTO.PTO_ID;

-- -----------------------------------------------------
-- TABLE T_TEMPO
-- -----------------------------------------------------
CREATE TABLE T_TEMPO (
 TMP_ID SERIAL,
 TMP_ESTADO VARCHAR(45) NULL,
 PRIMARY KEY (TMP_ID)
);

-- -----------------------------------------------------
-- TABLE T_VENTO
-- -----------------------------------------------------
CREATE TABLE T_VENTO (
 VNT_ID SERIAL,
 VNT_FORCA VARCHAR(20) NULL,
 PRIMARY KEY (VNT_ID)
);

-- -----------------------------------------------------
-- TABLE T_FICHA_DIARIA
-- -----------------------------------------------------
CREATE TABLE T_FICHA_DIARIA (
 FD_ID SERIAL,
 T_ESTAGIARIO_TU_ID INT NOT NULL,
 T_MONITOR_TU_ID1 INT NOT NULL,
 FD_DATA DATE NOT NULL,
 FD_TURNO VARCHAR NOT NULL,
 OBS VARCHAR(255) NULL,
 PTO_ID INT NOT NULL,
 TMP_ID INT NOT NULL,
 VNT_ID INT NOT NULL,
 PRIMARY KEY (FD_ID),
 CONSTRAINT FK_DSBQ_FICHA_DIARIA_DSBQ_PORTO1 FOREIGN KEY (PTO_ID) REFERENCES T_PORTO (PTO_ID),
 CONSTRAINT FK_DSBQ_FICHA_DIARIA_T_USUARIO1 FOREIGN KEY (T_ESTAGIARIO_TU_ID) REFERENCES T_USUARIO (TU_ID),
 CONSTRAINT FK_DSBQ_FICHA_DIARIA_T_USUARIO2 FOREIGN KEY (T_MONITOR_TU_ID1) REFERENCES T_USUARIO (TU_ID),
 CONSTRAINT FK_DSBQ_FICHA_DIARIA_DSBQ_TEMPO1 FOREIGN KEY (TMP_ID) REFERENCES T_TEMPO (TMP_ID),
 CONSTRAINT FK_DSBQ_FICHA_DIARIA_DSBQ_VENTO1 FOREIGN KEY (VNT_ID)REFERENCES T_VENTO (VNT_ID)
);

CREATE VIEW V_FICHA_DIARIA AS
SELECT FD.FD_ID, FD.FD_DATA, UPPER(SUBSTRING(FD.FD_TURNO, 1, 1)) AS FD_TURNO,
FD.PTO_ID, TP.PTO_NOME,
FD.TMP_ID, TEMPO.TMP_ESTADO,
FD.VNT_ID, VENTO.VNT_FORCA,
FD.T_ESTAGIARIO_TU_ID, TUE.TU_NOME AS T_ESTAGIARIO,
FD.T_MONITOR_TU_ID1, TUM.TU_NOME AS T_MONITOR
FROM T_FICHA_DIARIA AS FD,
T_PORTO AS TP,
T_TEMPO AS TEMPO,
T_VENTO AS VENTO,
T_USUARIO AS TUE,
T_USUARIO AS TUM
WHERE FD.PTO_ID=TP.PTO_ID AND
FD.TMP_ID=TEMPO.TMP_ID AND
FD.VNT_ID=VENTO.VNT_ID AND
FD.T_ESTAGIARIO_TU_ID=TUE.TU_ID AND
FD.T_MONITOR_TU_ID1=TUM.TU_ID
ORDER BY FD.FD_DATA DESC , TP.PTO_NOME ASC;


-- -----------------------------------------------------
-- TABLE T_MONITORAMENTO
-- -----------------------------------------------------
CREATE TABLE T_MONITORAMENTO (
 MNT_ID SERIAL,
 MNT_ARTE INT NULL,
 MNT_QUANTIDADE INT NULL,
 MNT_MONITORADO BOOLEAN NULL,
 FD_ID INT NOT NULL,
 PRIMARY KEY (MNT_ID),
 CONSTRAINT FK_DSBQ_MONITORAMENTO_DSBQ_FICHA_DIARIA1 FOREIGN KEY (FD_ID) REFERENCES T_FICHA_DIARIA (FD_ID)
);



-- -----------------------------------------------------
-- TABLE T_PESQUEIRO_AF
-- -----------------------------------------------------
CREATE TABLE T_PESQUEIRO_AF (
 PAF_ID SERIAL,
 PAF_PESQUEIRO VARCHAR(45) NULL,
 PRIMARY KEY (PAF_ID)
);


-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_TT_DEPENDENTE
-- -----------------------------------------------------
-- CREATE TABLE T_PESCADOR_HAS_TT_DEPENDENTE (
--  TPTD_ID SERIAL,
--  TP_ID INT NOT NULL,
--  T_TIPODEPENDENTE_TTD_ID INT NOT NULL,
--  TP_TD_QUANTIDADE INTEGER,
--  PRIMARY KEY (TPTD_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_TT_DEPENDENTE_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
--  CONSTRAINT FK_T_PESCADOR_HAS_TT_DEPENDENTE_T_TIPODEPENDENTE1 FOREIGN KEY (T_TIPODEPENDENTE_TTD_ID) REFERENCES T_TIPODEPENDENTE (TTD_ID)
-- );

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_COMUNIDADE
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_COMUNIDADE (
 TP_ID INT NOT NULL,
 TCOM_ID INT NOT NULL,
 PRIMARY KEY (TP_ID,  TCOM_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_COMUNIDADE_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_COMUNIDADE_T_COMUNIDADE1 FOREIGN KEY (TCOM_ID) REFERENCES T_COMUNIDADE (TCOM_ID)
);

-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASCOMUNIDADE AS
 SELECT PC.TP_ID, PC.TCOM_ID, COM.TCOM_NOME
 FROM T_PESCADOR_HAS_T_COMUNIDADE AS PC, T_COMUNIDADE AS COM
 WHERE PC.TCOM_ID=COM.TCOM_ID;


-- -----------------------------------------------------
-- VIEW USUARIO
-- -----------------------------------------------------
CREATE VIEW V_USUARIO AS
 SELECT T_USUARIO.TU_ID,
 T_USUARIO.TU_NOME, T_USUARIO.TU_SEXO,
 T_USUARIO.TU_CPF, T_USUARIO.TU_RG,
 T_USUARIO.TU_EMAIL, T_USUARIO.TU_USUARIODELETADO,
 T_USUARIO.TU_TELRES, T_USUARIO.TU_TELCEL,
 T_USUARIO.TL_ID,
 T_USUARIO.TP_ID, T_PERFIL.TP_PERFIL,
 T_USUARIO.TE_ID,
 T_LOGIN.TL_LOGIN,
 T_ENDERECO.TE_LOGRADOURO, T_ENDERECO.TE_NUMERO, T_ENDERECO.TE_COMP, T_ENDERECO.TE_BAIRRO, T_ENDERECO.TE_CEP,
 T_ENDERECO.TMUN_ID, T_MUNICIPIO.TMUN_MUNICIPIO, T_MUNICIPIO.TUF_SIGLA
 FROM T_USUARIO, T_LOGIN, T_ENDERECO, T_MUNICIPIO, T_PERFIL
 WHERE T_USUARIO.TL_ID = T_LOGIN.TL_ID AND
 T_USUARIO.TE_ID = T_ENDERECO.TE_ID AND
 T_ENDERECO.TMUN_ID = T_MUNICIPIO.TMUN_ID AND
 T_USUARIO.TP_ID = T_PERFIL.TP_ID;

-- -----------------------------------------------------
-- VIEW COLONIA
-- -----------------------------------------------------
CREATE OR REPLACE VIEW V_COLONIA AS
 SELECT T_COLONIA.TC_ID, T_COLONIA.TC_NOME, T_COLONIA.TC_ESPECIFICIDADE, T_COLONIA.TCOM_ID,
 T_COLONIA.TE_ID, T_ENDERECO.TE_LOGRADOURO, T_ENDERECO.TE_NUMERO, T_ENDERECO.TE_COMP, T_ENDERECO.TE_BAIRRO, T_ENDERECO.TE_CEP,
 T_ENDERECO.TMUN_ID, T_MUNICIPIO.TMUN_MUNICIPIO, T_MUNICIPIO.TUF_SIGLA
 FROM T_COLONIA LEFT JOIN T_ENDERECO ON T_COLONIA.TE_ID = T_ENDERECO.TE_ID LEFT JOIN T_MUNICIPIO ON T_ENDERECO.TMUN_ID = T_MUNICIPIO.TMUN_ID;


DROP VIEW v_pescador_porto;

CREATE OR REPLACE VIEW v_pescador_porto AS 
 SELECT tp.tp_id, tp.tp_nome, tp.tp_sexo, tp.tpr_id, tpr.tpr_descricao, 
    tp.tp_pescadordeletado, pto.pto_nome, loc.tl_local
   FROM t_pescador tp
   LEFT JOIN t_projeto tpr ON tp.tpr_id = tpr.tpr_id
   LEFT JOIN t_pescador_has_t_porto tppto ON tppto.tp_id = tp.tp_id
   LEFT JOIN t_porto pto ON tppto.pto_id = pto.pto_id
   LEFT JOIN t_local loc ON pto.tl_id = loc.tl_id
  WHERE tp.tp_pescadordeletado = false;

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
DROP VIEW v_pescador;
CREATE OR REPLACE VIEW v_pescador AS 
 SELECT tp.tp_id, tp.tp_nome, tp.tp_sexo, tp.tp_matricula, tp.tp_apelido, 
    tp.tp_filiacaopai, tp.tp_filiacaomae, tp.tp_ctps, tp.tp_pis, tp.tp_inss, 
    tp.tp_nit_cei, tp.tp_rg, tp.tp_cma, tp.tp_rgb_maa_ibama, 
    tp.tp_cir_cap_porto, tp.tp_cpf, tp.tp_datanasc, tp.tp_dta_cad, 
    tp.tp_especificidade, tp.esc_id, tesc.esc_nivel, tp.tmun_id_natural, 
    tm.tmun_municipio AS munnat, tm.tuf_sigla AS signat, tp.te_id, 
    te.te_logradouro, te.te_numero, te.te_comp, te.te_bairro, te.te_cep, 
    te.tmun_id, tmi.tmun_municipio, tmi.tuf_sigla, tp.tp_resp_lan, 
    tlan.tu_nome AS tu_nome_lan, tp.tp_resp_cad, tcad.tu_nome AS tu_nome_cad, 
    tp.tp_obs, col.tc_id, tc.tc_nome, tcom.tcom_id, tcom.tcom_nome, tp.tpr_id, 
    tpr.tpr_descricao, tp.tp_pescadordeletado, tp.tp_especialidade, pto.pto_nome, pto.tl_local
   FROM t_pescador tp
   LEFT JOIN t_municipio tm ON tp.tmun_id_natural = tm.tmun_id
   LEFT JOIN t_endereco te ON tp.te_id = te.te_id
   LEFT JOIN t_escolaridade tesc ON tp.esc_id = tesc.esc_id
   LEFT JOIN t_usuario tlan ON tp.tp_resp_lan = tlan.tu_id
   LEFT JOIN t_usuario tcad ON tp.tp_resp_cad = tcad.tu_id
   LEFT JOIN t_pescador_has_t_comunidade com ON com.tp_id = tp.tp_id
   LEFT JOIN t_comunidade tcom ON tcom.tcom_id = com.tcom_id
   LEFT JOIN t_pescador_has_t_colonia col ON col.tp_id = tp.tp_id
   LEFT JOIN t_municipio tmi ON te.tmun_id = tmi.tmun_id
   LEFT JOIN t_colonia tc ON tc.tc_id = col.tc_id
   LEFT JOIN t_projeto tpr ON tp.tpr_id = tpr.tpr_id
   LEFT JOIN v_pescador_porto pto On tp.tp_id = pto.tp_id
  WHERE tp.tp_pescadordeletado = false;

-- -------------------------------------q----------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_TELEFONE
(
 TPT_TP_ID INTEGER NOT NULL,
 TPT_TTEL_ID INTEGER NOT NULL,
 TPT_TELEFONE VARCHAR(20) NOT NULL,
 CONSTRAINT T_PESCADORCONTATO_PKEY PRIMARY KEY (TPT_TP_ID, TPT_TTEL_ID),
 CONSTRAINT FK_TPT_TP FOREIGN KEY (TPT_TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_TPT_TTEL FOREIGN KEY (TPT_TTEL_ID) REFERENCES T_TIPOTEL (TTEL_ID)
);

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASTELEFONE AS
SELECT PT.TPT_TP_ID, PT.TPT_TTEL_ID, PT.TPT_TELEFONE, TT.TTEL_DESC
FROM T_PESCADOR_HAS_TELEFONE AS PT, T_TIPOTEL AS TT
WHERE PT.TPT_TTEL_ID = TT.TTEL_ID;

CREATE TABLE T_PESCADOR_HAS_T_TIPODEPENDENTE
(
 TP_ID INTEGER NOT NULL,
 TTD_ID INTEGER NOT NULL,
 TPTD_QUANTIDADE INTEGER,
 CONSTRAINT T_PESCADOR_HAS_T_TIPODEPENDENTE_PKEY PRIMARY KEY (TP_ID, TTD_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPODEPENDENTE_TP_ID FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPODEPENDENTE_TTD_ID FOREIGN KEY (TTD_ID) REFERENCES T_TIPODEPENDENTE (TTD_ID)
);

-- INSERT INTO T_PESCADOR_HAS_T_TIPODEPENDENTE (TP_ID, TTD_ID, TPTD_QUANTIDADE)
-- SELECT TP_ID, T_TIPODEPENDENTE_TTD_ID, TP_TD_QUANTIDADE FROM T_PESCADOR_HAS_TT_DEPENDENTE ;

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASDEPENDENTE AS
SELECT
PD.TP_ID, PD.TTD_ID, PD.TPTD_QUANTIDADE,
TD.TTD_TIPODEPENDENTE
FROM
T_PESCADOR_HAS_T_TIPODEPENDENTE AS PD,
T_TIPODEPENDENTE AS TD
WHERE
PD.TTD_ID = TD.TTD_ID;


-- -----------------------------------------------------
-- -----------------------------------------------------
CREATE TABLE T_TIPORENDA (
TTR_ID SERIAL,
TTR_DESCRICAO VARCHAR(45) NOT NULL,
CONSTRAINT T_TIPORENDA_TTR_ID_PKEY PRIMARY KEY (TTR_ID)
);

-- INSERT INTO T_TIPORENDA VALUES (1, 'PESCA');
-- INSERT INTO T_TIPORENDA VALUES (2, 'OUTRA RENDA');


-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
--DROP TABLE IF EXISTS T_PESCADOR_HAS_T_RENDA;
CREATE TABLE T_PESCADOR_HAS_T_RENDA
(
 TP_ID INTEGER NOT NULL,
 REN_ID INTEGER NOT NULL,
 TTR_ID INTEGER NOT NULL,
 CONSTRAINT T_PESCADOR_HAS_T_RENDA_PKEY PRIMARY KEY (TP_ID, REN_ID, TTR_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_RENDA_TP_ID FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_RENDA FOREIGN KEY (REN_ID) REFERENCES T_RENDA (REN_ID),
CONSTRAINT FK_T_PESCADOR_HAS_T_RENDA_TTR_ID FOREIGN KEY (TTR_ID) REFERENCES T_TIPORENDA (TTR_ID)
);

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASRENDA AS
SELECT
PHR.TP_ID,
PHR.REN_ID, TR.REN_RENDA,
PHR.TTR_ID, TTR.TTR_DESCRICAO
FROM
T_PESCADOR_HAS_T_RENDA AS PHR,
T_RENDA AS TR,
T_TIPORENDA AS TTR
WHERE
PHR.REN_ID = TR.REN_ID AND
PHR.TTR_ID = TTR.TTR_ID;

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADORHASCOLONIA AS
SELECT
PHC.TP_ID,
PHC.TC_ID, TC.TC_NOME,
PHC.TPTC_DATAINSCCOLONIA
FROM
T_PESCADOR_HAS_T_COLONIA AS PHC,
T_COLONIA AS TC
WHERE
PHC.TC_ID = TC.TC_ID;

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
-- CREATE VIEW V_PESCADORHASEMBARCACAO AS
-- SELECT
-- PHE.TP_ID,
-- PHE.TTE_ID, TTE.TTE_TIPOEMBARCACAO,
-- PHE.TPTE_MOTOR,
-- PHE.TPE_ID, TPE.TPE_PORTE
-- FROM
-- T_PESCADOR_HAS_T_EMBARCACAO AS PHE,
-- T_TIPOEMBARCACAO AS TTE,
-- T_PORTEEMBARCACAO AS TPE
-- WHERE
-- PHE.TTE_ID = TTE.TTE_ID AND
-- PHE.TPE_ID = TPE.TPE_ID;


CREATE VIEW V_PESCADORHASEMBARCACAO AS
SELECT
PHE.TP_ID,
PHE.TTE_ID, TTE.TTE_TIPOEMBARCACAO,
PHE.TPTE_MOTOR,
PHE.TPE_ID, TPE.TPE_PORTE,
PHE.TPTE_DONO
FROM
T_PESCADOR_HAS_T_EMBARCACAO AS PHE,
T_TIPOEMBARCACAO AS TTE,
T_PORTEEMBARCACAO AS TPE
WHERE
PHE.TTE_ID = TTE.TTE_ID AND
PHE.TPE_ID = TPE.TPE_ID;

-- -- -----------------------------------------------------
-- -- VIEW Pescador
-- -- -----------------------------------------------------
-- CREATE VIEW V_PESCADORHASARTETIPOAREA AS
-- SELECT
-- PATA.TP_ID,
-- PATA.TAP_ID, ARTE.TAP_ARTEPESCA,
-- PATA.ITC_ID, TIPO.ITC_TIPO
-- FROM
-- T_PESCADOR_HAS_T_TIPOARTEPESCA AS PATA,
-- T_TIPOCAPTURADA AS TIPO,
-- T_ARTEPESCA AS ARTE
-- WHERE
-- PATA.TAP_ID = ARTE.TAP_ID AND
-- PATA.ITC_ID = TIPO.ITC_ID;

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_AREAPESCA
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_AREAPESCA (
TP_ID INT NOT NULL,
TAREAP_ID INT NOT NULL,
 PRIMARY KEY (TP_ID, TAREAP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_AREAPESCA_TP_ID FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_AREAPESCA_TAREAP_ID FOREIGN KEY (TAREAP_ID) REFERENCES T_AREAPESCA (TAREAP_ID)
);

--INSERT INTO T_PESCADOR_HAS_T_AREAPESCA (TP_ID, TAREAP_ID)
--SELECT TP_ID, TAREAP_ID FROM T_AREAPESCA_HAS_T_PESCADOR;

---DROP TABLE IF EXISTS T_AREAPESCA_HAS_T_PESCADOR;

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADOR_HAS_T_AREAPESCA AS
SELECT PA.TP_ID, PA.TAREAP_ID, AREA.TAREAP_AREAPESCA
FROM T_PESCADOR_HAS_T_AREAPESCA AS PA, T_AREAPESCA AS AREA
WHERE PA.TAREAP_ID = AREA.TAREAP_ID;

-- -----------------------------------------------------
-- TABLE T_PESCADOR_HAS_T_ARTEPESCA
-- -----------------------------------------------------
CREATE TABLE T_PESCADOR_HAS_T_ARTEPESCA (
 TP_ID INT NOT NULL,
 TAP_ID INT NOT NULL,
 PRIMARY KEY (TP_ID, TAP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOARTEPESCA_T_PESCADOR1 FOREIGN KEY (TP_ID) REFERENCES T_PESCADOR (TP_ID),
 CONSTRAINT FK_T_PESCADOR_HAS_T_TIPOARTEPESCA_T_TIPOARTEPESCA1 FOREIGN KEY (TAP_ID) REFERENCES T_ARTEPESCA (TAP_ID)
);

-- -----------------------------------------------------
-- VIEW Pescador
-- -----------------------------------------------------
CREATE VIEW V_PESCADOR_HAS_T_ARTEPESCA AS
SELECT PA.TP_ID, PA.TAP_ID, ARTE.TAP_ARTEPESCA
FROM T_PESCADOR_HAS_T_ARTEPESCA AS PA, T_ARTEPESCA AS ARTE
WHERE PA.TAP_ID = ARTE.TAP_ID;

-- -----------------------------------------------------
-- VIEW V_PESCADOR_HAS_T_TIPOCAPTURADA
-- -----------------------------------------------------
CREATE VIEW V_PESCADOR_HAS_T_TIPOCAPTURADA AS
SELECT PA.TP_ID, PA.ITC_ID, TIPO.ITC_TIPO
FROM T_PESCADOR_HAS_T_TIPOCAPTURADA AS PA, T_TIPOCAPTURADA AS TIPO
WHERE PA.ITC_ID = TIPO.ITC_ID;


-- -----------------------------------------------------
-- VIEW MONITORAMENTO BY FICHA DIARIA
-- -----------------------------------------------------
--
CREATE OR REPLACE VIEW v_monitoramentobyficha AS
 SELECT t_monitoramento.mnt_id, t_monitoramento.mnt_arte,
    t_monitoramento.mnt_quantidade, t_monitoramento.mnt_monitorado,
    t_ficha_diaria.fd_id, t_artepesca.tap_artepesca
   FROM t_monitoramento, t_ficha_diaria, t_artepesca
  WHERE t_monitoramento.fd_id = t_ficha_diaria.fd_id AND t_monitoramento.mnt_arte = t_artepesca.tap_id;


-- Table: t_barco

--DROP TABLE t_barco;

CREATE TABLE t_barco
(
  bar_id serial NOT NULL,
  bar_nome character varying(45) NULL,
  CONSTRAINT t_barco_pkey PRIMARY KEY (bar_id)
);
-- Table: t_isca

--DROP TABLE t_isca;

CREATE TABLE t_isca
(
  isc_id serial NOT NULL,
  isc_tipo character varying(45),
  CONSTRAINT t_isca_pkey PRIMARY KEY (isc_id)
);
-- Table: t_avistamento

-- DROP TABLE t_avistamento;

CREATE TABLE T_AVISTAMENTO
(
  AVS_ID SERIAL NOT NULL,
  AVS_DESCRICAO CHARACTER VARYING(50) NULL,
  CONSTRAINT T_AVISTAMENTO_PKEY PRIMARY KEY (AVS_ID)
);


-- Table: t_mare



CREATE TABLE t_mare
(
  mre_id serial NOT NULL,
  mre_tipo character varying(20),
  CONSTRAINT t_mare_pkey PRIMARY KEY (mre_id)
);


-- -----------------------------------------------------
-- TABLE T_DESTINOPESCADO
-- -----------------------------------------------------
DROP TABLE T_DESTINOPESCADO;
CREATE TABLE T_DESTINOPESCADO (
 DP_ID SERIAL,
 DP_DESTINO VARCHAR(40) NULL,
 PRIMARY KEY (DP_ID)
);

-- -- Table: t_monitoramento
--
-- --DROP TABLE t_monitoramento;
--
-- CREATE TABLE t_monitoramento
-- (
--   mnt_id serial NOT NULL,
--   mnt_arte integer,
--   mnt_quantidade integer NULL,
--   mnt_monitorado boolean,
--   fd_id integer NOT NULL,
--   CONSTRAINT t_monitoramento_pkey PRIMARY KEY (mnt_id),
--   CONSTRAINT fk_dsbq_monitoramento_dsbq_ficha_diaria1 FOREIGN KEY (fd_id)
--       REFERENCES t_ficha_diaria (fd_id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION
-- );
-- Table: t_arrastofundo


CREATE TABLE t_arrastofundo
(
  af_id serial NOT NULL,
  af_embarcado boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  af_quantpescadores integer NULL,
  af_dhsaida timestamp without time zone NULL,
  af_dhvolta timestamp without time zone NULL,
  af_diesel double precision NULL,
  af_oleo double precision NULL,
  af_alimento double precision NULL,
  af_gelo double precision NULL,
  af_subamostra boolean NULL,
  sa_id integer NULL,
  af_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  af_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_arrastofundo_pkey PRIMARY KEY (af_id),
  CONSTRAINT fk_t_arrastofundo_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_arrastofundo_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: t_calao

CREATE TABLE t_calao
(
  cal_id serial NOT NULL,
  cal_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer,
  cal_quantpescadores integer,
  cal_data date,
  cal_tempogasto time without time zone,
  cal_subamostra boolean,
  sa_id integer,
  cal_npanos integer,
  cal_tamanho double precision,
  cal_altura double precision,
  cal_malha double precision,
  cal_numlances integer,
  cal_obs character varying(255),
  mnt_id integer NOT NULL,
  cal_motor boolean,
  dp_id integer,
  cal_tamanho1 double precision,
  cal_tamanho2 double precision,
  CONSTRAINT t_calao_pkey PRIMARY KEY (cal_id),
  CONSTRAINT fk_t_calao_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_calao_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_calao_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_calao_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_calao_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_calao_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_coletamanual
(
  cml_id serial NOT NULL,
  cml_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  cml_quantpescadores integer,
  cml_dhsaida timestamp without time zone NULL,
  cml_dhvolta timestamp without time zone NULL,
  cml_tempogasto time without time zone NULL,
  cml_subamostra boolean NULL,
  sa_id integer NULL,
  cml_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NULL,
  cml_mreviva boolean NULL,
  cml_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_coletamanual_pkey PRIMARY KEY (cml_id),
  CONSTRAINT fk_t_coletamanual_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_coletamanual_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_coletamanual_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- Table: t_emalhe
CREATE TABLE t_emalhe
(
  em_id serial NOT NULL,
  em_embarcado boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  em_quantpescadores integer NULL,
  em_dhlancamento timestamp without time zone NULL,
  em_dhrecolhimento timestamp without time zone NULL,
  em_diesel double precision NULL,
  em_oleo double precision NULL,
  em_alimento double precision NULL,
  em_gelo double precision NULL,
  em_subamostra boolean NULL,
  sa_id integer NULL,
  em_tamanho double precision NULL,
  em_altura double precision NULL,
  em_numpanos integer NULL,
  em_malha integer NULL,
  em_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  em_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_emalhe_pkey PRIMARY KEY (em_id),
  CONSTRAINT fk_t_emalhe_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_emalhe_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_emalhe_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_emalhe_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_emalhe_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_emalhe_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_emalhe_has_t_especie_capturada


-- Table: t_grosseira

CREATE TABLE t_grosseira
(
  grs_id serial NOT NULL,
  grs_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  grs_numpescadores integer NULL,
  grs_dhsaida timestamp without time zone NULL,
  grs_dhvolta timestamp without time zone NULL,
  grs_diesel double precision NULL,
  grs_oleo double precision NULL,
  grs_alimento double precision NULL,
  grs_gelo double precision NULL,
  grs_numlinhas integer NULL,
  grs_numanzoisplinha integer NULL,
  grs_subamostra boolean NULL,
  sa_id integer NULL,
  isc_id integer NULL,
  grs_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  grs_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_grosseira_pkey PRIMARY KEY (grs_id),
  CONSTRAINT fk_t_grosseira_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_t_isca1 FOREIGN KEY (isc_id)
      REFERENCES t_isca (isc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_grosseira_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_grosseira_has_t_especie_capturada


-- Table: t_jerere

CREATE TABLE t_jerere
(
  jre_id serial NOT NULL,
  jre_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  jre_quantpescadores integer NULL,
  jre_dhsaida timestamp without time zone NULL,
  jre_dhvolta timestamp without time zone NULL,
  jre_tempogasto time without time zone NULL,
  jre_subamostra boolean NULL,
  sa_id integer NULL,
  jre_numarmadilhas integer NULL,
  jre_obs character varying(255) NULL,
  mnt_id integer NULL,
  mre_id integer NULL,
  jre_mreviva boolean NULL,
  jre_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_jerere_pkey PRIMARY KEY (jre_id),
  CONSTRAINT fk_t_jerere_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_jerere_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_jerere_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_jerere_has_t_especie_capturada



-- Table: t_linha


CREATE TABLE t_linha
(
  lin_id serial NOT NULL,
  lin_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  lin_numpescadores integer NULL,
  lin_dhsaida timestamp without time zone NULL,
  lin_dhvolta timestamp without time zone NULL,
  lin_diesel double precision NULL,
  lin_oleo double precision NULL,
  lin_alimento double precision NULL,
  lin_gelo double precision NULL,
  lin_subamostra boolean NULL,
  sa_id integer NULL,
  lin_numlinhas integer NULL,
  lin_numanzoisplinha integer NULL,
  isc_id integer NULL,
  mnt_id integer NOT NULL,
  lin_motor boolean NULL,
  lin_obs character varying(255) NULL,
  dp_id integer null,
  CONSTRAINT t_linha_pkey PRIMARY KEY (lin_id),
  CONSTRAINT fk_t_linha_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linha_t_isca1 FOREIGN KEY (isc_id)
      REFERENCES t_isca (isc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linha_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linha_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linha_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linha_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_linha_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_linha_has_t_especie_capturada



-- Table: t_linhafundo


CREATE TABLE t_linhafundo
(
  lf_id serial NOT NULL,
  lf_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  lf_quantpescadores integer NULL,
  lf_dhsaida timestamp without time zone NULL,
  lf_dhvolta timestamp without time zone NULL,
  lf_tempogasto time without time zone NULL,
  lf_diesel double precision NULL,
  lf_oleo double precision NULL,
  lf_alimento double precision NULL,
  lf_gelo double precision NULL,
  lf_subamostra boolean NULL,
  sa_id integer NULL,
  lf_numlinhas integer NULL,
  lf_numanzoisplinha integer NULL,
  isc_id integer NULL,
  lf_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  lf_mreviva boolean NULL,
  lf_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_linhafundo_pkey PRIMARY KEY (lf_id),
  CONSTRAINT fk_t_linhafundo_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_t_isca1 FOREIGN KEY (isc_id)
      REFERENCES t_isca (isc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_linhafundo_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_linhafundo_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE t_manzua
(
  man_id serial NOT NULL,
  man_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  man_quantpescadores integer NULL,
  man_dhsaida timestamp without time zone NULL,
  man_dhvolta timestamp without time zone NULL,
  man_tempogasto time without time zone NULL,
  man_subamostra boolean NULL,
  sa_id integer NULL,
  man_numarmadilhas integer NULL,
  man_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NULL,
  man_mreviva boolean NULL,
  man_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_manzua_pkey PRIMARY KEY (man_id),
  CONSTRAINT fk_t_manzua_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_manzua_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_manzua_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_mergulho
(
  mer_id serial NOT NULL,
  mer_embarcada boolean ,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  mer_quantpescadores integer NULL,
  mer_dhsaida timestamp without time zone NULL,
  mer_dhvolta timestamp without time zone NULL,
  mer_tempogasto time without time zone NULL,
  mer_subamostra boolean NULL,
  sa_id integer NULL,
  mnt_id integer NOT NULL,
  mer_obs character varying(255) NULL,
  mre_id integer NULL,
  mer_mreviva boolean NULL,
  mer_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_mergulho_pkey PRIMARY KEY (mer_id),
  CONSTRAINT fk_t_mergulho_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_mergulho_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_mergulho_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_ratoeira
(
  rat_id serial NOT NULL,
  rat_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  rat_quantpescadores integer NULL,
  rat_dhsaida timestamp without time zone NULL,
  rat_dhvolta timestamp without time zone NULL,
  rat_tempogasto time without time zone NULL,
  rat_subamostra boolean NULL,
  sa_id integer NULL,
  rat_numarmadilhas integer NULL,
  rat_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NULL,
  rat_mreviva boolean NULL,
  rat_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_ratoeira_pkey PRIMARY KEY (rat_id),
  CONSTRAINT fk_t_ratoeira_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_ratoeira_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_ratoeira_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_siripoia
(
  sir_id serial NOT NULL,
  sir_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  sir_quantpescadores integer NULL,
  sir_dhsaida timestamp without time zone NULL,
  sir_dhvolta timestamp without time zone NULL,
  sir_tempogasto time without time zone NULL,
  sir_subamostra boolean NULL,
  sa_id integer NULL,
  sir_numarmadilhas integer NULL,
  sir_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NULL,
  sir_mreviva boolean NULL,
  sir_motor boolean NULL,
    dp_id integer null,
  CONSTRAINT t_siripoia_pkey PRIMARY KEY (sir_id),
  CONSTRAINT fk_t_siripoia_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_siripoia_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_siripoia_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_tarrafa
(
  tar_id serial NOT NULL,
  tar_embarcado boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  tar_quantpescadores integer NULL,
  tar_data date NULL,
  tar_tempogasto time without time zone NULL,
  tar_subamostra boolean NULL,
  sa_id integer NULL,
  tar_roda double precision NULL,
  tar_altura double precision NULL,
  tar_malha double precision NULL,
  tar_numlances integer NULL,
  mnt_id integer NOT NULL,
  tar_obs character varying(255) NULL,
  tar_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_tarrafa_pkey PRIMARY KEY (tar_id),
  CONSTRAINT fk_t_tarrafa_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_tarrafa_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_varapesca
(
  vp_id serial NOT NULL,
  vp_embarcada boolean NULL,
  bar_id integer NULL,
  tte_id integer NULL,
  tp_id_entrevistado integer NULL,
  vp_quantpescadores integer NULL,
  vp_dhsaida timestamp without time zone NULL,
  vp_dhvolta timestamp without time zone NULL,
  vp_tempogasto time without time zone NULL,
  vp_diesel double precision NULL,
  vp_oleo double precision NULL,
  vp_alimento double precision NULL,
  vp_gelo double precision NULL,
  vp_subamostra boolean NULL,
  sa_id integer NULL,
  vp_numanzoisplinha integer NULL,
  vp_numlinhas integer NULL,
  isc_id integer NULL,
  vp_obs character varying(255) NULL,
  mnt_id integer NOT NULL,
  mre_id integer NULL,
  vp_mreviva boolean NULL,
  vp_motor boolean NULL,
  dp_id integer null,
  CONSTRAINT t_varapesca_pkey PRIMARY KEY (vp_id),
  CONSTRAINT fk_t_varapesca_t_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_t_isca1 FOREIGN KEY (isc_id)
      REFERENCES t_isca (isc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_t_monitoramento1 FOREIGN KEY (mnt_id)
      REFERENCES t_monitoramento (mnt_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_t_pescador1 FOREIGN KEY (tp_id_entrevistado)
      REFERENCES t_pescador (tp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_t_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_t_tipoembarcacao1 FOREIGN KEY (tte_id)
      REFERENCES t_tipoembarcacao (tte_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT t_varapesca_t_mare1 FOREIGN KEY (mre_id)
      REFERENCES t_mare (mre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT t_varapesca_dp_id_fkey FOREIGN KEY (dp_id)
      REFERENCES t_destinopescado (dp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE t_arrastofundo_has_t_especie_capturada
(
  spc_af_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  af_id integer NOT NULL,
  CONSTRAINT t_arrastofundo_has_t_especie_capturada_pkey PRIMARY KEY (spc_af_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_arrastofundo1 FOREIGN KEY (af_id)
      REFERENCES t_arrastofundo (af_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_calao_has_t_especie_capturada
(
  spc_cal_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  cal_id integer NOT NULL,
  CONSTRAINT t_calao_has_t_especie_capturada_pkey PRIMARY KEY (spc_cal_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (cal_id)
      REFERENCES t_calao (cal_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_coletamanual_has_t_especie_capturada
(
  spc_cml_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  cml_id integer NOT NULL,
  CONSTRAINT t_coletamanual_has_t_especie_capturada_pkey PRIMARY KEY (spc_cml_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_coletamanual1 FOREIGN KEY (cml_id)
      REFERENCES t_coletamanual (cml_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_emalhe_has_t_especie_capturada
(
  spc_em_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  em_id integer NOT NULL,
  CONSTRAINT t_emalhe_has_t_especie_capturada_pkey PRIMARY KEY (spc_em_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_emalhe1 FOREIGN KEY (em_id)
      REFERENCES t_emalhe (em_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_grosseira_has_t_especie_capturada
(
  spc_grs_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  grs_id integer NOT NULL,
  CONSTRAINT t_grosseira_has_t_especie_capturada_pkey PRIMARY KEY (spc_grs_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_grosseira1 FOREIGN KEY (grs_id)
      REFERENCES t_grosseira (grs_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_jerere_has_t_especie_capturada
(
  spc_jre_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  jre_id integer NOT NULL,
  CONSTRAINT t_jerere_has_t_especie_capturada_pkey PRIMARY KEY (spc_jre_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_jerere1 FOREIGN KEY (jre_id)
      REFERENCES t_jerere (jre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_linha_has_t_especie_capturada
(
  spc_lin_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  lin_id integer NOT NULL,
  CONSTRAINT t_linha_has_t_especie_capturada_pkey PRIMARY KEY (spc_lin_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (lin_id)
      REFERENCES t_linha (lin_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_linhafundo_has_t_especie_capturada
(
  spc_lf_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  lf_id integer NOT NULL,
  CONSTRAINT t_linhafundo_has_t_especie_capturada_pkey PRIMARY KEY (spc_lf_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_linhafundo1 FOREIGN KEY (lf_id)
      REFERENCES t_linhafundo (lf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_manzua_has_t_especie_capturada
(
  spc_man_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  man_id integer NOT NULL,
  CONSTRAINT t_manzua_has_t_especie_capturada_pkey PRIMARY KEY (spc_man_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_manzua1 FOREIGN KEY (man_id)
      REFERENCES t_manzua (man_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_mergulho_has_t_especie_capturada
(
  spc_mer_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  mer_id integer NOT NULL,
  CONSTRAINT t_mergulho_has_t_especie_capturada_pkey PRIMARY KEY (spc_mer_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_mergulho1 FOREIGN KEY (mer_id)
      REFERENCES t_mergulho (mer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_ratoeira_has_t_especie_capturada
(
  spc_rat_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  rat_id integer NOT NULL,
  CONSTRAINT t_ratoeira_has_t_especie_capturada_pkey PRIMARY KEY (spc_rat_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_ratoeira1 FOREIGN KEY (rat_id)
      REFERENCES t_ratoeira (rat_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_siripoia_has_t_especie_capturada
(
  spc_sir_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  sir_id integer NOT NULL,
  CONSTRAINT t_siripoia_has_t_especie_capturada_pkey PRIMARY KEY (spc_sir_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_siripoia1 FOREIGN KEY (sir_id)
      REFERENCES t_siripoia (sir_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_tarrafa_has_t_especie_capturada
(
  spc_tar_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  tar_id integer NOT NULL,
  CONSTRAINT t_tarrafa_has_t_especie_capturada_pkey PRIMARY KEY (spc_tar_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (tar_id)
      REFERENCES t_tarrafa (tar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_varapesca_has_t_especie_capturada
(
  spc_vp_id serial NOT NULL,

  spc_quantidade integer NULL,
  spc_peso_kg float NULL,
  spc_preco float NULL,
  esp_id integer NOT NULL,
  vp_id integer NOT NULL,
  CONSTRAINT t_varapesca_has_t_especie_capturada_pkey PRIMARY KEY (spc_vp_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_varapesca1 FOREIGN KEY (vp_id)
      REFERENCES t_varapesca (vp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- ENTREVISTAS HAS ESPECIES CAPTURADAS



CREATE TABLE t_arrastofundo_has_t_pesqueiro
(
  af_paf_id serial,
  af_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempopesqueiro time without time zone NULL,
  CONSTRAINT t_arrastofundo_has_t_pesqueiro_pkey PRIMARY KEY (af_paf_id),
  CONSTRAINT fk_t_arrastofundo_has_t_pesqueiro_t_arrastofundo1 FOREIGN KEY (af_id)
      REFERENCES t_arrastofundo (af_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_calao_has_t_pesqueiro
(
  cal_paf_id serial,
  cal_id integer NOT NULL,
  paf_id integer NOT NULL,
  PRIMARY KEY (cal_paf_id),
  CONSTRAINT fk_t_calao_has_t_pesqueiro_t_calao1 FOREIGN KEY (cal_id)
      REFERENCES t_calao (cal_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_calao_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_coletamanual_has_t_pesqueiro
(
  cml_paf_id serial,
  cml_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (cml_paf_id),
  CONSTRAINT fk_t_coletamanual_has_t_pesqueiro_t_coletamanual1 FOREIGN KEY (cml_id)
      REFERENCES t_coletamanual (cml_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_emalhe_has_t_pesqueiro
(
  em_paf_id serial,
  em_id integer NOT NULL,
  paf_id integer NOT NULL,
  PRIMARY KEY (em_paf_id),
  CONSTRAINT fk_t_emalhe_has_t_pesqueiro_t_emalhe1 FOREIGN KEY (em_id)
      REFERENCES t_emalhe (em_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_emalhe_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_grosseira_has_t_pesqueiro
(
  grs_paf_id serial,
  grs_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  PRIMARY KEY (grs_paf_id),
  CONSTRAINT fk_t_grosseira_has_t_pesqueiro_t_grosseira1 FOREIGN KEY (grs_id)
      REFERENCES t_grosseira (grs_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_jerere_has_t_pesqueiro
(
  jre_paf_id serial,
  jre_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (jre_paf_id),
  CONSTRAINT fk_t_jerere_has_t_pesqueiro_t_jerere1 FOREIGN KEY (jre_id)
      REFERENCES t_jerere (jre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_linha_has_t_pesqueiro
(
  lin_paf_id serial,
  lin_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  PRIMARY KEY (lin_paf_id),
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_linha1 FOREIGN KEY (lin_id)
      REFERENCES t_linha (lin_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_linhafundo_has_t_pesqueiro
(
  lf_paf_id serial,
  lf_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (lf_paf_id),
  CONSTRAINT fk_t_linhafundo_has_t_pesqueiro_t_linhafundo1 FOREIGN KEY (lf_id)
      REFERENCES t_linhafundo (lf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_manzua_has_t_pesqueiro
(
  man_paf_id serial,
  man_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (man_paf_id),
  CONSTRAINT fk_t_manzua_has_t_pesqueiro_t_manzua1 FOREIGN KEY (man_id)
      REFERENCES t_manzua (man_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_mergulho_has_t_pesqueiro
(
  mer_paf_id serial,
  mer_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (mer_paf_id),
  CONSTRAINT fk_t_mergulho_has_t_pesqueiro_t_mergulho1 FOREIGN KEY (mer_id)
      REFERENCES t_mergulho (mer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_ratoeira_has_t_pesqueiro
(
  rat_paf_id serial,
  rat_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (rat_paf_id),
  CONSTRAINT fk_t_ratoeira_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_has_t_pesqueiro_t_ratoeira1 FOREIGN KEY (rat_id)
      REFERENCES t_ratoeira (rat_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_siripoia_has_t_pesqueiro
(
  sir_paf_id serial,
  sir_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (sir_paf_id),
  CONSTRAINT fk_t_siripoia_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_has_t_pesqueiro_t_siripoia1 FOREIGN KEY (sir_id)
      REFERENCES t_siripoia (sir_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_tarrafa_has_t_pesqueiro
(
  tar_paf_id serial,
  tar_id integer NOT NULL,
  paf_id integer NOT NULL,
  PRIMARY KEY (tar_paf_id),
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_tarrafa1 FOREIGN KEY (tar_id)
      REFERENCES t_tarrafa (tar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_varapesca_has_t_pesqueiro
(
  vp_paf_id serial,
  vp_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone NULL,
  t_distapesqueiro double precision NULL,
  PRIMARY KEY (vp_paf_id),
  CONSTRAINT fk_t_varapesca_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_varapesca_has_t_pesqueiro_t_varapesca1 FOREIGN KEY (vp_id)
      REFERENCES t_varapesca (vp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);




CREATE VIEW V_ARRASTO_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.AF_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOPESQUEIRO, ENTPESQ.AF_PAF_ID
FROM T_ARRASTOFUNDO AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_ARRASTOFUNDO_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.AF_ID = ENTPESQ.AF_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_EMALHE_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.EM_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.EM_PAF_ID
FROM T_EMALHE AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_EMALHE_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.EM_ID = ENTPESQ.EM_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_CALAO_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.CAL_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.CAL_PAF_ID
FROM T_CALAO AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_CALAO_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.CAL_ID = ENTPESQ.CAL_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_TARRAFA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.TAR_ID, PESQUEIRO.PAF_PESQUEIRO,ENTPESQ.TAR_PAF_ID
FROM T_TARRAFA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_TARRAFA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.TAR_ID = ENTPESQ.TAR_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_LINHA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.LIN_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.LIN_PAF_ID
FROM T_LINHA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_LINHA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.LIN_ID = ENTPESQ.LIN_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_GROSSEIRA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.GRS_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.GRS_PAF_ID
FROM T_GROSSEIRA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_GROSSEIRA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.GRS_ID = ENTPESQ.GRS_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_MERGULHO_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.MER_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.MER_PAF_ID
FROM T_MERGULHO AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_MERGULHO_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.MER_ID = ENTPESQ.MER_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


CREATE VIEW V_COLETAMANUAL_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.CML_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.CML_PAF_ID
FROM T_COLETAMANUAL AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_COLETAMANUAL_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.CML_ID = ENTPESQ.CML_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_VARAPESCA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.VP_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.VP_PAF_ID
FROM T_VARAPESCA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_VARAPESCA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.VP_ID = ENTPESQ.VP_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;

CREATE VIEW V_LINHAFUNDO_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.LF_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.LF_PAF_ID
FROM T_LINHAFUNDO AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_LINHAFUNDO_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.LF_ID = ENTPESQ.LF_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


CREATE VIEW V_JERERE_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.JRE_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.JRE_PAF_ID
FROM T_JERERE AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_JERERE_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.JRE_ID = ENTPESQ.JRE_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


CREATE VIEW V_SIRIPOIA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.SIR_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.SIR_PAF_ID
FROM T_SIRIPOIA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_SIRIPOIA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.SIR_ID = ENTPESQ.SIR_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


CREATE VIEW V_MANZUA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.MAN_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.MAN_PAF_ID
FROM T_MANZUA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_MANZUA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.MAN_ID = ENTPESQ.MAN_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


CREATE VIEW V_RATOEIRA_HAS_T_PESQUEIRO AS
SELECT ENTREVISTA.RAT_ID, PESQUEIRO.PAF_PESQUEIRO, ENTPESQ.T_TEMPOAPESQUEIRO, ENTPESQ.T_DISTAPESQUEIRO, ENTPESQ.RAT_PAF_ID
FROM T_RATOEIRA AS ENTREVISTA, T_PESQUEIRO_AF AS PESQUEIRO, T_RATOEIRA_HAS_T_PESQUEIRO AS ENTPESQ
WHERE ENTREVISTA.RAT_ID = ENTPESQ.RAT_ID AND PESQUEIRO.PAF_ID = ENTPESQ.PAF_ID;


--ESPECIES CAPTURADAS POR ENTREVISTAS (VIEWS)

CREATE VIEW V_ARRASTOFUNDO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.AF_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_AF_ID
FROM T_ARRASTOFUNDO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_ARRASTOFUNDO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.AF_ID = ESPCAPT.AF_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_CALAO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.CAL_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_CAL_ID
FROM T_CALAO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_CALAO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.CAL_ID = ESPCAPT.CAL_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_EMALHE_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.EM_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_EM_ID
FROM T_EMALHE AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_EMALHE_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.EM_ID = ESPCAPT.EM_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_TARRAFA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.TAR_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_TAR_ID
FROM T_TARRAFA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_TARRAFA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.TAR_ID = ESPCAPT.TAR_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_LINHA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.LIN_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_LIN_ID
FROM T_LINHA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_LINHA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.LIN_ID = ESPCAPT.LIN_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_GROSSEIRA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.GRS_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_GRS_ID
FROM T_GROSSEIRA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_GROSSEIRA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.GRS_ID = ESPCAPT.GRS_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;


drop table t_tipo_venda;
CREATE TABLE t_tipo_venda
(
ttv_id serial,
ttv_tipovenda character varying(30) NOT NULL,
Primary Key (ttv_id)
);

Alter Table t_coletamanual_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_jerere_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_linhafundo_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_manzua_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_mergulho_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_ratoeira_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_siripoia_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_varapesca_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;


CREATE OR REPLACE VIEW v_coletamanual_has_t_especie_capturada AS
 SELECT entrevista.cml_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_cml_id, tvenda.ttv_tipovenda
   FROM t_coletamanual as entrevista

  LEFT JOIN t_coletamanual_has_t_especie_capturada as espcapt On entrevista.cml_id = espcapt.cml_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;

CREATE OR REPLACE VIEW v_jerere_has_t_especie_capturada AS
 SELECT entrevista.jre_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_jre_id, tvenda.ttv_tipovenda
   FROM t_jerere as entrevista

  LEFT JOIN t_jerere_has_t_especie_capturada as espcapt On entrevista.jre_id = espcapt.jre_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_linhafundo_has_t_especie_capturada AS
 SELECT entrevista.lf_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_lf_id, tvenda.ttv_tipovenda
   FROM t_linhafundo as entrevista

  LEFT JOIN t_linhafundo_has_t_especie_capturada as espcapt On entrevista.lf_id = espcapt.lf_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_manzua_has_t_especie_capturada AS
 SELECT entrevista.man_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_man_id, tvenda.ttv_tipovenda
   FROM t_manzua as entrevista

  LEFT JOIN t_manzua_has_t_especie_capturada as espcapt On entrevista.man_id = espcapt.man_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_mergulho_has_t_especie_capturada AS
 SELECT entrevista.mer_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_mer_id, tvenda.ttv_tipovenda
   FROM t_mergulho as entrevista

  LEFT JOIN t_mergulho_has_t_especie_capturada as espcapt On entrevista.mer_id = espcapt.mer_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_ratoeira_has_t_especie_capturada AS
 SELECT entrevista.rat_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_rat_id, tvenda.ttv_tipovenda
   FROM t_ratoeira as entrevista

  LEFT JOIN t_ratoeira_has_t_especie_capturada as espcapt On entrevista.rat_id = espcapt.rat_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_siripoia_has_t_especie_capturada AS
 SELECT entrevista.sir_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_sir_id, tvenda.ttv_tipovenda
   FROM t_siripoia as entrevista

  LEFT JOIN t_siripoia_has_t_especie_capturada as espcapt On entrevista.sir_id = espcapt.sir_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;



CREATE OR REPLACE VIEW v_varapesca_has_t_especie_capturada AS
 SELECT entrevista.vp_id, especie.esp_nome_comum, espcapt.spc_quantidade,
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_vp_id, tvenda.ttv_tipovenda
   FROM t_varapesca as entrevista

  LEFT JOIN t_varapesca_has_t_especie_capturada as espcapt On entrevista.vp_id = espcapt.vp_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;




--Visualizações

CREATE OR REPLACE VIEW v_entrevista_arrasto AS
 SELECT t_arrastofundo.af_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_arrastofundo
   Left Join t_pescador On t_arrastofundo.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_arrastofundo.bar_id = t_barco.bar_id Left Join t_monitoramento On t_arrastofundo.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_calao AS
 SELECT t_calao.cal_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_calao
   Left Join t_pescador On t_calao.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_calao.bar_id = t_barco.bar_id Left Join t_monitoramento On t_calao.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_coletamanual AS
 SELECT t_coletamanual.cml_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_coletamanual
   Left Join t_pescador On t_coletamanual.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_coletamanual.bar_id = t_barco.bar_id Left Join t_monitoramento On t_coletamanual.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_emalhe AS
 SELECT t_emalhe.em_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_emalhe
   Left Join t_pescador On t_emalhe.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_emalhe.bar_id = t_barco.bar_id Left Join t_monitoramento On t_emalhe.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_grosseira AS
 SELECT t_grosseira.grs_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_grosseira
   Left Join t_pescador On t_grosseira.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_grosseira.bar_id = t_barco.bar_id Left Join t_monitoramento On t_grosseira.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_jerere AS
 SELECT t_jerere.jre_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_jerere
   Left Join t_pescador On t_jerere.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_jerere.bar_id = t_barco.bar_id Left Join t_monitoramento On t_jerere.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_linha AS
 SELECT t_linha.lin_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_linha
   Left Join t_pescador On t_linha.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_linha.bar_id = t_barco.bar_id Left Join t_monitoramento On t_linha.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_linhafundo AS
 SELECT t_linhafundo.lf_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_linhafundo
   Left Join t_pescador On t_linhafundo.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_linhafundo.bar_id = t_barco.bar_id Left Join t_monitoramento On t_linhafundo.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_manzua AS
 SELECT t_manzua.man_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_manzua
   Left Join t_pescador On t_manzua.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_manzua.bar_id = t_barco.bar_id Left Join t_monitoramento On t_manzua.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_mergulho AS
 SELECT t_mergulho.mer_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_mergulho
   Left Join t_pescador On t_mergulho.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_mergulho.bar_id = t_barco.bar_id Left Join t_monitoramento On t_mergulho.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_ratoeira AS
 SELECT t_ratoeira.rat_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_ratoeira
   Left Join t_pescador On t_ratoeira.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_ratoeira.bar_id = t_barco.bar_id Left Join t_monitoramento On t_ratoeira.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_siripoia AS
 SELECT t_siripoia.sir_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_siripoia
   Left Join t_pescador On t_siripoia.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_siripoia.bar_id = t_barco.bar_id Left Join t_monitoramento On t_siripoia.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_tarrafa AS
 SELECT t_tarrafa.tar_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_tarrafa
   Left Join t_pescador On t_tarrafa.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_tarrafa.bar_id = t_barco.bar_id Left Join t_monitoramento On t_tarrafa.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;



CREATE OR REPLACE VIEW v_entrevista_varapesca AS
 SELECT t_varapesca.vp_id, t_pescador.tp_nome, t_barco.bar_nome, t_monitoramento.mnt_id, t_ficha_diaria.fd_id
   FROM t_varapesca
   Left Join t_pescador On t_varapesca.tp_id_entrevistado = t_pescador.tp_id Left Join t_barco ON t_varapesca.bar_id = t_barco.bar_id Left Join t_monitoramento On t_varapesca.mnt_id = t_monitoramento.mnt_id Left Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id;









DROP TABLE T_CALAO_HAS_T_AVISTAMENTO;
-- drop table T_ARRASTOFUNDO_HAS_T_AVISTAMENTO;
-- drop view V_ARRASTOFUNDO_HAS_T_AVISTAMENTO;



CREATE TABLE T_ARRASTOFUNDO_HAS_T_AVISTAMENTO
(
	AF_ID INTEGER,
	AVS_ID INTEGER,
  CONSTRAINT T_ARRASTOFUNDO_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (AF_ID,  AVS_ID),
  CONSTRAINT FK_T_ARRASTOFUNDO_HAS_T_AVISTAMENTO_AF_ID FOREIGN KEY (AF_ID) REFERENCES T_ARRASTOFUNDO (AF_ID),
  CONSTRAINT FK_T_ARRASTOFUNDO_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);



CREATE TABLE T_CALAO_HAS_T_AVISTAMENTO
(
	CAL_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_CALAO_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (CAL_ID,  AVS_ID),
	CONSTRAINT FK_T_CALAO_HAS_T_AVISTAMENTO_CAL_ID FOREIGN KEY (CAL_ID) REFERENCES T_CALAO (CAL_ID),
	CONSTRAINT FK_T_CALAO_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

Drop table T_emalhe_HAS_T_AVISTAMENTO;

CREATE TABLE T_EMALHE_HAS_T_AVISTAMENTO
(
	EM_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_EMALHE_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (EM_ID,  AVS_ID),
	CONSTRAINT FK_T_EMALHE_HAS_T_AVISTAMENTO_CAL_ID FOREIGN KEY (EM_ID) REFERENCES T_EMALHE (EM_ID),
	CONSTRAINT FK_T_EMALHE_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

drop table T_TARRAFA_HAS_T_AVISTAMENTO;

 CREATE TABLE T_TARRAFA_HAS_T_AVISTAMENTO
(
	TAR_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_TARRAFA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (TAR_ID,  AVS_ID),
	CONSTRAINT FK_T_TARRAFA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (TAR_ID) REFERENCES T_TARRAFA (TAR_ID),
	CONSTRAINT FK_T_TARRAFA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);



 drop table T_JERERE_HAS_T_AVISTAMENTO;
  CREATE TABLE T_JERERE_HAS_T_AVISTAMENTO
(
	JRE_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_JERERE_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (JRE_ID,  AVS_ID),
	CONSTRAINT FK_T_JERERE_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (JRE_ID) REFERENCES T_JERERE (JRE_ID),
	CONSTRAINT FK_T_JERERE_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

 drop table T_LINHA_HAS_T_AVISTAMENTO;
  CREATE TABLE T_LINHA_HAS_T_AVISTAMENTO
(
	LIN_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_LINHA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (LIN_ID,  AVS_ID),
	CONSTRAINT FK_T_LINHA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (LIN_ID) REFERENCES T_LINHA (LIN_ID),
	CONSTRAINT FK_T_LINHA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

 drop table T_grosseira_HAS_T_AVISTAMENTO;
  CREATE TABLE T_grosseira_HAS_T_AVISTAMENTO
(
	grs_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_Lgrasseira_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (grs_ID,  AVS_ID),
	CONSTRAINT FK_T_grosseira_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (grs_ID) REFERENCES T_grosseira (grs_ID),
	CONSTRAINT FK_T_grosseira_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

 DROP TABLE T_VARAPESCA_HAS_T_AVISTAMENTO;
 CREATE TABLE T_VARAPESCA_HAS_T_AVISTAMENTO
(
	VP_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_VARAPESCA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (VP_ID,  AVS_ID),
	CONSTRAINT FK_T_VARAPESCA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (VP_ID) REFERENCES T_VARAPESCA (VP_ID),
	CONSTRAINT FK_T_VARAPESCA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);


 DROP TABLE T_MERGULHO_HAS_T_AVISTAMENTO;
 CREATE TABLE T_MERGULHO_HAS_T_AVISTAMENTO
(
	MER_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_MERGULHO_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (MER_ID,  AVS_ID),
	CONSTRAINT FK_T_MERGULHO_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (MER_ID) REFERENCES T_MERGULHO (MER_ID),
	CONSTRAINT FK_T_MERGULHO_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);


 DROP TABLE T_MANZUA_HAS_T_AVISTAMENTO;
 CREATE TABLE T_MANZUA_HAS_T_AVISTAMENTO
(
	MAN_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_MANZUA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (MAN_ID,  AVS_ID),
	CONSTRAINT FK_T_MANZUA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (MAN_ID) REFERENCES T_MANZUA (MAN_ID),
	CONSTRAINT FK_T_MANZUA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);




 DROP TABLE T_RATOEIRA_HAS_T_AVISTAMENTO;
 CREATE TABLE T_RATOEIRA_HAS_T_AVISTAMENTO
(
	RAT_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_RATOEIRA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (RAT_ID,  AVS_ID),
	CONSTRAINT FK_T_RATOEIRA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (RAT_ID) REFERENCES T_RATOEIRA (RAT_ID),
	CONSTRAINT FK_T_RATOEIRA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);


 DROP TABLE T_SIRIPOIA_HAS_T_AVISTAMENTO;
 CREATE TABLE T_SIRIPOIA_HAS_T_AVISTAMENTO
(
	SIR_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_SIRIPOIA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (SIR_ID,  AVS_ID),
	CONSTRAINT FK_T_SIRIPOIA_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (SIR_ID) REFERENCES T_SIRIPOIA (SIR_ID),
	CONSTRAINT FK_T_SIRIPOIA_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

 DROP TABLE T_COLETAMANUAL_HAS_T_AVISTAMENTO;
 CREATE TABLE T_COLETAMANUAL_HAS_T_AVISTAMENTO
(
	CML_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_COLETAMANUAL_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (CML_ID,  AVS_ID),
	CONSTRAINT FK_T_COLETAMANUAL_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (CML_ID) REFERENCES T_COLETAMANUAL (CML_ID),
	CONSTRAINT FK_T_COLETAMANUAL_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);


 DROP TABLE T_LINHAFUNDO_HAS_T_AVISTAMENTO;
 CREATE TABLE T_LINHAFUNDO_HAS_T_AVISTAMENTO
(
	LF_ID INTEGER,
	AVS_ID INTEGER,
	CONSTRAINT T_LINHAFUNDO_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (LF_ID,  AVS_ID),
	CONSTRAINT FK_T_LINHAFUNDO_HAS_T_AVISTAMENTO_TAR_ID FOREIGN KEY (LF_ID) REFERENCES T_LINHAFUNDO (LF_ID),
	CONSTRAINT FK_T_LINHAFUNDO_HAS_T_AVISTAMENTO_AVS_ID FOREIGN KEY (AVS_ID)REFERENCES T_AVISTAMENTO (AVS_ID)
);

-- drop view V_ARRASTOFUNDO_HAS_T_AVISTAMENTO;
CREATE OR REPLACE VIEW V_ARRASTOFUNDO_HAS_T_AVISTAMENTO AS
SELECT AVS.AF_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, AF.FD_DATA
FROM T_ARRASTOFUNDO_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_arrasto AS AF ON AVS.AF_ID = AF.AF_ID;


CREATE OR REPLACE VIEW V_CALAO_HAS_T_AVISTAMENTO AS
SELECT AVS.CAL_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_CALAO_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_calao AS ENT ON AVS.CAL_ID = ENT.CAL_ID;


CREATE OR REPLACE VIEW V_COLETAMANUAL_HAS_T_AVISTAMENTO AS
SELECT AVS.CML_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_COLETAMANUAL_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_coletamanual AS ENT ON AVS.CML_ID = ENT.CML_ID;

CREATE OR REPLACE VIEW V_EMALHE_HAS_T_AVISTAMENTO AS
SELECT AVS.EM_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_EMALHE_HAS_T_AVISTAMENTO AS  AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_emalhe AS ENT ON AVS.EM_ID = ENT.EM_ID;



CREATE OR REPLACE VIEW V_GROSSEIRA_HAS_T_AVISTAMENTO AS
SELECT AVS.GRS_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_GROSSEIRA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_grosseira AS ENT ON AVS.GRS_ID = ENT.GRS_ID;


CREATE OR REPLACE VIEW V_JERERE_HAS_T_AVISTAMENTO AS
SELECT AVS.JRE_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_JERERE_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_jerere AS ENT ON AVS.JRE_ID = ENT.JRE_ID;


CREATE OR REPLACE VIEW V_LINHA_HAS_T_AVISTAMENTO AS
SELECT AVS.LIN_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_LINHA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_linha AS ENT ON AVS.LIN_ID = ENT.LIN_ID;


CREATE OR REPLACE VIEW V_LINHAFUNDO_HAS_T_AVISTAMENTO AS
SELECT AVS.LF_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_LINHAFUNDO_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_linhafundo AS ENT ON AVS.LF_ID = ENT.LF_ID;

CREATE OR REPLACE VIEW V_MANZUA_HAS_T_AVISTAMENTO AS
SELECT AVS.MAN_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_MANZUA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_manzua AS ENT ON AVS.MAN_ID = ENT.MAN_ID;


CREATE OR REPLACE VIEW V_MERGULHO_HAS_T_AVISTAMENTO AS
SELECT AVS.MER_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_MERGULHO_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_mergulho AS ENT ON AVS.MER_ID = ENT.MER_ID;

CREATE OR REPLACE VIEW V_RATOEIRA_HAS_T_AVISTAMENTO AS
SELECT AVS.RAT_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_RATOEIRA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_ratoeira AS ENT ON AVS.RAT_ID = ENT.RAT_ID;


CREATE OR REPLACE VIEW V_SIRIPOIA_HAS_T_AVISTAMENTO AS
SELECT AVS.SIR_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_SIRIPOIA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_siripoia AS ENT ON AVS.SIR_ID = ENT.SIR_ID;


CREATE OR REPLACE VIEW V_TARRAFA_HAS_T_AVISTAMENTO AS
SELECT AVS.TAR_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.TAR_DATA
FROM T_TARRAFA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_tarrafa AS ENT ON AVS.TAR_ID = ENT.TAR_ID;


CREATE OR REPLACE VIEW V_VARAPESCA_HAS_T_AVISTAMENTO AS
SELECT AVS.VP_ID, AVS.AVS_ID, TAVS.AVS_DESCRICAO, ENT.FD_DATA
FROM T_VARAPESCA_HAS_T_AVISTAMENTO AS AVS
Left Join T_AVISTAMENTO AS TAVS ON AVS.AVS_ID = TAVS.AVS_ID
Left Join v_entrevista_varapesca AS ENT ON AVS.VP_ID = ENT.VP_ID;



CREATE OR REPLACE VIEW V_PORTO AS
SELECT PTO.PTO_ID,  PTO.PTO_NOME,  PTO.PTO_LOCAL,  PTO.TMUN_ID, TMUN.TMUN_MUNICIPIO,  TMUN.TUF_SIGLA FROM T_PORTO PTO
LEFT JOIN T_MUNICIPIO AS TMUN
ON  PTO.TMUN_ID = TMUN.TMUN_ID;



-- ERRO AQUI
-- ALTER TABLE t_calao
-- ADD cal_tamanho1 double precision, ADD cal_tamanho2 double precision

------------------------------------AMOSTRAGEM---------------------------------------------------------------------------
--Camarão-----------------------------------------------------------------------------------------------------------------
drop table t_amostra_camarao cascade;
CREATE TABLE t_amostra_camarao
(
  tamc_id serial,
  tu_id_monitor integer not null,
  tu_id integer not null,
  pto_id integer not null,
  tamc_data date null,
  bar_id integer not null,
  paf_id integer not null,
  esp_id integer not null,
  tamc_captura_total float null,
  sa_id integer not null,
  PRIMARY KEY (tamc_id),
  CONSTRAINT fk_t_amostra_camarao_usuario1 FOREIGN KEY (tu_id_monitor)
      REFERENCES t_usuario (tu_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_t_amostra_camarao_usuario2 FOREIGN KEY (tu_id)
      REFERENCES t_usuario (tu_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_camarao_porto1 FOREIGN KEY (pto_id)
      REFERENCES t_porto (pto_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_camarao_barco1 FOREIGN KEY (bar_id)
      REFERENCES t_barco (bar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_camarao_pesqueiro1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_camarao_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_camarao_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


drop table t_amostra_peixe cascade;
CREATE TABLE t_amostra_peixe
(
  tamp_id serial,
  tu_id_monitor integer not null,
  tu_id integer not null,
  pto_id integer not null,
  sa_id integer not null,
  PRIMARY KEY (tamp_id),
  CONSTRAINT fk_t_amostra_peixe_usuario1 FOREIGN KEY (tu_id_monitor)
      REFERENCES t_usuario (tu_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_peixe_usuario2 FOREIGN KEY (tu_id)
      REFERENCES t_usuario (tu_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_peixe_porto1 FOREIGN KEY (pto_id)
      REFERENCES t_porto (pto_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_amostra_peixe_subamostra1 FOREIGN KEY (sa_id)
      REFERENCES t_subamostra (sa_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE OR REPLACE VIEW v_subamostra AS
 SELECT t_subamostra.sa_id, t_pescador.tp_nome, t_subamostra.sa_datachegada, t_subamostra.sa_pescador
   FROM t_subamostra, t_pescador
  WHERE to_number(t_subamostra.sa_pescador, '9999999') = t_pescador.tp_id;


-- Alter table t_amostra_camarao
-- Add tu_id_monitor integer not null, Add Foreign Key (tu_id_monitor)
--       REFERENCES t_usuario (tu_id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION;


CREATE TABLE t_maturidade
(
  tmat_id serial NOT NULL,
  tmat_tipo character varying(25),
  CONSTRAINT t_maturidade_pkey PRIMARY KEY (tmat_id)
);

-- Insert into t_maturidade (tmat_tipo) values ('Aberto');
-- Insert into t_maturidade (tmat_tipo) values ('Fechado');
-- Insert into t_maturidade (tmat_tipo) values ('Em Desenvolvimento');
-- Insert into t_maturidade (tmat_tipo) values ('Desenvolvida');
-- Insert into t_maturidade (tmat_tipo) values ('Rudimentar');
-- Insert into t_maturidade (tmat_tipo) values ('Não informado');

CREATE TABLE t_unidade_peixe
(
  tup_id serial,
  tamp_id integer not null,
  esp_id integer not null,
  tup_comprimento float,
  tup_peso float,
  tup_sexo character varying(1),
  Primary key (tup_id),
  CONSTRAINT fk_t_unidade_peixe_amostra1 FOREIGN KEY (tamp_id)
      REFERENCES t_amostra_peixe (tamp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_unidade_peixe_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

Alter table t_unidade_peixe
Add Foreign Key (tamp_id)
References t_amostra_peixe (tamp_id) match Simple ON UPDATE NO ACTION ON DELETE NO ACTION;

CREATE OR REPLACE VIEW V_AMOSTRA_CAMARAO AS
SELECT T_AMOSTRA_CAMARAO.TAMC_ID, TUE.TU_NOME, T_PORTO.PTO_NOME,
T_AMOSTRA_CAMARAO.TAMC_DATA, T_BARCO.BAR_NOME, T_PESQUEIRO_AF.PAF_PESQUEIRO,
T_ESPECIE.ESP_NOME_COMUM, T_AMOSTRA_CAMARAO.TAMC_CAPTURA_TOTAL,
T_SUBAMOSTRA.SA_ID, TUM.TU_NOME AS TMONITOR
FROM T_AMOSTRA_CAMARAO
INNER JOIN T_USUARIO TUE ON T_AMOSTRA_CAMARAO.TU_ID = TUE.TU_ID
INNER JOIN T_PESQUEIRO_AF ON T_AMOSTRA_CAMARAO.PAF_ID = T_PESQUEIRO_AF.PAF_ID
INNER JOIN T_PORTO ON T_AMOSTRA_CAMARAO.PTO_ID = T_PORTO.PTO_ID
INNER JOIN T_BARCO ON T_AMOSTRA_CAMARAO.BAR_ID = T_BARCO.BAR_ID
INNER JOIN T_ESPECIE ON T_AMOSTRA_CAMARAO.ESP_ID = T_ESPECIE.ESP_ID
INNER JOIN T_SUBAMOSTRA ON T_AMOSTRA_CAMARAO.SA_ID = T_SUBAMOSTRA.SA_ID
INNER JOIN T_USUARIO TUM ON T_AMOSTRA_CAMARAO.TU_ID_MONITOR = TUM.TU_ID;




CREATE TABLE T_UNIDADE_CAMARAO (
  TUC_ID SERIAL NOT NULL,
  TAMC_ID INTEGER NOT NULL,
  TUC_SEXO CHARACTER VARYING(1),
  TMAT_ID INTEGER NOT NULL,
  TUC_COMPRIMENTO_CABECA DOUBLE PRECISION,
  TUC_PESO DOUBLE PRECISION,
  CONSTRAINT T_UNIDADE_CAMARAO_PKEY PRIMARY KEY (TUC_ID)
);


CREATE OR REPLACE VIEW V_UNIDADE_CAMARAO AS
SELECT T_UNIDADE_CAMARAO.TUC_ID, T_UNIDADE_CAMARAO.TAMC_ID,
T_UNIDADE_CAMARAO.TUC_SEXO, T_MATURIDADE.TMAT_TIPO,
T_UNIDADE_CAMARAO.TUC_COMPRIMENTO_CABECA, T_UNIDADE_CAMARAO.TUC_PESO
FROM T_UNIDADE_CAMARAO, T_MATURIDADE
WHERE T_UNIDADE_CAMARAO.TMAT_ID = T_MATURIDADE.TMAT_ID;

CREATE OR REPLACE VIEW V_AMOSTRA_PEIXE AS
SELECT T_AMOSTRA_PEIXE.TAMP_ID, TUE.TU_NOME, T_PORTO.PTO_NOME,
T_SUBAMOSTRA.SA_ID, TUM.TU_NOME AS TMONITOR
FROM T_AMOSTRA_PEIXE
JOIN T_USUARIO TUE ON T_AMOSTRA_PEIXE.TU_ID = TUE.TU_ID
JOIN T_PORTO ON T_AMOSTRA_PEIXE.PTO_ID = T_PORTO.PTO_ID
JOIN T_SUBAMOSTRA ON T_AMOSTRA_PEIXE.SA_ID = T_SUBAMOSTRA.SA_ID
JOIN T_USUARIO TUM ON T_AMOSTRA_PEIXE.TU_ID_MONITOR = TUM.TU_ID;

-- DROP VIEW V_UNIDADE_PEIXE;
CREATE OR REPLACE VIEW V_UNIDADE_PEIXE AS
SELECT T_UNIDADE_PEIXE.TUP_ID, T_AMOSTRA_PEIXE.TAMP_ID, T_ESPECIE.ESP_NOME_COMUM, T_UNIDADE_PEIXE.TUP_COMPRIMENTO, T_UNIDADE_PEIXE.TUP_PESO, T_UNIDADE_PEIXE.TUP_SEXO
FROM T_UNIDADE_PEIXE, T_AMOSTRA_PEIXE, T_ESPECIE
WHERE T_UNIDADE_PEIXE.TAMP_ID = T_AMOSTRA_PEIXE.TAMP_ID AND T_UNIDADE_PEIXE.ESP_ID = T_ESPECIE.ESP_ID;



ALTER TABLE t_calao
--DROP COLUMN cal_tamanho1, DROP COLUMN cal_tamanho2,
Add cal_malha1 double precision, add cal_malha2 double precision;



Alter table t_coletamanual
Add cml_combustivel double precision;

Alter table t_jerere
Add jre_combustivel double precision;


Alter table t_manzua
Add man_combustivel double precision;

Alter table t_mergulho
Add mer_combustivel double precision;

Alter table t_ratoeira
Add rat_combustivel double precision;

Alter table t_siripoia
Add sir_combustivel double precision;

--Já está no servidor
Alter table t_pescador_has_t_embarcacao
Drop Constraint t_pescador_has_t_embarcacao_pkey,
Add tpte_id serial,
ADD PRIMARY KEY (tpte_id);

--Já está no servidor
CREATE OR REPLACE VIEW v_pescadorhasembarcacao AS
 SELECT phe.tp_id, phe.tte_id, tte.tte_tipoembarcacao, phe.tpte_motor,
    phe.tpe_id, tpe.tpe_porte, phe.tpte_dono, phe.tpte_id
   FROM t_pescador_has_t_embarcacao phe, t_tipoembarcacao tte,
    t_porteembarcacao tpe
  WHERE phe.tte_id = tte.tte_id AND phe.tpe_id = tpe.tpe_id;

--Já está no servidor
Create or Replace View v_entrevistas As
SELECT 'Arrasto-Fundo',t_arrastofundo.af_id as id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_arrastofundo
   LEFT JOIN t_pescador ON t_arrastofundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_arrastofundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_arrastofundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Calão',t_calao.cal_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_calao
   LEFT JOIN t_pescador ON t_calao.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_calao.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_calao.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Coleta Manual',t_coletamanual.cml_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_coletamanual
   LEFT JOIN t_pescador ON t_coletamanual.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_coletamanual.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_coletamanual.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Emalhe', t_emalhe.em_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_emalhe
   LEFT JOIN t_pescador ON t_emalhe.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_emalhe.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_emalhe.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Groseira',t_grosseira.grs_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_grosseira
   LEFT JOIN t_pescador ON t_grosseira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_grosseira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_grosseira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Jereré',t_jerere.jre_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_jerere
   LEFT JOIN t_pescador ON t_jerere.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_jerere.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_jerere.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Linha',t_linha.lin_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linha
   LEFT JOIN t_pescador ON t_linha.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linha.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linha.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Linha de Fundo',t_linhafundo.lf_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linhafundo
   LEFT JOIN t_pescador ON t_linhafundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linhafundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linhafundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Manzuá',t_manzua.man_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_manzua
   LEFT JOIN t_pescador ON t_manzua.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_manzua.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_manzua.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Mergulho',t_mergulho.mer_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_mergulho
   LEFT JOIN t_pescador ON t_mergulho.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_mergulho.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_mergulho.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
 SELECT 'Ratoeira',t_ratoeira.rat_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_ratoeira
   LEFT JOIN t_pescador ON t_ratoeira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_ratoeira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_ratoeira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Siripóia',t_siripoia.sir_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_siripoia
   LEFT JOIN t_pescador ON t_siripoia.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_siripoia.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_siripoia.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Tarrafa',t_tarrafa.tar_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_tarrafa
   LEFT JOIN t_pescador ON t_tarrafa.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_tarrafa.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_tarrafa.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
 SELECT 'Vara de Pesca',t_varapesca.vp_id, t_pescador.tp_nome, t_barco.bar_nome,
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_varapesca
   LEFT JOIN t_pescador ON t_varapesca.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_varapesca.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_varapesca.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE TABLE T_PROJETO (
	TPR_ID SERIAL,
	TPR_DESCRICAO CHARACTER(40) NOT NULL,
	PRIMARY KEY (TPR_ID)
);

ALTER TABLE T_PESCADOR
	ADD TPR_ID INTEGER,
	ADD FOREIGN KEY (TPR_ID) REFERENCES T_PROJETO (TPR_ID) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE T_PESCADOR
ADD TP_PESCADORDELETADO BOOLEAN;


CREATE TABLE T_ENTREVISTA_HAS_T_AVISTAMENTO
(
  TE_ID INTEGER NOT NULL,
  FD_ID INTEGER NOT NULL,
  TA_ID INTEGER NOT NULL,
  CONSTRAINT T_T_ENTREVISTA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (TE_ID, FD_ID, TA_ID)
);

CREATE TABLE T_TURNO (
  TURNO_ID CHARACTER VARYING NOT NULL,
  TURNO_NOME CHARACTER VARYING(30) NOT NULL,
  CONSTRAINT T_TURNO_PKEY PRIMARY KEY (TURNO_ID)
);



--- POR ULTIMO

CREATE INDEX IDX_T_PESCADOR_TP_NOME ON T_PESCADOR (TP_NOME);
CREATE INDEX IDX_T_ARTEPESCA_TAP_ARTEPESCA ON T_ARTEPESCA (TAP_ARTEPESCA);
CREATE INDEX IDX_T_AREAPESCA_TAREAP_AREAPESCA ON T_AREAPESCA (TAREAP_AREAPESCA);
CREATE INDEX IDX_T_TIPOEMBARCACAO_TTE_TIPOEMBARCACAO ON T_TIPOEMBARCACAO (TTE_TIPOEMBARCACAO);
CREATE INDEX IDX_T_PORTEEMBARCACAO_TPE_PORTE ON T_PORTEEMBARCACAO (TPE_PORTE);
CREATE INDEX IDX_T_TIPOCAPTURADA_ITC_TIPO ON T_TIPOCAPTURADA (ITC_TIPO);
CREATE INDEX IDX_T_COMUNIDADE_TCOM_NOME ON T_COMUNIDADE (TCOM_NOME);
CREATE INDEX IDX_T_COLONIA_TC_NOME ON T_COLONIA (TC_NOME);
CREATE INDEX IDX_T_MUNICIPIO_TMUN_MUNICIPIO ON T_MUNICIPIO (TMUN_MUNICIPIO);
CREATE INDEX IDX_T_MUNICIPIO_TUF_SIGLA ON T_MUNICIPIO (TUF_SIGLA, TMUN_MUNICIPIO);
CREATE INDEX IDX_T_RENDA_REN_RENDA ON T_RENDA (REN_RENDA);
CREATE INDEX IDX_T_TIPORENDA_TTR_DESCRICAO ON T_TIPORENDA (TTR_DESCRICAO);
CREATE INDEX IDX_T_PROGRAMASOCIAL_PRS_PROGRAMA ON T_PROGRAMASOCIAL (PRS_PROGRAMA);
CREATE INDEX IDX_T_ESCOLARIDADE_ESC_NIVEL ON T_ESCOLARIDADE (ESC_NIVEL);
CREATE INDEX IDX_T_TIPODEPENDENTE_TTD_TIPODEPENDENTE ON T_TIPODEPENDENTE (TTD_TIPODEPENDENTE);
CREATE INDEX IDX_T_TIPOTEL_TTEL_DESC ON T_TIPOTEL (TTEL_DESC);
CREATE INDEX IDX_T_GRUPO_GRP_NOME ON T_GRUPO (GRP_NOME);
CREATE INDEX IDX_T_ORDEM_ORD_NOME ON T_ORDEM (ORD_NOME);
CREATE INDEX IDX_T_ORDEM_GRP_ID ON T_ORDEM (GRP_ID, ORD_NOME);
CREATE INDEX IDX_T_FAMILIA_FAM_NOME ON T_FAMILIA (FAM_NOME);
CREATE INDEX IDX_T_FAMILIA_ORD_ID ON T_FAMILIA (ORD_ID,  FAM_NOME);
CREATE INDEX IDX_T_GENERO_GEN_NOME ON T_GENERO (GEN_NOME);
CREATE INDEX IDX_T_GENERO_FAM_ID ON T_GENERO (FAM_ID, GEN_NOME);
CREATE INDEX IDX_T_ESPECIE_ESP_NOME ON T_ESPECIE (ESP_NOME);
CREATE INDEX IDX_T_ESPECIE_GEN_ID ON T_ESPECIE (GEN_ID, ESP_NOME);
CREATE INDEX IDX_T_PORTO_PTO_NOME ON T_PORTO (PTO_NOME);
CREATE INDEX IDX_T_PESQUEIRO_AF_PAF_PESQUEIRO ON T_PESQUEIRO_AF (PAF_PESQUEIRO);
CREATE INDEX IDX_T_VENTO_VNT_FORCA ON T_VENTO (VNT_FORCA);
CREATE INDEX IDX_T_TEMPO_TMP_ESTADO ON T_TEMPO (TMP_ESTADO);
CREATE INDEX IDX_T_BARCO_BAR_NOME ON T_BARCO (BAR_NOME);
CREATE INDEX IDX_T_MARE_MRE_TIPO ON T_MARE (MRE_TIPO);
CREATE INDEX IDX_T_DESTINOPESCADO_DP_DESTINO ON T_DESTINOPESCADO (DP_DESTINO);



DROP TABLE t_historico_login;

CREATE TABLE t_historico_login
(
  thl_id serial,
  thl_dhlogin timestamp without time zone,
  thl_dhlogoff timestamp without time zone,
  tu_id int,
  PRIMARY KEY (thl_id),
  Foreign Key (tu_id) References t_usuario (tu_id)  
);
ALTER TABLE t_jerere DROP CONSTRAINT t_jerere_ttv_id_fkey;
Alter table t_jerere Drop column ttv_id;