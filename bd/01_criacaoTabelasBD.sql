--SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
--SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
--SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- Alterado: T_Especie_Capturada SPC_Peso(kg) -> SPC_Peso_kg

drop table  t_alteracaosenha cascade;
drop table  t_areapesca cascade;
drop table  t_areapesca_has_t_pescador  cascade;
drop table  t_artepesca cascade;
drop table  t_colonia  cascade;
drop table  t_comunidade cascade;
drop table  t_dados_calao  cascade;
drop table  t_dados_emalhe  cascade;
drop table  t_dados_tarrafa cascade;
drop table  t_endereco  cascade;
drop table  t_entrevista_pescador  cascade;
drop table  t_escolaridade  cascade;
drop table  t_especie  cascade;
drop table  t_familia  cascade;
drop table  t_ficha_diaria  cascade;
drop table  t_genero cascade;
drop table  t_grupo cascade;
drop table  t_historicorecadastramento  cascade;
drop table  t_isca  cascade;
drop table  t_login cascade;
drop table  t_mare  cascade;
drop table  t_monitoramento cascade;
drop table  t_municipio cascade;
drop table  t_ordem cascade;
drop table  t_perfil cascade;
drop table  t_pescador  cascade;
drop table  t_pescador_has_t_colonia cascade;
drop table  t_pescador_has_t_comunidade cascade;
drop table  t_pescador_has_t_embarcacao cascade;
drop table  t_pescador_has_t_endereco  cascade;
drop table  t_pescador_has_t_escolaridade  cascade;
drop table  t_pescador_has_t_especiecapturadas  cascade;
drop table  t_pescador_has_t_programasocial cascade;
drop table  t_pescador_has_t_renda  cascade;
drop table  t_pescador_has_t_telefonecontato cascade;
drop table  t_pescador_has_t_tipoartepesca  cascade;
drop table  t_pescador_has_tt_dependente cascade;
drop table  t_porteembarcacao  cascade;
drop table  t_porto cascade;
drop table  t_programasocial cascade;
drop table  t_renda cascade;
drop table  t_situacao  cascade;
drop table  t_subamostra cascade;
drop table  t_telefonecontato  cascade;
drop table  t_tempo cascade;
drop table  t_tipocapturada cascade;
drop table  t_tipodependente cascade;
drop table  t_tipoembarcacao cascade;
drop table  t_tipotel  cascade;
drop table  t_uf cascade;
drop table  t_usuario  cascade;
drop table  t_usuario_has_t_telefonecontato cascade;
drop table  t_vento cascade;


-- -----------------------------------------------------
-- Table T_UF
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_UF (
  TUF_Sigla VARCHAR(2) NOT NULL,
  TUF_Nome VARCHAR(25) NOT NULL,
  PRIMARY KEY (TUF_Sigla)
  );


-- -----------------------------------------------------
-- Table T_Municipio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Municipio (
  TMun_ID serial,
  TMun_Municipio VARCHAR(50) NOT NULL,
  TUF_Sigla VARCHAR(2) NOT NULL,
  PRIMARY KEY (TMun_ID),
  CONSTRAINT fk_T_Municipio_T_UF
    FOREIGN KEY (TUF_Sigla)
    REFERENCES T_UF (TUF_Sigla)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Endereco (
  TE_ID serial,
  TE_Logradouro VARCHAR(100) NULL,
  TE_Numero VARCHAR(45) NULL,
  TE_Bairro VARCHAR(50) NULL,
  TE_CEP DECIMAL(8) NULL,
  TE_Comp VARCHAR(50) NULL,
  TMun_ID INT NOT NULL,
  PRIMARY KEY (TE_ID),
  CONSTRAINT fk_T_Endereco_T_Municipio1
    FOREIGN KEY (TMun_ID)
    REFERENCES T_Municipio (TMun_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador (
  TP_ID serial,
  TP_Nome VARCHAR(45) NOT NULL,
  TP_Sexo VARCHAR(1) NOT NULL,
  TP_Matricula VARCHAR(45) NULL,
  TP_Apelido VARCHAR(45) NULL,
  TP_FiliacaoPai VARCHAR(45) NULL,
  TP_FiliacaoMae VARCHAR(45) NULL,
  TP_CTPS VARCHAR(45) NULL,
  TP_PIS VARCHAR(45) NULL,
  TP_INSS VARCHAR(45) NULL,
  TP_NIT_CEI VARCHAR(45) NULL,
  TP_RG VARCHAR(45) NULL,
  TP_CMA VARCHAR(45) NULL,
  TP_RGB_MAA_IBAMA VARCHAR(45) NULL,
  TP_CIR_Cap_Porto VARCHAR(45) NULL,
  TP_CPF VARCHAR(11) NULL,
  TP_DataNasc DATE NULL,
  TMun_ID_Natural INT NULL,
  TE_ID INT NULL,
  TP_Especificidade varchar(200) NULL,
  ESC_ID INT NULL,
  PRIMARY KEY (TP_ID),
  CONSTRAINT fk_T_Pescador_T_Municipio1
    FOREIGN KEY (TMun_ID_Natural)
    REFERENCES T_Municipio (TMun_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_T_Endereco1
    FOREIGN KEY (TE_ID)
    REFERENCES T_Endereco (TE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Escolaridade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Escolaridade (
  ESC_ID serial,
  ESC_Nivel VARCHAR(25) NULL,
  PRIMARY KEY (ESC_ID));

-- -----------------------------------------------------
-- Table T_Pescador_has_T_Escolaridade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_Escolaridade (
  ESC_ID INT NOT NULL,
  TP_ID INT NOT NULL,
  PRIMARY KEY (ESC_ID),
  CONSTRAINT fk_T_Pescador_has_T_Escolaridade_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Escolaridade_T_Escolaridade1
    FOREIGN KEY (ESC_ID)
    REFERENCES T_Escolaridade (ESC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Renda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Renda (
  REN_ID serial,
  REN_Renda VARCHAR(25) NULL,
  PRIMARY KEY (REN_ID));

-- -----------------------------------------------------
-- Table T_ProgramaSocial
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ProgramaSocial (
  PRS_ID serial NOT NULL,
  PRS_Programa VARCHAR(30) NULL,
  PRIMARY KEY (PRS_ID));

-- -----------------------------------------------------
-- Table T_Pescador_has_T_ProgramaSocial
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_ProgramaSocial (
  TP_ID INT NOT NULL,
  PRS_ID INT NOT NULL,
  PRIMARY KEY (TP_ID, PRS_ID),
  CONSTRAINT fk_T_Pescador_has_T_ProgramaSocial_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_ProgramaSocial_T_ProgramaSocial1
    FOREIGN KEY (PRS_ID)
    REFERENCES T_ProgramaSocial (PRS_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Pescador_has_T_Endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_Endereco (
  TP_ID INT NOT NULL,
  TE_ID INT NOT NULL,
  PRIMARY KEY (TE_ID),
  CONSTRAINT fk_T_Pescador_has_T_Endereco_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Endereco_T_Endereco1
    FOREIGN KEY (TE_ID)
    REFERENCES T_Endereco (TE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Comunidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Comunidade (
  TCOM_ID serial,
  TCOM_Nome VARCHAR(50) NOT NULL,
  PRIMARY KEY (TCOM_ID),
  UNIQUE (TCOM_Nome));



-- -----------------------------------------------------
-- Table T_Colonia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_COLONIA (
  TC_ID SERIAL,
  TC_NOME VARCHAR(50) NOT NULL,
  TC_Especificidade character varying(50),
  TCOM_ID integer NULL,
  TE_ID integer NULL,
  PRIMARY KEY (TC_ID),
  UNIQUE (TC_NOME));




-- -----------------------------------------------------
-- Table T_ArtePesca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ArtePesca (
  TAP_ID serial,
  TAP_ArtePesca VARCHAR(50) NOT NULL,
  PRIMARY KEY (TAP_ID),
  UNIQUE (TAP_ArtePesca));



-- -----------------------------------------------------
-- Table T_TipoEmbarcacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoEmbarcacao (
  TTE_ID serial,
  TTE_TipoEmbarcacao VARCHAR(50) NOT NULL,
  PRIMARY KEY (TTE_ID),
  UNIQUE (TTE_TipoEmbarcacao));



-- -----------------------------------------------------
-- Table T_TipoDependente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoDependente (
  TTD_ID serial,
  TTD_TipoDependente VARCHAR(30) NOT NULL,
  PRIMARY KEY (TTD_ID));



-- -----------------------------------------------------
-- Table T_AreaPesca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_AreaPesca (
  TAreaP_ID serial,
  TAreaP_AreaPesca VARCHAR(50) NOT NULL,
  PRIMARY KEY (TAreaP_ID),
  UNIQUE (TAreaP_AreaPesca));



-- -----------------------------------------------------
-- Table T_Situacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Situacao (
  TS_ID serial,
  TS_Situacao boolean DEFAULT TRUE NULL,
  TS_Motivo VARCHAR(45) NULL,
  PRIMARY KEY (TS_ID));



-- -----------------------------------------------------
-- Table T_TipoTel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoTel (
  TTEL_ID serial,
  TTEL_Desc VARCHAR(50) NOT NULL,
  PRIMARY KEY (TTEL_ID));



-- -----------------------------------------------------
-- Table T_TelefoneContato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TelefoneContato (
  TTCont_ID serial,
  TTCont_DDD DECIMAL(2) NOT NULL,
  TTCont_Telefone DECIMAL(10) NOT NULL,
  TTEL_ID INT NOT NULL,
  PRIMARY KEY (TTCont_ID),
  CONSTRAINT fk_T_TelefoneContato_T_TipoTel1
    FOREIGN KEY (TTEL_ID)
    REFERENCES T_TipoTel (TTEL_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Login
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Login (
  TL_ID serial,
  TL_Login VARCHAR(12) NOT NULL,
  TL_HashSenha CHAR(40) NOT NULL,
  TL_UltimoAcesso TIMESTAMP NULL,
  PRIMARY KEY (TL_ID),
  UNIQUE (TL_Login));



-- -----------------------------------------------------
-- Table T_Perfil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Perfil (
  TP_ID serial,
  TP_Perfil VARCHAR(14) NOT NULL,
  PRIMARY KEY (TP_ID));



-- -----------------------------------------------------
-- Table T_Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Usuario (
  TU_ID serial,
  TU_Nome VARCHAR(45) NOT NULL,
  TU_Sexo VARCHAR(1) NOT NULL,
  TU_CPF VARCHAR(14) NOT NULL,
  TU_RG VARCHAR(11) NOT NULL,
  TU_Email VARCHAR(30) NOT NULL,
    TU_TELRES NUMERIC (14,0),
  TU_TELCEL NUMERIC (14,0),
  TU_UsuarioDeletado boolean DEFAULT false NOT NULL,
  TL_ID INT NOT NULL,
  TP_ID INT NOT NULL,
  TE_ID INT NOT NULL,
  PRIMARY KEY (TU_ID),
  CONSTRAINT fk_T_Usuario_T_Login1
    FOREIGN KEY (TL_ID)
    REFERENCES T_Login (TL_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Usuario_T_Perfil1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Perfil (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Usuario_T_Endereco1
    FOREIGN KEY (TE_ID)
    REFERENCES T_Endereco (TE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_HistoricoRecadastramento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_HistoricoRecadastramento (
  THR_Data date NOT NULL,
  TP_ID INT NULL,
  TS_ID INT NULL,
  THR_Descricao VARCHAR(45) NULL,
  TU_ID_Resp_Coleta INT NULL,
  TU_ID_Resp_Digita INT NULL,
  PRIMARY KEY (THR_Data, TP_ID, TS_ID),
  CONSTRAINT fk_T_DataRecadastramento_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_HistooRecadastramento_T_SituacaoAtual1
    FOREIGN KEY (TS_ID)
    REFERENCES T_Situacao (TS_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_HistooRecadastramento_T_Usuario1
    FOREIGN KEY (TU_ID_Resp_Coleta)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_HistooRecadastramento_T_Usuario2
    FOREIGN KEY (TU_ID_Resp_Digita)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador_has_T_TipoArtePesca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_TipoArtePesca (
    TP_ID INT NOT NULL,
    TAP_ID INT NOT NULL,
    itc_id int null,
  PRIMARY KEY (TP_ID, TAP_ID),
  CONSTRAINT fk_T_Pescador_has_T_TipoArtePesca_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_TipoArtePesca_T_TipoArtePesca1
    FOREIGN KEY (TAP_ID)
    REFERENCES T_ArtePesca (TAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT fk_T_Pescador_has_T_areapesca
    FOREIGN KEY (tareap_id)
    REFERENCES t_areapesca (tareap_id),
CONSTRAINT fk_T_Pescador_has_T_tipocapturada
    FOREIGN KEY (itc_id)
    REFERENCES t_tipocapturada (itc_id)
);




-- -----------------------------------------------------
-- Table T_TipoCapturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoCapturada (
  ITC_ID serial,
  ITC_Tipo VARCHAR(30) NULL,
  PRIMARY KEY (ITC_ID));



-- -----------------------------------------------------
-- Table T_Pescador_has_T_EspecieCapturadas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_EspecieCapturadas (
  TP_ID INT NOT NULL,
  T_TipoCapturada_ITC_ID INT NOT NULL,
  PRIMARY KEY (TP_ID),
  CONSTRAINT fk_T_Pescador_has_T_EspecieCapturadas_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_EspecieCapturadas_T_TipoCapturada1
    FOREIGN KEY (T_TipoCapturada_ITC_ID)
    REFERENCES T_TipoCapturada (ITC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_PorteEmbarcacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_PorteEmbarcacao (
  TPE_ID serial,
  TPE_Porte VARCHAR(30) NOT NULL,
  PRIMARY KEY (TPE_ID));



-- -----------------------------------------------------
-- Table T_Pescador_has_T_Embarcacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_Embarcacao (
  TTE_ID INT NOT NULL,
  TP_ID INT NOT NULL,
  TPTE_Motor boolean NOT NULL,
  TPE_ID INT NOT NULL,
  PRIMARY KEY (TTE_ID, TP_ID),
  CONSTRAINT fk_T_Pescador_has_T_Embarcacao_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Embarcacao_T_Embarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Embarcacao_T_PorteEmbarcacao1
    FOREIGN KEY (TPE_ID)
    REFERENCES T_PorteEmbarcacao (TPE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador_has_T_Colonia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_Colonia (
  TP_ID INT NOT NULL,
  TC_ID INT NOT NULL,
  TPTC_DataInscColonia DATE NULL,
  PRIMARY KEY (TP_ID, TC_ID),
  CONSTRAINT fk_T_Pescador_has_T_Colonia_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Colonia_T_Colonia1
    FOREIGN KEY (TC_ID)
    REFERENCES T_Colonia (TC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_AlteracaoSenha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_AlteracaoSenha (
  TAS_Token CHAR(40) NOT NULL,
  TAS_DataSolicitacao TIMESTAMP NOT NULL,
  TAS_DataAlteracao TIMESTAMP NULL,
  TU_ID INT NOT NULL,
  PRIMARY KEY (TAS_Token),
  CONSTRAINT fk_T_AlteracaoSenha_T_Usuario1
    FOREIGN KEY (TU_ID)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Usuario_has_T_TelefoneContato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Usuario_has_T_TelefoneContato (
  TU_ID INT NOT NULL,
  TTCont_ID INT NOT NULL,
  PRIMARY KEY (TU_ID, TTCont_ID),
  CONSTRAINT fk_T_Usuario_has_T_TelefoneContato_T_Usuario1
    FOREIGN KEY (TU_ID)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Usuario_has_T_TelefoneContato_T_TelefoneContato1
    FOREIGN KEY (TTCont_ID)
    REFERENCES T_TelefoneContato (TTCont_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador_has_T_TelefoneContato
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_TelefoneContato (
  TP_ID INT NOT NULL,
  TTCont_ID INT NOT NULL,
  PRIMARY KEY (TP_ID, TTCont_ID),
  CONSTRAINT fk_T_Pescador_has_T_TelefoneContato_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_TelefoneContato_T_TelefoneContato1
    FOREIGN KEY (TTCont_ID)
    REFERENCES T_TelefoneContato (TTCont_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Grupo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Grupo (
  GRP_ID serial,
  GRP_Nome VARCHAR(45) NULL,
  PRIMARY KEY (GRP_ID));



-- -----------------------------------------------------
-- Table T_Ordem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Ordem (
  ORD_ID serial,
  ORD_Nome VARCHAR(30) NULL,
  ORD_Caracteristica VARCHAR(45) NULL,
  GRP_ID INT NOT NULL,
  PRIMARY KEY (ORD_ID),
  CONSTRAINT fk_DSBQ_Ordem_DSBQ_Grupo
    FOREIGN KEY (GRP_ID)
    REFERENCES T_Grupo (GRP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Familia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Familia (
  FAM_ID serial,
  FAM_Nome VARCHAR(45) NULL,
  FAM_Ordem_Filogenetica INT NULL,
  FAM_Tipo VARCHAR(45) NULL,
  FAM_Caracteristica VARCHAR(255) NULL,
  ORD_ID INT NOT NULL,
  PRIMARY KEY (FAM_ID),
  CONSTRAINT fk_DSBQ_Familia_DSBQ_Ordem1
    FOREIGN KEY (ORD_ID)
    REFERENCES T_Ordem (ORD_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Genero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Genero (
  GEN_ID serial,
  GEN_Nome VARCHAR(45) NULL,
  FAM_ID INT NOT NULL,
  PRIMARY KEY (GEN_ID),
  CONSTRAINT fk_DSBQ_Genero_DSBQ_Familia1
    FOREIGN KEY (FAM_ID)
    REFERENCES T_Familia (FAM_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Especie
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Especie (
  ESP_ID serial,
  ESP_Nome VARCHAR(45) NULL,
  ESP_Descritor VARCHAR(45) NULL,
  ESP_Nome_Comum VARCHAR(45) NULL,
  GEN_ID INT NOT NULL,
  PRIMARY KEY (ESP_ID),
  CONSTRAINT fk_DSBQ_Espécie_DSBQ_Genero1
    FOREIGN KEY (GEN_ID)
    REFERENCES T_Genero (GEN_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Subamostra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Subamostra (
  SA_ID serial,
  SA_Subamostra BOOLEAN NULL,
  PRIMARY KEY (SA_ID));



-- -----------------------------------------------------
-- Table T_Porto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Porto (
  PTO_ID serial,
  PTO_Nome VARCHAR(45) NULL,
  PTO_Local VARCHAR(45) NULL,
  TMun_ID INT NOT NULL,
  PRIMARY KEY (PTO_ID),
  CONSTRAINT fk_DSBQ_Porto_T_Municipio1
    FOREIGN KEY (TMun_ID)
    REFERENCES T_Municipio (TMun_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Tempo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Tempo (
  TMP_ID serial,
  TMP_Estado VARCHAR(45) NULL,
  PRIMARY KEY (TMP_ID));



-- -----------------------------------------------------
-- Table T_Vento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Vento (
  VNT_ID serial,
  VNT_Forca VARCHAR(20) NULL,
  PRIMARY KEY (VNT_ID));



-- -----------------------------------------------------
-- Table T_Ficha_Diaria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Ficha_Diaria (
  FD_ID serial,
  T_Estagiario_TU_ID INT NOT NULL,
  T_Monitor_TU_ID1 INT NOT NULL,
  FD_Data DATE NULL,
  FD_Hora_Inicio TIME NULL,
  FD_Hora_Termino TIME NULL,
  OBS VARCHAR(100) NULL,
  PTO_ID INT NOT NULL,
  TMP_ID INT NOT NULL,
  VNT_ID INT NOT NULL,
  PRIMARY KEY (FD_ID),
  CONSTRAINT fk_DSBQ_Ficha_Diaria_DSBQ_Porto1
    FOREIGN KEY (PTO_ID)
    REFERENCES T_Porto (PTO_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Ficha_Diaria_T_Usuario1
    FOREIGN KEY (T_Estagiario_TU_ID)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Ficha_Diaria_T_Usuario2
    FOREIGN KEY (T_Monitor_TU_ID1)
    REFERENCES T_Usuario (TU_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Ficha_Diaria_DSBQ_Tempo1
    FOREIGN KEY (TMP_ID)
    REFERENCES T_Tempo (TMP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Ficha_Diaria_DSBQ_Vento1
    FOREIGN KEY (VNT_ID)
    REFERENCES T_Vento (VNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Monitoramento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Monitoramento (
  MNT_ID serial,
  MNT_Arte INT NULL,
  MNT_Quantidade INT NULL,
  MNT_Monitorado BOOLEAN NULL,
  MNT_Embarcado BOOLEAN NULL,
  FD_ID INT NOT NULL,
  PRIMARY KEY (MNT_ID),
  CONSTRAINT fk_DSBQ_Monitoramento_DSBQ_Ficha_Diaria1
    FOREIGN KEY (FD_ID)
    REFERENCES T_Ficha_Diaria (FD_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Entrevista_Pescador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Entrevista_Pescador (
  EP_ID serial,
  EP_CodParaDesembarque INT NULL,
  EP_NumPescadores INT NULL,
  EP_DataEHoraSaida TIMESTAMP NULL,
  EP_DataHoraChegada TIMESTAMP NULL,
  SA_ID INT NOT NULL,
  EP_DestinoDoPescado VARCHAR(45) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (EP_ID),
  CONSTRAINT fk_DSBQ_Entrevista_Pescador_DSBQ_Subamostra1
    FOREIGN KEY (SA_ID)
    REFERENCES T_Subamostra (SA_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Entrevista_Pescador_DSBQ_Monitoramento1
    FOREIGN KEY (MNT_ID)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Esp_Arte_Pesca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Esp_Arte_Pesca (
  EAP_ID serial,
  EAP_Especializacao VARCHAR(45) NULL,
  TAP_ID INT NOT NULL,
  EP_ID INT NOT NULL,
  PRIMARY KEY (EAP_ID),
  CONSTRAINT fk_DSBQ_Esp_Arte_Pesca_DSBQ_Entrevista_Pescador1
    FOREIGN KEY (EP_ID)
    REFERENCES T_Entrevista_Pescador (EP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Esp_Arte_Pesca_T_ArtePesca1
    FOREIGN KEY (TAP_ID)
    REFERENCES T_ArtePesca (TAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_ArrastoFundo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ArrastoFundo (
  AF_ID serial,
  AF_TempoAPesqueiro TIME NULL,
  EAP_ID INT NOT NULL,
  AF_Observacao VARCHAR(100) NULL,
  AF_Avistamento VARCHAR(45) NULL,
  AF_Prc_Gelo FLOAT NULL,
  AF_Prc_Alimento FLOAT NULL,
  AF_Lts_Oleo FLOAT NULL,
  AF_Lts_Diesel VARCHAR(45) NULL,
  PRIMARY KEY (AF_ID),
  CONSTRAINT fk_DSBQ_ArrastoFundo_DSBQ_Esp_Arte_Pesca1
    FOREIGN KEY (EAP_ID)
    REFERENCES T_Esp_Arte_Pesca (EAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pesqueiro_AF
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pesqueiro_AF (
  PAF_ID serial,
  PAF_Pesqueiro VARCHAR(45) NULL,
  PAF_DuracaoArrasto TIME NULL,
  AF_ID INT NOT NULL,
  PRIMARY KEY (PAF_ID),
  CONSTRAINT fk_DSBQ_Pesqueiro_AF_DSBQ_ArrastoFundo1
    FOREIGN KEY (AF_ID)
    REFERENCES T_ArrastoFundo (AF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Dados_Emalhe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Dados_Emalhe (
  DEM_ID serial,
  DEM_Dt_Lancamento TIMESTAMP NULL,
  DEM_Dt_Recolhimento TIMESTAMP NULL,
  DEM_Tamanho FLOAT NULL,
  DEM_Altura FLOAT NULL,
  DEM_Qtd_Panos INT NULL,
  DEM_Malha INT NULL,
  PRIMARY KEY (DEM_ID));



-- -----------------------------------------------------
-- Table T_Dados_Calao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Dados_Calao (
  DCA_ID serial,
  DCA_Tempo_Gasto TIME NULL,
  DCA_Qtd_Lances INT NULL,
  DCA_Tamanho FLOAT NULL,
  DCA_Altura FLOAT NULL,
  DCA_Malha INT NULL,
  PRIMARY KEY (DCA_ID));



-- -----------------------------------------------------
-- Table T_Dados_Tarrafa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Dados_Tarrafa (
  DTA_ID serial,
  DTA_Tempo_Gasto TIME NULL,
  DTA_Altura FLOAT NULL,
  DTA_Roda FLOAT NULL,
  DTA_Malha INT NULL,
  PRIMARY KEY (DTA_ID));



-- -----------------------------------------------------
-- Table T_Rede
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Rede (
  RD_ID serial,
  RD_Num_Panos INT NULL,
  RD_ComprimentoPano FLOAT NULL,
  RD_AlturaPano FLOAT NULL,
  RD_TamanhoMalha FLOAT NULL,
  DEM_ID INT NULL,
  DCA_ID INT NULL,
  DTA_ID INT NULL,
  PAF_ID INT NOT NULL,
  EAP_ID INT NOT NULL,
  RD_Observacao VARCHAR(100) NULL,
  RD_Avistamento VARCHAR(45) NULL,
  RD_Prc_Gelo FLOAT NULL,
  RD_Prc_Alimento FLOAT NULL,
  RD_Ltd_Oleo FLOAT NULL,
  RD_Ltd_Diesel FLOAT NULL,
  PRIMARY KEY (RD_ID),
  CONSTRAINT fk_DSBQ_Rede_DSBQ_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Rede_DSBQ_Esp_Arte_Pesca1
    FOREIGN KEY (EAP_ID)
    REFERENCES T_Esp_Arte_Pesca (EAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Rede_DSBQ_Dados_Emalhe1
    FOREIGN KEY (DEM_ID)
    REFERENCES T_Dados_Emalhe (DEM_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Rede_DSBQ_Dados_Calao1
    FOREIGN KEY (DCA_ID)
    REFERENCES T_Dados_Calao (DCA_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Rede_DSBQ_Dados_Tarrafa1
    FOREIGN KEY (DTA_ID)
    REFERENCES T_Dados_Tarrafa (DTA_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Isca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Isca (
  IS_ID serial,
  IS_Tipo VARCHAR(45) NULL,
  PRIMARY KEY (IS_ID));



-- -----------------------------------------------------
-- Table T_PescaLinha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_PescaLinha (
  PL_ID serial,
  PL_Pesqueiro VARCHAR(45) NULL,
  PL_TempoAoPesqueiro TIME NULL,
  PL_Num_Linhas INT NULL,
  PL_Num_Anzois INT NULL,
  PL_Observacao VARCHAR(100) NULL,
  PL_Avistamento VARCHAR(60) NULL,
  PL_Prc_Gelo FLOAT NULL,
  PL_Prc_Alimento FLOAT NULL,
  PL_Lts_Oleo FLOAT NULL,
  PL_Lts_Diesel FLOAT NULL,
  PAF_ID INT NOT NULL,
  EAP_ID INT NOT NULL,
  IS_ID INT NOT NULL,
  PRIMARY KEY (PL_ID),
--  INDEX fk_DSBQ_PescaLinha_DSBQ_Pesqueiro_AF1_idx (PAF_ID ASC),
--  INDEX fk_DSBQ_PescaLinha_DSBQ_Esp_Arte_Pesca1_idx (EAP_ID ASC),
--  INDEX fk_DSBQ_PescaLinha_DSBQ_Isca1_idx (IS_ID ASC),
  CONSTRAINT fk_DSBQ_PescaLinha_DSBQ_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_PescaLinha_DSBQ_Esp_Arte_Pesca1
    FOREIGN KEY (EAP_ID)
    REFERENCES T_Esp_Arte_Pesca (EAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_PescaLinha_DSBQ_Isca1
    FOREIGN KEY (IS_ID)
    REFERENCES T_Isca (IS_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Mare
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mare (
  MR_ID serial,
  MR_Tipo VARCHAR(20) NULL,
  PRIMARY KEY (MR_ID));



-- -----------------------------------------------------
-- Table T_Mariscagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mariscagem (
  MRG_ID serial,
  MRG_TempoAPesqueiro TIME NULL,
  MRG_TempoMariscagem TIME NULL,
  MRG_DistanciaMarisco FLOAT NULL,
  MRG_Num_Armadilha INT NULL,
  MRG_Diesel INT NULL,
  MRG_Obs VARCHAR(200) NULL,
  AF_PAF_ID INT NOT NULL,
  EAP_ID INT NOT NULL,
  MR_ID INT NOT NULL,
  PRIMARY KEY (MRG_ID),
--  INDEX fk_DSBQ_Mariscagem_DSBQ_Pesqueiro_AF1_idx (AF_PAF_ID ASC),
--  INDEX fk_DSBQ_Mariscagem_DSBQ_Esp_Arte_Pesca1_idx (EAP_ID ASC),
--  INDEX fk_DSBQ_Mariscagem_DSBQ_Mare1_idx (MR_ID ASC),
--  INDEX fk_DSBQ_Mariscagem_T_ArtePesca1_idx (TAP_ID_TipoMariscagem ASC),
  CONSTRAINT fk_DSBQ_Mariscagem_DSBQ_Pesqueiro_AF1
    FOREIGN KEY (AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Mariscagem_DSBQ_Esp_Arte_Pesca1
    FOREIGN KEY (EAP_ID)
    REFERENCES T_Esp_Arte_Pesca (EAP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Mariscagem_DSBQ_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  RD_ID INT NULL,
  PL_ID INT NULL,
  MRG_ID INT NULL,
  AF_ID INT NULL,
  PRIMARY KEY (SPC_ID),
--  INDEX fk_DSBQ_Especie_Capturada_DSBQ_Especie1_idx (ESP_ID ASC),
--  INDEX fk_DSBQ_Especie_Capturada_DSBQ_Rede1_idx (RD_ID ASC),
--  INDEX fk_DSBQ_Especie_Capturada_DSBQ_PescaLinha1_idx (PL_ID ASC),
--  INDEX fk_DSBQ_Especie_Capturada_DSBQ_Mariscagem1_idx (MRG_ID ASC),
--  INDEX fk_DSBQ_Especie_Capturada_DSBQ_ArrastoFundo1_idx (AF_ID ASC),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Rede1
    FOREIGN KEY (RD_ID)
    REFERENCES T_Rede (RD_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_PescaLinha1
    FOREIGN KEY (PL_ID)
    REFERENCES T_PescaLinha (PL_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Mariscagem1
    FOREIGN KEY (MRG_ID)
    REFERENCES T_Mariscagem (MRG_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_ArrastoFundo1
    FOREIGN KEY (AF_ID)
    REFERENCES T_ArrastoFundo (AF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador_has_TT_Dependente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_TT_Dependente (
  Tptd_id serial,
  TP_ID INT NOT NULL,
  T_TipoDependente_TTD_ID INT NOT NULL,
  tp_td_quantidade integer,
  Primary Key (tptd_id),
--  INDEX fk_T_Pescador_has_TT_Dependente_T_Pescador1_idx (TP_ID ASC),
--  INDEX fk_T_Pescador_has_TT_Dependente_T_TipoDependente1_idx (T_TipoDependente_TTD_ID ASC),
  CONSTRAINT fk_T_Pescador_has_TT_Dependente_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_TT_Dependente_T_TipoDependente1
    FOREIGN KEY (T_TipoDependente_TTD_ID)
    REFERENCES T_TipoDependente (TTD_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Pescador_has_T_Comunidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pescador_has_T_Comunidade (
  TP_ID INT NOT NULL,
  TCOM_ID INT NOT NULL,
--  INDEX fk_T_Pescador_has_T_Comunidade_T_Pescador1_idx (T_Pescador_TP_ID ASC),
--  INDEX fk_T_Pescador_has_T_Comunidade_T_Comunidade1_idx (T_Comunidade_TCOM_ID ASC),
  PRIMARY KEY (TCOM_ID),
  CONSTRAINT fk_T_Pescador_has_T_Comunidade_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Pescador_has_T_Comunidade_T_Comunidade1
    FOREIGN KEY (TCOM_ID)
    REFERENCES T_Comunidade (TCOM_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

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


CREATE VIEW V_COLONIA AS
   SELECT T_COLONIA.TC_ID, T_COLONIA.TC_NOME, T_COLONIA.TC_ESPECIFICIDADE, T_COLONIA.TCOM_ID,
   T_COLONIA.TE_ID, T_ENDERECO.TE_LOGRADOURO, T_ENDERECO.TE_NUMERO, T_ENDERECO.TE_COMP, T_ENDERECO.TE_BAIRRO, T_ENDERECO.TE_CEP,
   T_ENDERECO.TMUN_ID, T_MUNICIPIO.TMUN_MUNICIPIO, T_MUNICIPIO.TUF_SIGLA
   FROM T_COLONIA, T_ENDERECO, T_MUNICIPIO
   WHERE T_COLONIA.TE_ID = T_ENDERECO.TE_ID AND
   T_ENDERECO.TMUN_ID = T_MUNICIPIO.TMUN_ID;




-- DROP VIEW V_PESCADOR;

CREATE VIEW V_PESCADOR AS
SELECT
TP.TP_ID, TP.TP_NOME,
TP.TP_SEXO, TP.TP_MATRICULA,
TP.TP_APELIDO, TP.TP_FILIACAOPAI,
TP.TP_FILIACAOMAE, TP.TP_CTPS,
TP.TP_PIS, TP.TP_INSS,
TP.TP_NIT_CEI, TP.TP_RG,
TP.TP_CMA, TP.TP_RGB_MAA_IBAMA,
TP.TP_CIR_CAP_PORTO, TP.TP_CPF,
TP.TP_DATANASC,
TP.tp_especificidade, TP.esc_id,
TP.TMUN_ID_NATURAL, TM.TMUN_MUNICIPIO "MUNNAT", TM.TUF_SIGLA "SIGNAT",
TP.TE_ID, TE.TE_LOGRADOURO, TE.TE_NUMERO,
TE.TE_COMP, TE.TE_BAIRRO, TE.TE_CEP,
TE.TMUN_ID, TM.TMUN_MUNICIPIO, TM.TUF_SIGLA
FROM
T_PESCADOR AS TP,  T_ENDERECO AS TE, T_MUNICIPIO AS TM
WHERE
TP.TMUN_ID_NATURAL = TM.TMUN_ID AND
TP.TE_ID = TE.TE_ID;

CREATE TABLE t_pescador_has_telefone
(
  tpt_tp_id integer not null,
  tpt_ttel_id integer not null,
  tpt_telefone numeric(14,0) not null,
  CONSTRAINT t_pescadorcontato_pkey PRIMARY KEY (tpt_tp_id, tpt_ttel_id),
  CONSTRAINT fk_tpt_tp FOREIGN KEY (tpt_tp_id) REFERENCES t_pescador (tp_id),
  CONSTRAINT fk_tpt_ttel FOREIGN KEY (tpt_ttel_id) REFERENCES t_tipotel (ttel_id)
)

CREATE VIEW V_PescadorHasTelefone AS
select pt.tpt_tp_id, pt.tpt_ttel_id, pt.tpt_telefone, tt.ttel_desc
from t_pescador_has_telefone as PT, t_tipotel as TT
where pt.tpt_ttel_id = tt.ttel_id;

CREATE VIEW V_PESCADORHASDEPENDENTE AS
SELECT
PD.TP_ID, PD.TTD_ID, PD.TPTD_QUANTIDADE,
TD.TTD_TIPODEPENDENTE
FROM 
T_PESCADOR_HAS_T_TIPODEPENDENTE AS PD,
T_TIPODEPENDENTE AS TD
WHERE
PD.TTD_ID = TD.TTD_ID;


CREATE TABLE t_pescador_has_t_tipodependente
(
  tp_id integer NOT NULL,
  ttd_id integer NOT NULL,
  tptd_quantidade integer,
  CONSTRAINT t_pescador_has_t_tipodependente_pkey PRIMARY KEY (tp_id, ttd_id),
  CONSTRAINT fk_t_pescador_has_t_tipodependente_tp_id FOREIGN KEY (tp_id) REFERENCES t_pescador (tp_id),
  CONSTRAINT fk_t_pescador_has_t_tipodependente_ttd_id FOREIGN KEY (ttd_id) REFERENCES t_tipodependente (ttd_id)
);

INSERT INTO t_pescador_has_t_tipodependente (tp_id, ttd_id, tptd_quantidade)
SELECT tp_id, t_tipodependente_ttd_id, tp_td_quantidade FROM t_pescador_has_tt_dependente ;


CREATE TABLE t_tiporenda (
ttr_id serial,
ttr_descricao  VARCHAR(45) not null,
CONSTRAINT t_tiporenda_pkey PRIMARY KEY (ttr_id)
);

insert into t_tiporenda values (1, 'Pesca');
insert into t_tiporenda values (2, 'Outra renda');


--DROP TABLE t_pescador_has_t_renda;

CREATE TABLE t_pescador_has_t_renda
(
  tp_id integer NOT NULL,
  ren_id integer NOT NULL,
  ttr_id integer NOT NULL,
  CONSTRAINT t_pescador_has_t_renda_pkey PRIMARY KEY (tp_id, ren_id, ttr_id),
  CONSTRAINT fk_t_pescador_has_t_renda_tp_id FOREIGN KEY (tp_id) REFERENCES t_pescador (tp_id),
  CONSTRAINT fk_t_pescador_has_t_renda FOREIGN KEY (ren_id) REFERENCES t_renda (ren_id),
CONSTRAINT fk_t_pescador_has_t_renda_ttr_id FOREIGN KEY (ttr_id) REFERENCES t_tiporenda (ttr_id)
);

alter table t_pescador ADD CONSTRAINT fk_pescador_esc_id FOREIGN KEY (esc_id) REFERENCES t_escolaridade(esc_id);

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

--V_PESCADORHASEMBARCACAO
CREATE VIEW V_PESCADORHASEMBARCACAO AS
SELECT
PHE.TP_ID,
PHE.TTE_ID, TTE.TTE_TIPOEMBARCACAO,
PHE.TPTE_MOTOR,
PHE.TPE_ID,  TPE.TPE_PORTE
FROM 
T_PESCADOR_HAS_T_EMBARCACAO AS PHE,
T_TIPOEMBARCACAO AS TTE,
T_PORTEEMBARCACAO AS TPE
WHERE
PHE.TTE_ID = TTE.TTE_ID AND
PHE.TPE_ID = TPE.TPE_ID;

--V_PESCADORHASARTETIPOAREA
CREATE VIEW V_PESCADORHASARTETIPOAREA AS
SELECT
PATA.TP_ID,
PATA.TAP_ID, ARTE.TAP_ARTEPESCA,
PATA.ITC_ID,  TIPO.ITC_TIPO
FROM 
T_PESCADOR_HAS_T_TIPOARTEPESCA AS PATA,
T_TIPOCAPTURADA AS TIPO,
T_ARTEPESCA AS ARTE
WHERE
PATA.TAP_ID = ARTE.TAP_ID AND 
PATA.ITC_ID = TIPO.ITC_ID;


-- -----------------------------------------------------
-- Table T_AreaPesca_has_T_Pescador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_PESCADOR_HAS_T_AREAPESCA (
TP_ID INT NOT NULL,  
TAREAP_ID INT NOT NULL,
  PRIMARY KEY (TP_ID, TAREAP_ID),
  CONSTRAINT FK_T_PESCADOR_HAS_T_AREAPESCA_TP_ID
    FOREIGN KEY (TP_ID)
    REFERENCES T_PESCADOR (TP_ID),
  CONSTRAINT FK_T_PESCADOR_HAS_T_AREAPESCA_TAREAP_ID
    FOREIGN KEY (TAREAP_ID)
    REFERENCES T_AREAPESCA (TAREAP_ID)
);

INSERT INTO T_PESCADOR_HAS_T_AREAPESCA (TP_ID, TAREAP_ID)
SELECT TP_ID, TAREAP_ID FROM T_AREAPESCA_HAS_T_PESCADOR;

drop table T_AREAPESCA_HAS_T_PESCADOR;

CREATE VIEW V_PESCADOR_HAS_T_AREAPESCA AS
SELECT
PA.TP_ID,
PA.TAREAP_ID, AREA.TAREAP_AREAPESCA
FROM 
T_PESCADOR_HAS_T_AREAPESCA AS PA,
T_AREAPESCA AS AREA
WHERE
PA.TAREAP_ID = AREA.TAREAP_ID;

