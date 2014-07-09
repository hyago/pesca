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
Alter table t_unidade_peixe
Add Foreign Key (tamp_id)
References t_amostra_peixe (tamp_id) match Simple ON UPDATE NO ACTION ON DELETE NO ACTION;


Insert into t_maturidade (tmat_tipo) values ('Aberto');
Insert into t_maturidade (tmat_tipo) values ('Fechado');
Insert into t_maturidade (tmat_tipo) values ('Em Desenvolvimento');
Insert into t_maturidade (tmat_tipo) values ('Desenvolvida');
Insert into t_maturidade (tmat_tipo) values ('Rudimentar');
Insert into t_maturidade (tmat_tipo) values ('Não informado');

drop table t_unidade_peixe cascade;
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

DROP VIEW V_UNIDADE_PEIXE;
CREATE OR REPLACE VIEW V_UNIDADE_PEIXE AS
SELECT T_UNIDADE_PEIXE.TUP_ID, T_AMOSTRA_PEIXE.TAMP_ID, T_ESPECIE.ESP_NOME_COMUM, T_UNIDADE_PEIXE.TUP_COMPRIMENTO, T_UNIDADE_PEIXE.TUP_PESO, T_UNIDADE_PEIXE.TUP_SEXO
FROM T_UNIDADE_PEIXE, T_AMOSTRA_PEIXE, T_ESPECIE
WHERE T_UNIDADE_PEIXE.TAMP_ID = T_AMOSTRA_PEIXE.TAMP_ID AND T_UNIDADE_PEIXE.ESP_ID = T_ESPECIE.ESP_ID;
