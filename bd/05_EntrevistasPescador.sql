-- -----------------------------------------------------
-- Table T_Isca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Isca (
  ISC_ID serial,
  ISC_Tipo VARCHAR(45) NULL,
  PRIMARY KEY (ISC_ID));

-- -----------------------------------------------------
-- Table T_TipoEmbarcacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoEmbarcacao (
  TTE_ID serial,
  TTE_TipoEmbarcacao VARCHAR(50) NOT NULL,
  PRIMARY KEY (TTE_ID));


-- -----------------------------------------------------
-- Table T_Monitoramento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Monitoramento (
  MNT_ID serial,
  MNT_Arte INT NULL DEFAULT NULL,
  MNT_Quantidade INT NULL DEFAULT NULL,
  MNT_Monitorado boolean NULL DEFAULT NULL,
  MNT_Embarcado boolean NULL DEFAULT NULL,
  FD_ID INT NOT NULL,
  PRIMARY KEY (MNT_ID),
  CONSTRAINT fk_DSBQ_Monitoramento_DSBQ_Ficha_Diaria1
    FOREIGN KEY (FD_ID)
    REFERENCES T_Ficha_Diaria (FD_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Pesqueiro_AF
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Pesqueiro_AF (
  PAF_ID INT NULL DEFAULT NULL,
  PAF_Pesqueiro VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (PAF_ID));



-- -----------------------------------------------------
-- Table T_TipoMare
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_TipoMare (
  TMR_ID serial,
  TMR_Tipo VARCHAR(20) NULL,
  PRIMARY KEY (TMR_ID));



-- -----------------------------------------------------
-- Table T_Mare
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mare (
  MR_ID serial,
  TMR_ID INT NOT NULL,
  MR_Viva boolean NULL,
  PRIMARY KEY (MR_ID),
  CONSTRAINT fk_T_Mare_T_TipoMare1
    FOREIGN KEY (TMR_ID)
    REFERENCES T_TipoMare (TMR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Barco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Barco (
  BAR_ID serial,
  BAR_Nome VARCHAR(45) NULL,
  PRIMARY KEY (BAR_ID));



-- -----------------------------------------------------
-- Table T_ArrastoFundo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ArrastoFundo (
  AF_ID serial,
  AF_Embarcado boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID_Entrevistado INT NOT NULL,
  AF_QuantPescadores INT NULL,
  AF_DHSaida TIMESTAMP NULL,
  AF_DHVolta TIMESTAMP NULL,
  AF_Diesel FLOAT NULL,
  AF_Oleo FLOAT NULL,
  AF_Alimento FLOAT NULL,
  AF_Gelo FLOAT NULL,
  AF_Avistou VARCHAR(100) NULL,
  AF_Subamostra boolean NULL,
  AF_SubID INT NULL,
  AF_OBS VARCHAR(100) NULL,
  MNT_ENT_ID INT NOT NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (AF_ID),
  CONSTRAINT fk_T_ArrastoFundo_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ArrastoFundo_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ArrastoFundo_T_Pescador1
    FOREIGN KEY (TP_ID_Entrevistado)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ArrastoFundo_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_ArrastoFundo_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ArrastoFundo_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  AF_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_ArrastoFundo1
    FOREIGN KEY (AF_ID)
    REFERENCES T_ArrastoFundo (AF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Emalhe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Emalhe (
  EM_ID serial,
  EM_Embarcado boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  EM_QuantPescadores INT NULL,
  EM_DHLancamento TIMESTAMP NULL,
  EM_DHRecolhimento TIMESTAMP NULL,
  EM_Diesel FLOAT NULL,
  EM_Oleo FLOAT NULL,
  EM_Alimento FLOAT NULL,
  EM_Gelo FLOAT NULL,
  EM_Avistou VARCHAR(100) NULL,
  EM_Subamostra boolean NULL,
  EM_SubID INT NULL,
  EM_Tamanho FLOAT NULL,
  EM_Altura FLOAT NULL,
  EM_NumPanos INT NULL,
  EM_Malha INT NULL,
  MNT_ENT_ID INT NOT NULL,
  EM_OBS VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (EM_ID),
  CONSTRAINT fk_T_Emalhe_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Emalhe_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Emalhe_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Emalhe_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Emalhe_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Emalhe_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  EM_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Emalhe1
    FOREIGN KEY (EM_ID)
    REFERENCES T_Emalhe (EM_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_ArrastoFundo_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ArrastoFundo_has_T_Pesqueiro (
  AF_ID INT NOT NULL,
  AF_PAF_ID INT NOT NULL,
  T_TempoPesqueiro TIME NULL,
  PRIMARY KEY (AF_ID, AF_PAF_ID),
  CONSTRAINT fk_T_ArrastoFundo_has_T_Pesqueiro_T_ArrastoFundo1
    FOREIGN KEY (AF_ID)
    REFERENCES T_ArrastoFundo (AF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ArrastoFundo_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Calao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Calao (
  CAL_ID serial,
  CAL_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID_Entrevistado INT NOT NULL,
  CAL_QuantPescadores INT NULL,
  CAL_Data DATE NULL,
  CAL_TempoGasto TIME NULL,
  CAL_Avistou VARCHAR(100) NULL,
  CAL_Subamostra boolean NULL,
  CAL_SubId INT NULL,
  CAL_Tamanho FLOAT NULL,
  CAL_Altura FLOAT NULL,
  CAL_Malha FLOAT NULL,
  CAL_NumLances INT NULL,
  T_Monitoramento_has_TEntrevista_MNT_ENT_ID INT NOT NULL,
  CAL_OBS VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (CAL_ID),
  CONSTRAINT fk_T_Calao_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Calao_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Calao_T_Pescador1
    FOREIGN KEY (TP_ID_Entrevistado)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Calao_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Calao_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Calao_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  CAL_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Calao1
    FOREIGN KEY (CAL_ID)
    REFERENCES T_Calao (CAL_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Tarrafa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Tarrafa (
  TAR_ID serial,
  TAR_Embarcado boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID_Entrevistado INT NOT NULL,
  TAR_QuantPescadores INT NULL,
  TAR_Data DATE NULL,
  TAR_TempoGasto TIME NULL,
  TAR_Avistou VARCHAR(100) NULL,
  TAR_Subamostra boolean NULL,
  TAR_SubID INT NULL,
  TAR_Roda FLOAT NULL,
  TAR_Altura FLOAT NULL,
  TAR_Malha FLOAT NULL,
  TAR_NumLances INT NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (TAR_ID),
  CONSTRAINT fk_T_Tarrafa_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Tarrafa_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Tarrafa_T_Pescador1
    FOREIGN KEY (TP_ID_Entrevistado)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Tarrafa_T_Monitoramento1
    FOREIGN KEY (MNT_ID)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Tarrafa_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Tarrafa_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  TAR_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Calao1
    FOREIGN KEY (TAR_ID)
    REFERENCES T_Tarrafa (TAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




-- -----------------------------------------------------
-- Table T_Emalhe_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Emalhe_has_T_Pesqueiro (
  EM_ID INT NOT NULL,
  AF_PAF_ID INT NOT NULL,
  PRIMARY KEY (EM_ID),
  CONSTRAINT fk_T_Emalhe_has_T_Pesqueiro_T_Emalhe1
    FOREIGN KEY (EM_ID)
    REFERENCES T_Emalhe (EM_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Emalhe_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Calao_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Calao_has_T_Pesqueiro (
  CAL_ID INT NOT NULL,
  AF_PAF_ID INT NOT NULL,
  PRIMARY KEY (CAL_ID),
  CONSTRAINT fk_T_Calao_has_T_Pesqueiro_T_Calao1
    FOREIGN KEY (CAL_ID)
    REFERENCES T_Calao (CAL_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Calao_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Tarrafa_Has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Tarrafa_Has_T_Pesqueiro (
  TAR_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  PRIMARY KEY (TAR_ID),
  CONSTRAINT fk_T_Tarrafa_Has_T_Pesqueiro_T_Tarrafa1
    FOREIGN KEY (TAR_ID)
    REFERENCES T_Tarrafa (TAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Tarrafa_Has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);







-- -----------------------------------------------------
-- Table T_Linha
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Linha (
  LIN_ID serial,
  T_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  LIN_NumPescadores INT NULL,
  LIN_DHSaida TIMESTAMP NULL,
  LIN_DHVolta TIMESTAMP NULL,
  LIN_Diesel FLOAT NULL,
  LIN_Oleo FLOAT NULL,
  LIN_Alimento FLOAT NULL,
  LIN_Gelo FLOAT NULL,
  LIN_Avistou VARCHAR(100) NULL,
  LIN_Subamostra boolean NULL,
  LIN_SubID INT NULL,
  LIN_NumLinhas INT NULL,
  LIN_NumAnzoisPLinha INT NULL,
  ISC_ID INT NOT NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (LIN_ID),
  CONSTRAINT fk_T_Linha_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Linha_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Linha_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Linha_T_Isca1
    FOREIGN KEY (ISC_ID)
    REFERENCES T_Isca (ISC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Linha_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Linha_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Linha_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  LIN_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Calao1
    FOREIGN KEY (LIN_ID)
    REFERENCES T_Linha (LIN_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Linha_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Linha_has_T_Pesqueiro (
  LIN_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  LIN_PAF_TempoAPesqueiro TIME NULL,
  PRIMARY KEY (LIN_ID),
  CONSTRAINT fk_T_Tarrafa_has_T_Pesqueiro_T_Linha1
    FOREIGN KEY (LIN_ID)
    REFERENCES T_Linha (LIN_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Tarrafa_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Grosseira
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Grosseira (
  GRS_ID serial,
  GRS_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  GRS_NumPescadores INT NULL,
  GRS_DHSaida TIMESTAMP NOT NULL,
  GRS_DHVolta TIMESTAMP NULL,
  GRS_Diesel FLOAT NULL,
  GRS_Oleo FLOAT NULL,
  GRS_Alimento FLOAT NULL,
  GRS_Gelo FLOAT NULL,
  GRS_Avistou VARCHAR(100) NULL,
  GRS_NumLinhas INT NULL,
  GRS_NumAnzoisPLinha INT NULL,
  ISC_ID INT NOT NULL,
  GRS_OBS VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (GRS_ID),
  CONSTRAINT fk_T_Grosseira_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Grosseira_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Grosseira_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Grosseira_T_Isca1
    FOREIGN KEY (ISC_ID)
    REFERENCES T_Isca (ISC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Grosseira_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Grosseira_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Grosseira_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  GRS_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Grosseira1
    FOREIGN KEY (GRS_ID)
    REFERENCES T_Grosseira (GRS_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    

-- -----------------------------------------------------
-- Table T_Grosseira_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Grosseira_has_T_Pesqueiro (
  GRS_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  GRS_PAF_TempoAPesqueiro TIME NULL,
  PRIMARY KEY (GRS_ID),
  CONSTRAINT fk_T_Grosseira_has_T_Pesqueiro_T_Grosseira1
    FOREIGN KEY (GRS_ID)
    REFERENCES T_Grosseira (GRS_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Grosseira_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Mergulho
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mergulho (
  MER_ID serial,
  MER_Embarcada boolean NULL,
  BAR_ID INT NOT NULL,
  TTE_ID INT NOT NULL,
  TP_ID INT NOT NULL,
  MER_QuantPescadores INT NULL,
  MER_DHSaida TIMESTAMP NULL,
  MER_DHVolta TIMESTAMP NULL,
  MER_TempoGasto TIME NULL,
  MER_Avistou VARCHAR(100) NULL,
  MER_Subamostra boolean NULL,
  MER_SubID INT NULL,
  MR_ID INT NOT NULL,
  MNT_ID INT NOT NULL,
  MER_OBS VARCHAR(100) NULL,
  PRIMARY KEY (MER_ID),
  CONSTRAINT fk_T_Mergulho_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Mergulho_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Mergulho_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Mergulho_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Mergulho_T_Monitoramento1
    FOREIGN KEY (MNT_ID)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Mergulho_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mergulho_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  MER_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Mergulho1
    FOREIGN KEY (MER_ID)
    REFERENCES T_Mergulho (MER_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    

-- -----------------------------------------------------
-- Table T_Mergulho_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Mergulho_has_T_Pesqueiro (
  T_Mergulho_MER_ID INT NOT NULL,
  T_Pesqueiro_AF_PAF_ID INT NOT NULL,
  MER_PAF_TempoAPesqueiro TIME NULL,
  MER_PAF_DistAPesqueiro FLOAT NULL,
  PRIMARY KEY (T_Mergulho_MER_ID),
  CONSTRAINT fk_T_Mergulho_has_T_Pesqueiro_T_Mergulho1
    FOREIGN KEY (T_Mergulho_MER_ID)
    REFERENCES T_Mergulho (MER_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Mergulho_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (T_Pesqueiro_AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_ColetaManual
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ColetaManual (
  CML_ID serial,
  CML_Embarcada boolean NULL,
  BAR_ID INT NOT NULL,
  TTE_ID INT NOT NULL,
  TP_ID_Entrevistado INT NOT NULL,
  CML_QuantPescadores INT NULL,
  CML_DHSaida TIMESTAMP NULL,
  CML_DHVolta TIMESTAMP NULL,
  CML_TempoGasto TIME NULL,
  CML_Avistamento VARCHAR(100) NULL,
  CML_Subamostra boolean NULL,
  CML_SubID INT NULL,
  MR_ID INT NOT NULL,
  CML_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (CML_ID),
  CONSTRAINT fk_T_ColetaManual_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ColetaManual_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ColetaManual_T_Pescador1
    FOREIGN KEY (TP_ID_Entrevistado)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ColetaManual_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ColetaManual_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_ColetaManual_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ColetaManual_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  CML_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_ColetaManual1
    FOREIGN KEY (CML_ID)
    REFERENCES T_ColetaManual (CML_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_ColetaManual_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_ColetaManual_has_T_Pesqueiro (
  CML_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  CML_PAF_TempoAPesqueiro TIME NULL,
  CML_PAF_DistAPesqueiro FLOAT NULL,
  PRIMARY KEY (CML_ID),
  CONSTRAINT fk_T_ColetaManual_has_T_Pesqueiro_T_ColetaManual1
    FOREIGN KEY (CML_ID)
    REFERENCES T_ColetaManual (CML_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_ColetaManual_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_VaraPesca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_VaraPesca (
  VP_ID serial,
  VP_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  VP_QuantPescadores INT NULL,
  VP_DHSaida TIMESTAMP NULL,
  VP_DHVolta TIMESTAMP NULL,
  VP_TempoGasto TIME NULL,
  VP_Diesel FLOAT NULL,
  VP_Oleo FLOAT NULL,
  VP_Alimento FLOAT NULL,
  VP_Gelo FLOAT NULL,
  VP_Avistamento VARCHAR(100) NULL,
  VP_Subamostra boolean NULL,
  VP_SubID INT NULL,
  MR_ID INT NULL,
  VP_NumAnzoisPLinha INT NULL,
  VP_NumLinhas INT NULL,
  ISC_ID INT NULL,
  VP_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (VP_ID),
  CONSTRAINT fk_T_VaraPesca_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_T_Isca1
    FOREIGN KEY (ISC_ID)
    REFERENCES T_Isca (ISC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_T_Monitoramento1
    FOREIGN KEY (MNT_ID)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_VaraPesca_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_VaraPesca_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  VP_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_VaraPesca1
    FOREIGN KEY (VP_ID)
    REFERENCES T_VaraPesca (VP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_VaraPesca_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_VaraPesca_has_T_Pesqueiro (
  VP_ID INT NOT NULL,
  AF_PAF_ID INT NOT NULL,
  VP_PAF_TempoAPesqueiro TIME NULL,
  VP_PAF_DistAPesqueiro FLOAT NULL,
  PRIMARY KEY (VP_ID),
  CONSTRAINT fk_T_VaraPesca_has_T_Pesqueiro_T_VaraPesca1
    FOREIGN KEY (VP_ID)
    REFERENCES T_VaraPesca (VP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_VaraPesca_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (AF_PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_LinhaFundo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_LinhaFundo (
  LF_ID serial,
  LF_Embarcada boolean NULL,
  T_Barco_BAR_ID INT NULL,
  T_TipoEmbarcacao_TTE_ID INT NULL,
  T_Pescador_TP_ID INT NOT NULL,
  LF_QuantPescadores INT NULL,
  LF_DHSaida TIMESTAMP NULL,
  LF_DHVolta TIMESTAMP NULL,
  LF_TempoGasto TIME NULL,
  LF_Diesel FLOAT NULL,
  LF_Oleo FLOAT NULL,
  LF_Alimento FLOAT NULL,
  LF_Gelo FLOAT NULL,
  LF_Avistamento VARCHAR(100) NULL,
  LF_Subamostra boolean NULL,
  LF_SubamostraID INT NULL,
  MR_ID INT NULL,
  LF_NumLinhas INT NULL,
  LF_NumAnzoisPLinha INT NULL,
  ISC_ID INT NULL,
  LF_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (LF_ID),
  CONSTRAINT fk_T_LinhaFundo_T_Barco1
    FOREIGN KEY (T_Barco_BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_T_TipoEmbarcacao1
    FOREIGN KEY (T_TipoEmbarcacao_TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_T_Pescador1
    FOREIGN KEY (T_Pescador_TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_T_Isca1
    FOREIGN KEY (ISC_ID)
    REFERENCES T_Isca (ISC_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_T_Monitoramento1
    FOREIGN KEY (MNT_ID)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_LinhaFundo_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_LinhaFundo_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  LF_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_LinhaFundo1
    FOREIGN KEY (LF_ID)
    REFERENCES T_LinhaFundo (LF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_LinhaFundo_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_LinhaFundo_has_T_Pesqueiro (
  LF_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  LF_PAF_TempoAPesqueiro TIME NULL,
  LF_PAF_DistAPesqueiro FLOAT NULL,
  PRIMARY KEY (LF_ID),
  CONSTRAINT fk_T_LinhaFundo_has_T_Pesqueiro_T_LinhaFundo1
    FOREIGN KEY (LF_ID)
    REFERENCES T_LinhaFundo (LF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_LinhaFundo_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Jerere
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Jerere (
  JRE_ID serial,
  JRE_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  JRE_QuantPescadores INT NULL,
  JRE_DHSaida TIMESTAMP NULL,
  JRE_DHVolta TIMESTAMP NULL,
  JRE_TempoGasto TIME NULL,
  JRE_Avistamento VARCHAR(100) NULL,
  JRE_Subamostra boolean NULL,
  JRE_SubID INT NULL,
  MR_ID INT NOT NULL,
  JRE_NumArmadilhas INT NULL,
  JRE_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (JRE_ID),
  CONSTRAINT fk_T_Jerere_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Jerere_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Jerere_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Jerere_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Jerere_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Jerere_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Jerere_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  JRE_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Jerere1
    FOREIGN KEY (JRE_ID)
    REFERENCES T_Jerere (JRE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


    
-- -----------------------------------------------------
-- Table T_Jerere_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Jerere_has_T_Pesqueiro (
  JRE_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  JRE_PAF_TempoAPesqueiro TIME NULL,
  JRE_PAF_DistAPesqueiro FLOAT NULL,
  CONSTRAINT fk_T_Jerere_has_T_Pesqueiro_T_Jerere1
    FOREIGN KEY (JRE_ID)
    REFERENCES T_Jerere (JRE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Jerere_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Siripoia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Siripoia (
  SIR_ID serial,
  SIR_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  SIR_QuantPescadores INT NULL,
  SIR_DHSaida TIMESTAMP NULL,
  SIR_DHVolta TIMESTAMP NULL,
  SIR_TempoGasto TIME NULL,
  SIR_Avistamento VARCHAR(100) NULL,
  SIR_Subamostra boolean NULL,
  SIR_SubID INT NULL,
  MR_ID INT NOT NULL,
  SIR_NumArmadilhas INT NULL,
  SIR_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (SIR_ID),
  CONSTRAINT fk_T_Siripoia_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Siripoia_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Siripoia_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Siripoia_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Siripoia_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Siripoia_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Siripoia_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  SIR_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Siripoia1
    FOREIGN KEY (SIR_ID)
    REFERENCES T_Siripoia (SIR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Siripoia_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Siripoia_has_T_Pesqueiro (
  SIR_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  SIR_PAF_TempoAPesqueiro TIME NULL,
  SIR_PAF_DistAPesqueiro FLOAT NULL,
  CONSTRAINT fk_T_Siripoia_has_T_Pesqueiro_T_Siripoia1
    FOREIGN KEY (SIR_ID)
    REFERENCES T_Siripoia (SIR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Siripoia_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
-- -----------------------------------------------------
-- Table T_Manzua
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Manzua (
  MAN_ID serial,
  MAN_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  MAN_QuantPescadores INT NULL,
  MAN_DHSaida TIMESTAMP NULL,
  MAN_DHVolta TIMESTAMP NULL,
  MAN_TempoGasto TIME NULL,
  MAN_Avistamento VARCHAR(100) NULL,
  MAN_Subamostra boolean NULL,
  MAN_SubID INT NULL,
  MR_ID INT NOT NULL,
  MAN_NumArmadilhas INT NULL,
  MAN_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (Man_ID),
  CONSTRAINT fk_T_Manzua_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Manzua_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Manzua_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Manzua_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Manzua_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table T_Manzua_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Manzua_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  MAN_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Manzua1
    FOREIGN KEY (MAN_ID)
    REFERENCES T_Manzua (MAN_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Manzua_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Manzua_has_T_Pesqueiro (
  Man_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  Man_PAF_TempoAPesqueiro TIME NULL,
  Man_PAF_DistAPesqueiro FLOAT NULL,
  CONSTRAINT fk_T_Manzua_has_T_Pesqueiro_T_Manzua1
    FOREIGN KEY (Man_ID)
    REFERENCES T_Manzua (Man_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Manzua_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
-- -----------------------------------------------------
-- Table T_Ratoeira
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Ratoeira (
  RAT_ID serial,
  RAT_Embarcada boolean NULL,
  BAR_ID INT NULL,
  TTE_ID INT NULL,
  TP_ID INT NOT NULL,
  RAT_QuantPescadores INT NULL,
  RAT_DHSaida TIMESTAMP NULL,
  RAT_DHVolta TIMESTAMP NULL,
  RAT_TempoGasto TIME NULL,
  RAT_Avistamento VARCHAR(100) NULL,
  RAT_Subamostra boolean NULL,
  RAT_SubID INT NULL,
  MR_ID INT NOT NULL,
  RAT_NumArmadilhas INT NULL,
  RAT_Obs VARCHAR(100) NULL,
  MNT_ID INT NOT NULL,
  PRIMARY KEY (RAT_ID),
  CONSTRAINT fk_T_Ratoeira_T_Barco1
    FOREIGN KEY (BAR_ID)
    REFERENCES T_Barco (BAR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Ratoeira_T_TipoEmbarcacao1
    FOREIGN KEY (TTE_ID)
    REFERENCES T_TipoEmbarcacao (TTE_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Ratoeira_T_Pescador1
    FOREIGN KEY (TP_ID)
    REFERENCES T_Pescador (TP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Ratoeira_T_Mare1
    FOREIGN KEY (MR_ID)
    REFERENCES T_Mare (MR_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Ratoeira_T_Monitoramento1
    FOREIGN KEY (mnt_id)
    REFERENCES T_Monitoramento (MNT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table T_Ratoeira_has_T_Especie_Capturada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Ratoeira_has_T_Especie_Capturada (
  SPC_ID serial,
  SPC_Nome VARCHAR(45) NULL,
  SPC_Quantidade INT NULL,
  SPC_Peso_kg INT NULL,
  SPC_Preco DECIMAL(5) NULL,
  ESP_ID INT NOT NULL,
  RAT_ID INT NOT NULL,
  PRIMARY KEY (SPC_ID),
  CONSTRAINT fk_DSBQ_Especie_Capturada_DSBQ_Especie1
    FOREIGN KEY (ESP_ID)
    REFERENCES T_Especie (ESP_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Especie_Capturada_T_Ratoeira1
    FOREIGN KEY (RAT_ID)
    REFERENCES T_Ratoeira (RAT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table T_Ratoeira_has_T_Pesqueiro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Ratoeira_has_T_Pesqueiro (
  RAT_ID INT NOT NULL,
  PAF_ID INT NOT NULL,
  RAT_PAF_TempoAPesqueiro TIME NULL,
  RAT_PAF_DistAPesqueiro FLOAT NULL,
  CONSTRAINT fk_T_Ratoeira_has_T_Pesqueiro_T_Ratoeira1
    FOREIGN KEY (RAT_ID)
    REFERENCES T_Ratoeira (RAT_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_T_Ratoeira_has_T_Pesqueiro_T_Pesqueiro_AF1
    FOREIGN KEY (PAF_ID)
    REFERENCES T_Pesqueiro_AF (PAF_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	