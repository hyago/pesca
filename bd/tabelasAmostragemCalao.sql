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
CONSTRAINT fk_t_amostra_camarao_usuario2 FOREIGN KEY (tu_id_estagiario)
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
  CONSTRAINT fk_t_amostra_peixe_usuario2 FOREIGN KEY (tu_id_estagiario)
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

CREATE OR REPLACE VIEW v_unidade_camarao AS
 SELECT t_unidade_camarao.tuc_id, t_unidade_camarao.tamc_id,
    t_unidade_camarao.tuc_sexo, t_maturidade.tmat_tipo,
    t_unidade_camarao.tuc_comprimento_cabeca, t_unidade_camarao.tuc_peso
   FROM t_unidade_camarao, t_maturidade
  WHERE t_unidade_camarao.tmat_id = t_maturidade.tmat_id;


Insert into t_maturidade (tmat_tipo) values ('Aberto');
Insert into t_maturidade (tmat_tipo) values ('Fechado');
Insert into t_maturidade (tmat_tipo) values ('Em Desenvolvimento');
Insert into t_maturidade (tmat_tipo) values ('Desenvolvida');
Insert into t_maturidade (tmat_tipo) values ('Rudimentar');
Insert into t_maturidade (tmat_tipo) values ('Não informado');

CREATE OR REPLACE VIEW v_amostra_camarao AS 
 SELECT t_amostra_camarao.tamc_id, tue.tu_nome, t_porto.pto_nome, 
    t_amostra_camarao.tamc_data, t_barco.bar_nome, t_pesqueiro_af.paf_pesqueiro, 
    t_especie.esp_nome_comum, t_amostra_camarao.tamc_captura_total, 
    t_subamostra.sa_id, tum.tu_nome AS tmonitor
   FROM t_amostra_camarao
  INNER JOIN t_usuario tue ON t_amostra_camarao.tu_id = tue.tu_id
  INNER JOIN t_pesqueiro_af ON t_amostra_camarao.paf_id = t_pesqueiro_af.paf_id 
  INNER JOIN t_porto ON t_amostra_camarao.pto_id = t_porto.pto_id 
  INNER JOIN t_barco ON t_amostra_camarao.bar_id = t_barco.bar_id 
  INNER JOIN t_especie ON t_amostra_camarao.esp_id = t_especie.esp_id 
  INNER JOIN t_subamostra ON t_amostra_camarao.sa_id = t_subamostra.sa_id
  INNER JOIN t_usuario tum ON t_amostra_camarao.tu_id_monitor = tum.tu_id;

Drop view v_unidade_peixe;
Create or Replace View v_unidade_peixe AS
SELECT t_unidade_peixe.tup_id, t_amostra_peixe.tamp_id, t_especie.esp_nome_comum, t_unidade_peixe.tup_comprimento, t_unidade_peixe.tup_peso, t_unidade_peixe.tup_sexo
  FROM t_unidade_peixe, t_amostra_peixe, t_especie
  WHERE t_unidade_peixe.tamp_id = t_amostra_peixe.tamp_id AND t_unidade_peixe.esp_id = t_especie.esp_id;

CREATE OR REPLACE VIEW v_amostra_peixe AS 
 SELECT t_amostra_peixe.tamp_id, tue.tu_nome, t_porto.pto_nome,
    t_subamostra.sa_id, tum.tu_nome AS tmonitor
   FROM t_amostra_peixe
   JOIN t_usuario tue ON t_amostra_peixe.tu_id = tue.tu_id
   JOIN t_porto ON t_amostra_peixe.pto_id = t_porto.pto_id
   JOIN t_subamostra ON t_amostra_peixe.sa_id = t_subamostra.sa_id
   JOIN t_usuario tum ON t_amostra_peixe.tu_id_monitor = tum.tu_id;

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