ALTER TABLE t_calao
ADD cal_tamanho1 double precision, ADD cal_tamanho2 double precision

------------------------------------AMOSTRAGEM---------------------------------------------------------------------------
--Camarão-----------------------------------------------------------------------------------------------------------------
CREATE TABLE t_amostra_camarao
(
  tamc_id serial,
  tu_id_monitor integer not null,
  tu_id_estagiario integer not null,
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

---Quantidades------------------------------------------------------------------------------------------------------------
CREATE TABLE t_maturidade(
	tmat_id serial,
	tmat_tipo character varying(25),
	Primary Key (tmat_id)
);


CREATE TABLE t_unidade_camarao
(
  tuc_id serial,
  tamc_id integer not null,
  tuc_sexo character varying(1),
  tmat_id integer not null, 
  tuc_comprimento_cabeca float,
  tuc_peso float,
  Primary key (tuq_id),
  CONSTRAINT fk_t_unidade_camarao_amostra1 FOREIGN KEY (tamc_id)
      REFERENCES t_amostra_camarao (tamc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_unidade_camarao_maturidade1 FOREIGN KEY (tmat_id)
      REFERENCES t_maturidade (tmat_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE t_amostra_peixe
(
  tamp_id serial,
  tu_id_monitor integer not null,
  tu_id_estagiario integer not null,
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

CREATE TABLE t_unidade_peixe
(
  tup_id serial,
  tamp_id integer not null,
  esp_id integer not null,
  tup_comprimento float,
  tup_peso float,
  tuc_sexo character varying(1),
  Primary key (tup_id),
  CONSTRAINT fk_t_unidade_peixe_amostra1 FOREIGN KEY (tamp_id)
      REFERENCES t_amostra_camarao (tamc_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_unidade_peixe_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION   
)