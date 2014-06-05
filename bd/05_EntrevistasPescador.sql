
Drop view v_arrasto_has_t_pesqueiro;
Drop view v_varapesca_has_t_pesqueiro;
Drop view v_tarrafa_has_t_pesqueiro;
Drop view v_siripoia_has_t_pesqueiro;
Drop view v_ratoeira_has_t_pesqueiro;
Drop view v_mergulho_has_t_pesqueiro;
Drop view v_manzua_has_t_pesqueiro;
Drop view v_linhafundo_has_t_pesqueiro;
Drop view v_linha_has_t_pesqueiro;
Drop view v_jerere_has_t_pesqueiro;
Drop view v_grosseira_has_t_pesqueiro;
Drop view v_coletamanual_has_t_pesqueiro;
Drop view v_emalhe_has_t_pesqueiro;
Drop view v_calao_has_t_pesqueiro;

Drop Table t_calao_has_t_pesqueiro;
Drop Table t_emalhe_has_t_pesqueiro;
Drop Table t_coletamanual_has_t_pesqueiro;
Drop Table t_grosseira_has_t_pesqueiro;
Drop Table t_jerere_has_t_pesqueiro;
Drop Table t_linha_has_t_pesqueiro;
Drop Table t_linhafundo_has_t_pesqueiro;
Drop Table t_manzua_has_t_pesqueiro;
Drop Table t_mergulho_has_t_pesqueiro;
Drop Table t_ratoeira_has_t_pesqueiro;
Drop Table t_siripoia_has_t_pesqueiro;
Drop Table t_tarrafa_has_t_pesqueiro;
Drop Table t_varapesca_has_t_pesqueiro;
Drop Table t_arrastofundo_has_t_pesqueiro;

Drop view v_arrastofundo_has_t_especie_capturada;
Drop view v_varapesca_has_t_especie_capturada;
Drop view v_tarrafa_has_t_especie_capturada;
Drop view v_siripoia_has_t_especie_capturada;
Drop view v_ratoeira_has_t_especie_capturada;
Drop view v_mergulho_has_t_especie_capturada;
Drop view v_manzua_has_t_especie_capturada;
Drop view v_linhafundo_has_t_especie_capturada;
Drop view v_linha_has_t_especie_capturada;
Drop view v_jerere_has_t_especie_capturada;
Drop view v_grosseira_has_t_especie_capturada;
Drop view v_coletamanual_has_t_especie_capturada;
Drop view v_emalhe_has_t_especie_capturada;
Drop view v_calao_has_t_especie_capturada;

Drop Table t_calao_has_t_especie_capturada;
Drop Table t_emalhe_has_t_especie_capturada;
Drop Table t_coletamanual_has_t_especie_capturada;
Drop Table t_grosseira_has_t_especie_capturada;
Drop Table t_jerere_has_t_especie_capturada;
Drop Table t_linha_has_t_especie_capturada;
Drop Table t_linhafundo_has_t_especie_capturada;
Drop Table t_manzua_has_t_especie_capturada;
Drop Table t_mergulho_has_t_especie_capturada;
Drop Table t_ratoeira_has_t_especie_capturada;
Drop Table t_siripoia_has_t_especie_capturada;
Drop Table t_tarrafa_has_t_especie_capturada;
Drop Table t_varapesca_has_t_especie_capturada;
Drop Table t_arrastofundo_has_t_especie_capturada;

Drop table t_arrastofundo;
Drop table t_varapesca;
Drop table t_tarrafa;
Drop table t_siripoia;
Drop table t_ratoeira;
Drop table t_mergulho;
Drop table t_manzua;
Drop table t_linhafundo;
Drop table t_linha;
Drop table t_jerere;
Drop table t_grosseira;
Drop table t_coletamanual;
Drop table t_emalhe;
Drop table t_calao;

-- Table: t_barco

--DROP TABLE t_barco;

CREATE TABLE IF NOT EXISTS t_barco
(
  bar_id serial NOT NULL,
  bar_nome character varying(45),
  CONSTRAINT t_barco_pkey PRIMARY KEY (bar_id)
);
-- Table: t_isca

--DROP TABLE t_isca;

CREATE TABLE IF NOT EXISTS t_isca
(
  isc_id serial NOT NULL,
  isc_tipo character varying(45),
  CONSTRAINT t_isca_pkey PRIMARY KEY (isc_id)
);
-- Table: t_avistamento

-- DROP TABLE t_avistamento;

CREATE TABLE IF NOT EXISTS t_avistamento
(
  avs_id serial NOT NULL,
  avs_descricao character varying(50) NOT NULL,
  CONSTRAINT t_avistamento_pkey PRIMARY KEY (avs_id)
);


-- Table: t_mare



CREATE TABLE IF NOT EXISTS t_mare
(
  mre_id serial NOT NULL,
  mre_tipo character varying(20),
  CONSTRAINT t_mare_pkey PRIMARY KEY (mre_id)
);

-- Table: t_monitoramento

--DROP TABLE t_monitoramento;

CREATE TABLE IF NOT EXISTS t_monitoramento
(
  mnt_id serial NOT NULL,
  mnt_arte integer,
  mnt_quantidade integer,
  mnt_monitorado boolean,
  fd_id integer NOT NULL,
  CONSTRAINT t_monitoramento_pkey PRIMARY KEY (mnt_id),
  CONSTRAINT fk_dsbq_monitoramento_dsbq_ficha_diaria1 FOREIGN KEY (fd_id)
      REFERENCES t_ficha_diaria (fd_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_arrastofundo


CREATE TABLE IF NOT EXISTS t_arrastofundo
(
  af_id serial NOT NULL,
  af_embarcado boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  af_quantpescadores integer,
  af_dhsaida timestamp without time zone,
  af_dhvolta timestamp without time zone,
  af_diesel double precision,
  af_oleo double precision,
  af_alimento double precision,
  af_gelo double precision,
  af_avistou character varying(100),
  af_subamostra boolean,
  sa_id integer,
  af_obs character varying(100),
  mnt_id integer NOT NULL,
  af_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Table: t_calao

CREATE TABLE IF NOT EXISTS t_calao
(
  cal_id serial NOT NULL,
  cal_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  cal_quantpescadores integer,
  cal_data date,
  cal_tempogasto time without time zone,
  cal_avistou character varying(100),
  cal_subamostra boolean,
  sa_id integer,
  cal_tamanho double precision,
  cal_altura double precision,
  cal_malha double precision,
  cal_numlances integer,
  cal_obs character varying(100),
  mnt_id integer NOT NULL,
  cal_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_coletamanual
(
  cml_id serial NOT NULL,
  cml_embarcada boolean,
  bar_id integer NOT NULL,
  tte_id integer NOT NULL,
  tp_id_entrevistado integer NOT NULL,
  cml_quantpescadores integer,
  cml_dhsaida timestamp without time zone,
  cml_dhvolta timestamp without time zone,
  cml_tempogasto time without time zone,
  cml_avistamento character varying(100),
  cml_subamostra boolean,
  sa_id integer,
  cml_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  cml_mreviva boolean,
  cml_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


-- Table: t_emalhe
CREATE TABLE IF NOT EXISTS t_emalhe
(
  em_id serial NOT NULL,
  em_embarcado boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  em_quantpescadores integer,
  em_dhlancamento timestamp without time zone,
  em_dhrecolhimento timestamp without time zone,
  em_diesel double precision,
  em_oleo double precision,
  em_alimento double precision,
  em_gelo double precision,
  em_avistou character varying(100),
  em_subamostra boolean,
  sa_id integer,
  em_tamanho double precision,
  em_altura double precision,
  em_numpanos integer,
  em_malha integer,
  em_obs character varying(100),
  mnt_id integer NOT NULL,
  em_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_emalhe_has_t_especie_capturada


-- Table: t_grosseira

CREATE TABLE IF NOT EXISTS t_grosseira
(
  grs_id serial NOT NULL,
  grs_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  grs_numpescadores integer,
  grs_dhsaida timestamp without time zone NOT NULL,
  grs_dhvolta timestamp without time zone,
  grs_diesel double precision,
  grs_oleo double precision,
  grs_alimento double precision,
  grs_gelo double precision,
  grs_avistou character varying(100),
  grs_numlinhas integer,
  grs_numanzoisplinha integer,
  grs_subamostra boolean,
  sa_id integer,
  isc_id integer NOT NULL,
  grs_obs character varying(100),
  mnt_id integer NOT NULL,
  grs_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;
-- Table: t_grosseira_has_t_especie_capturada


-- Table: t_jerere

CREATE TABLE IF NOT EXISTS t_jerere
(
  jre_id serial NOT NULL,
  jre_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  jre_quantpescadores integer,
  jre_dhsaida timestamp without time zone,
  jre_dhvolta timestamp without time zone,
  jre_tempogasto time without time zone,
  jre_avistamento character varying(100),
  jre_subamostra boolean,
  sa_id integer,
  jre_numarmadilhas integer,
  jre_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  jre_mreviva boolean,
  jre_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_jerere_has_t_especie_capturada



-- Table: t_linha


CREATE TABLE IF NOT EXISTS t_linha
(
  lin_id serial NOT NULL,
  lin_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  lin_numpescadores integer,
  lin_dhsaida timestamp without time zone,
  lin_dhvolta timestamp without time zone,
  lin_diesel double precision,
  lin_oleo double precision,
  lin_alimento double precision,
  lin_gelo double precision,
  lin_avistou character varying(100),
  lin_subamostra boolean,
  sa_id integer,
  lin_numlinhas integer,
  lin_numanzoisplinha integer,
  isc_id integer NOT NULL,
  mnt_id integer NOT NULL,
  lin_motor boolean,
  lin_obs character varying(100),
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Table: t_linha_has_t_especie_capturada



-- Table: t_linhafundo


CREATE TABLE IF NOT EXISTS t_linhafundo
(
  lf_id serial NOT NULL,
  lf_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  lf_quantpescadores integer,
  lf_dhsaida timestamp without time zone,
  lf_dhvolta timestamp without time zone,
  lf_tempogasto time without time zone,
  lf_diesel double precision,
  lf_oleo double precision,
  lf_alimento double precision,
  lf_gelo double precision,
  lf_avistamento character varying(100),
  lf_subamostra boolean,
  sa_id integer,
  lf_numlinhas integer,
  lf_numanzoisplinha integer,
  isc_id integer,
  lf_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  lf_mreviva boolean,
  lf_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE IF NOT EXISTS t_manzua
(
  man_id serial NOT NULL,
  man_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  man_quantpescadores integer,
  man_dhsaida timestamp without time zone,
  man_dhvolta timestamp without time zone,
  man_tempogasto time without time zone,
  man_avistamento character varying(100),
  man_subamostra boolean,
  sa_id integer,
  man_numarmadilhas integer,
  man_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  man_mreviva boolean,
  man_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_mergulho
(
  mer_id serial NOT NULL,
  mer_embarcada boolean,
  bar_id integer NOT NULL,
  tte_id integer NOT NULL,
  tp_id_entrevistado integer NOT NULL,
  mer_quantpescadores integer,
  mer_dhsaida timestamp without time zone,
  mer_dhvolta timestamp without time zone,
  mer_tempogasto time without time zone,
  mer_avistou character varying(100),
  mer_subamostra boolean,
  sa_id integer,
  mnt_id integer NOT NULL,
  mer_obs character varying(100),
  mre_id integer,
  mer_mreviva boolean,
  mer_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_ratoeira
(
  rat_id serial NOT NULL,
  rat_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  rat_quantpescadores integer,
  rat_dhsaida timestamp without time zone,
  rat_dhvolta timestamp without time zone,
  rat_tempogasto time without time zone,
  rat_avistamento character varying(100),
  rat_subamostra boolean,
  sa_id integer,
  rat_numarmadilhas integer,
  rat_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  rat_mreviva boolean,
  rat_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_siripoia
(
  sir_id serial NOT NULL,
  sir_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  sir_quantpescadores integer,
  sir_dhsaida timestamp without time zone,
  sir_dhvolta timestamp without time zone,
  sir_tempogasto time without time zone,
  sir_avistamento character varying(100),
  sir_subamostra boolean,
  sa_id integer,
  sir_numarmadilhas integer,
  sir_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  sir_mreviva boolean,
  sir_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_tarrafa
(
  tar_id serial NOT NULL,
  tar_embarcado boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  tar_quantpescadores integer,
  tar_data date,
  tar_tempogasto time without time zone,
  tar_avistou character varying(100),
  tar_subamostra boolean,
  sa_id integer,
  tar_roda double precision,
  tar_altura double precision,
  tar_malha double precision,
  tar_numlances integer,
  mnt_id integer NOT NULL,
  tar_obs character varying(100),
  tar_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE IF NOT EXISTS t_varapesca
(
  vp_id serial NOT NULL,
  vp_embarcada boolean,
  bar_id integer,
  tte_id integer,
  tp_id_entrevistado integer NOT NULL,
  vp_quantpescadores integer,
  vp_dhsaida timestamp without time zone,
  vp_dhvolta timestamp without time zone,
  vp_tempogasto time without time zone,
  vp_diesel double precision,
  vp_oleo double precision,
  vp_alimento double precision,
  vp_gelo double precision,
  vp_avistamento character varying(100),
  vp_subamostra boolean,
  sa_id integer,
  vp_numanzoisplinha integer,
  vp_numlinhas integer,
  isc_id integer,
  vp_obs character varying(100),
  mnt_id integer NOT NULL,
  mre_id integer NOT NULL,
  vp_mreviva boolean,
  vp_motor boolean,
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
      ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE IF NOT EXISTS t_arrastofundo_has_t_especie_capturada
(
  spc_af_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_calao_has_t_especie_capturada
(
  spc_cal_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_coletamanual_has_t_especie_capturada
(
  spc_cml_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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


CREATE TABLE IF NOT EXISTS t_emalhe_has_t_especie_capturada
(
  spc_em_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_grosseira_has_t_especie_capturada
(
  spc_grs_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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


CREATE TABLE IF NOT EXISTS t_jerere_has_t_especie_capturada
(
  spc_jre_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_linha_has_t_especie_capturada
(
  spc_lin_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_linhafundo_has_t_especie_capturada
(
  spc_lf_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_manzua_has_t_especie_capturada
(
  spc_man_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_mergulho_has_t_especie_capturada
(
  spc_mer_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_ratoeira_has_t_especie_capturada
(
  spc_rat_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_siripoia_has_t_especie_capturada
(
  spc_sir_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_tarrafa_has_t_especie_capturada
(
  spc_tar_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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

CREATE TABLE IF NOT EXISTS t_varapesca_has_t_especie_capturada
(
  spc_vp_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
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



CREATE TABLE IF NOT EXISTS t_arrastofundo_has_t_pesqueiro
(
  af_paf_id serial,
  af_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempopesqueiro time without time zone,
  CONSTRAINT t_arrastofundo_has_t_pesqueiro_pkey PRIMARY KEY (af_paf_id),
  CONSTRAINT fk_t_arrastofundo_has_t_pesqueiro_t_arrastofundo1 FOREIGN KEY (af_id)
      REFERENCES t_arrastofundo (af_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_arrastofundo_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_calao_has_t_pesqueiro
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
CREATE TABLE IF NOT EXISTS t_coletamanual_has_t_pesqueiro
(
  cml_paf_id serial,
  cml_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (cml_paf_id),
  CONSTRAINT fk_t_coletamanual_has_t_pesqueiro_t_coletamanual1 FOREIGN KEY (cml_id)
      REFERENCES t_coletamanual (cml_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_coletamanual_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_emalhe_has_t_pesqueiro
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
CREATE TABLE IF NOT EXISTS t_grosseira_has_t_pesqueiro
(
  grs_paf_id serial,
  grs_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  PRIMARY KEY (grs_paf_id),
  CONSTRAINT fk_t_grosseira_has_t_pesqueiro_t_grosseira1 FOREIGN KEY (grs_id)
      REFERENCES t_grosseira (grs_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_grosseira_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_jerere_has_t_pesqueiro
(
  jre_paf_id serial,
  jre_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (jre_paf_id),
  CONSTRAINT fk_t_jerere_has_t_pesqueiro_t_jerere1 FOREIGN KEY (jre_id)
      REFERENCES t_jerere (jre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_jerere_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS t_linha_has_t_pesqueiro
(
  lin_paf_id serial,
  lin_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  PRIMARY KEY (lin_paf_id),
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_linha1 FOREIGN KEY (lin_id)
      REFERENCES t_linha (lin_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_tarrafa_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_linhafundo_has_t_pesqueiro
(
  lf_paf_id serial,
  lf_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (lf_paf_id),
  CONSTRAINT fk_t_linhafundo_has_t_pesqueiro_t_linhafundo1 FOREIGN KEY (lf_id)
      REFERENCES t_linhafundo (lf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_linhafundo_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_manzua_has_t_pesqueiro
(
  man_paf_id serial,
  man_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (man_paf_id),
  CONSTRAINT fk_t_manzua_has_t_pesqueiro_t_manzua1 FOREIGN KEY (man_id)
      REFERENCES t_manzua (man_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_manzua_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_mergulho_has_t_pesqueiro
(
  mer_paf_id serial,
  mer_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (mer_paf_id),
  CONSTRAINT fk_t_mergulho_has_t_pesqueiro_t_mergulho1 FOREIGN KEY (mer_id)
      REFERENCES t_mergulho (mer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_mergulho_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_ratoeira_has_t_pesqueiro
(
  rat_paf_id serial,
  rat_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (rat_paf_id),
  CONSTRAINT fk_t_ratoeira_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_ratoeira_has_t_pesqueiro_t_ratoeira1 FOREIGN KEY (rat_id)
      REFERENCES t_ratoeira (rat_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_siripoia_has_t_pesqueiro
(
  sir_paf_id serial,
  sir_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
  PRIMARY KEY (sir_paf_id),
  CONSTRAINT fk_t_siripoia_has_t_pesqueiro_t_pesqueiro_af1 FOREIGN KEY (paf_id)
      REFERENCES t_pesqueiro_af (paf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_siripoia_has_t_pesqueiro_t_siripoia1 FOREIGN KEY (sir_id)
      REFERENCES t_siripoia (sir_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS t_tarrafa_has_t_pesqueiro
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
CREATE TABLE IF NOT EXISTS t_varapesca_has_t_pesqueiro
(
  vp_paf_id serial,
  vp_id integer NOT NULL,
  paf_id integer NOT NULL,
  t_tempoapesqueiro time without time zone,
  t_distapesqueiro double precision,
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

CREATE VIEW V_MERGULHO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.MER_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_MER_ID
FROM T_MERGULHO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_MERGULHO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.MER_ID = ESPCAPT.MER_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_COLETAMANUAL_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.CML_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_CML_ID
FROM T_COLETAMANUAL AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_COLETAMANUAL_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.CML_ID = ESPCAPT.CML_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_VARAPESCA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.VP_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_VP_ID
FROM T_VARAPESCA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_VARAPESCA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.VP_ID = ESPCAPT.VP_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_LINHAFUNDO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.LF_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_LF_ID
FROM T_LINHAFUNDO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_LINHAFUNDO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.LF_ID = ESPCAPT.LF_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_JERERE_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.JRE_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_JRE_ID
FROM T_JERERE AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_JERERE_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.JRE_ID = ESPCAPT.JRE_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_SIRIPOIA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.SIR_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_SIR_ID
FROM T_SIRIPOIA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_SIRIPOIA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.SIR_ID = ESPCAPT.SIR_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_MANZUA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.MAN_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_MAN_ID
FROM T_MANZUA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_MANZUA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.MAN_ID = ESPCAPT.MAN_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_RATOEIRA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.RAT_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO, ESPCAPT.SPC_RAT_ID
FROM T_RATOEIRA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_RATOEIRA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.RAT_ID = ESPCAPT.RAT_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;


--Visualizações

CREATE OR REPLACE VIEW v_entrevista_arrasto AS 
 SELECT entrevista.af_id, pescador.tp_nome, barco.bar_nome, monitoramento.mnt_id, fichadiaria.fd_id
   FROM t_arrastofundo as entrevista, t_pescador as pescador, t_barco as barco, t_monitoramento as monitoramento, t_ficha_diaria as fichadiaria 
  WHERE entrevista.tp_id_entrevistado = pescador.tp_id AND entrevista.bar_id = barco.bar_id AND entrevista.mnt_id = monitoramento.mnt_id AND monitoramento.fd_id = fichadiaria.fd_id;

  
  
  
  
  
  
  
  
  
  
  
  
  

----- PERFIL
insert into t_perfil (tp_id, tp_perfil)
select at.codigo, left(at.atividades, 40) from access.atividades as at;


-- USUÁRIOS
--Delete from t_usuario where id>9;
SELECT pg_catalog.setval(' t_login_tl_id_seq', 10, true);
SELECT pg_catalog.setval(' t_endereco_te_id_seq', 10, true);


CREATE OR REPLACE FUNCTION import_user( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT CODIGO, NOME, cod_ativ, email, tel, cel FROM ACCESS.EQUIPE
LOOP
    INSERT INTO T_Endereco (TE_ID, TE_Logradouro, TE_Numero, TE_Bairro, TE_CEP, TE_Comp, TMun_ID)
        VALUES (nextval('t_endereco_te_id_seq'), NULL, NULL, NULL, NULL, NULL, 7);
    INSERT INTO T_Login (TL_ID, TL_Login, TL_HashSenha, TL_UltimoAcesso) 
        VALUES (nextval('t_login_tl_id_seq'), R.CODIGO, '80980fcaf2ab3f243874695f57b2ed065d8e67e4', NULL);
    INSERT INTO T_USUARIO (TU_ID, TU_NOME, TU_SEXO,TU_CPF,TU_RG, TU_EMAIL,TU_TELRES,TU_TELCEL, TL_ID,TP_ID,TE_ID)
        VALUES (R.CODIGO, R.NOME, 'M','1','1','r.email',r.tel,r.cel,currval('t_login_tl_id_seq'),r.cod_ativ,currval('t_endereco_te_id_seq'));
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

select import_user();

-- -- Programa social
-- select count(*), prog_soc from access.pescador group by prog_soc order by prog_soc;
-- update access.pescador  set prog_soc=NULL where prog_soc='Não';
-- 
-- CREATE OR REPLACE FUNCTION import_psocial( ) returns int4 AS $$
-- DECLARE R RECORD;
-- declare ret int4;
-- BEGIN
-- FOR R IN SELECT prog_soc from access.pescador group by prog_soc order by prog_soc
-- LOOP
--     INSERT INTO t_programasocial(prs_id, prs_programa)
--         VALUES (nextval('t_programasocial_prs_id_seq'::regclass), r.prog_soc);
-- END LOOP;
-- RETURN ret;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- Escolaridade
select count(*), escolaridade from access.pescador group by escolaridade order by escolaridade;
update access.pescador  set escolaridade='Médio Completo' where escolaridade='médio completo' or escolaridade='Médio completo';
update access.pescador  set escolaridade='Fundamental Completo' where escolaridade='fundamental completo' or escolaridade='Fundamental completo';
update access.pescador  set escolaridade='Não Alfabetizado' where escolaridade='Não alfabetizado';
update access.pescador  set escolaridade='Não Declarado' where escolaridade ISNULL;

CREATE OR REPLACE FUNCTION import_escolaridade( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT escolaridade from access.pescador group by escolaridade order by escolaridade
LOOP
    INSERT INTO t_escolaridade(esc_id,esc_nivel)
        VALUES (nextval('t_escolaridade_esc_id_seq'::regclass), r.escolaridade);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

-- Renda
select count(*), renda from access.pescador group by renda order by renda;
update access.pescador  set renda='até 1/2 salário mínimo' where renda='200,00' or renda='220,00' or renda='300,00';
update access.pescador  set renda='de 1/2 a 1 salário mínimo' where renda='400,00' or renda='430,00' or renda='500,00' or renda='600,00';
update access.pescador  set renda='Subsistência' where renda='subsistência';
update access.pescador  set renda='maior que 5 salários mínimos' where renda='> 5 salários mínimos';
update access.pescador  set renda='Não Declarado' where renda ISNULL;

CREATE OR REPLACE FUNCTION import_renda( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT renda from access.pescador group by renda order by renda
LOOP
    INSERT INTO t_renda(ren_id, ren_renda)
        VALUES (nextval('t_renda_ren_id_seq'::regclass), r.renda);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

-- Responsável por cadastro
select responsavel_cadastramento from access.pescador where responsavel_cadastramento notnull order by responsavel_cadastramento;
select responsavel_cadastramento from access.pescador where responsavel_cadastramento like 'Tamires O%' or responsavel_cadastramento like 'TAMIRES O%' order by responsavel_cadastramento;
update access.pescador set responsavel_cadastramento='63' where responsavel_cadastramento like 'Taí%' or responsavel_cadastramento like 'Tai%' or responsavel_cadastramento like 'TAÍSSA%' or responsavel_cadastramento like 'TAISSA%';
update access.pescador set responsavel_cadastramento='45' where responsavel_cadastramento like 'Tamires O%' or responsavel_cadastramento like 'TAMIRES O%' ;
update access.pescador set responsavel_cadastramento='60' where responsavel_cadastramento like 'Andressa%' or responsavel_cadastramento like 'ANDRESSA%' 
or responsavel_cadastramento like 'Adressa%' or responsavel_cadastramento like 'Claúdia%' or responsavel_cadastramento like 'CLAUDIA%' or responsavel_cadastramento like 'Cláudia%'
or responsavel_cadastramento like 'Claudia%';
update access.pescador set responsavel_cadastramento='31' where responsavel_cadastramento like 'Joyce%' or responsavel_cadastramento like 'JOYCE%';
update access.pescador set responsavel_cadastramento='62' where responsavel_cadastramento like 'CARLA%' or responsavel_cadastramento like 'Carla%';
update access.pescador set responsavel_cadastramento='15' where responsavel_cadastramento like 'Alexsandro%' or responsavel_cadastramento like 'ALEXSANDO%';
update access.pescador set responsavel_cadastramento='16' where responsavel_cadastramento like 'Anderson%' or responsavel_cadastramento like 'ANDERSON%';
update access.pescador set responsavel_cadastramento='13' where responsavel_cadastramento ='Adriana Martins de Lima';

insert into access.equipe (codigo, nome) values (77,'AÍSSA HELENA');
update access.pescador set responsavel_cadastramento='77' where responsavel_cadastramento ='AÍSSA HELENA';
update access.pescador set responsavel_cadastramento='20' where responsavel_cadastramento ='APOLO';
update access.pescador set responsavel_cadastramento='21' where responsavel_cadastramento like 'CLEBERSON%' or responsavel_cadastramento like 'Cleberson%';
update access.pescador set responsavel_cadastramento='50' where responsavel_cadastramento like 'VANDERLEI%' or responsavel_cadastramento like 'Vanderlei%';
update access.pescador set responsavel_cadastramento='61' where responsavel_cadastramento like 'VALÉRIA%' or responsavel_cadastramento like 'Valéria%'or responsavel_cadastramento like 'VALERIA%';
update access.pescador set responsavel_cadastramento='49' where responsavel_cadastramento like 'Uilas%' or responsavel_cadastramento like 'UILAS%';
update access.pescador set responsavel_cadastramento='48' where responsavel_cadastramento like 'Uellington%';
update access.pescador set responsavel_cadastramento='46' where responsavel_cadastramento like 'TATIANO%' or responsavel_cadastramento like 'TATIANA%' or responsavel_cadastramento like 'Tatiana%';
update access.pescador set responsavel_cadastramento='55' where responsavel_cadastramento like 'TAYNÁ%';
update access.pescador set responsavel_cadastramento='45' where responsavel_cadastramento like 'Tamires%';
update access.pescador set responsavel_cadastramento='44' where responsavel_cadastramento like 'TALISSON%';
update access.pescador set responsavel_cadastramento='42' where responsavel_cadastramento like 'SILAS%' or responsavel_cadastramento like '? SANTOS SILVA%' or responsavel_cadastramento like 'Silas%';

update access.pescador set responsavel_cadastramento='54' where responsavel_cadastramento like 'ROON%' or responsavel_cadastramento like 'Roon%'or responsavel_cadastramento like 'RON%' or responsavel_cadastramento like 'Ron%';
update access.pescador set responsavel_cadastramento='41' where responsavel_cadastramento like 'Ramires%' or responsavel_cadastramento like 'RAMIRES%';
update access.pescador set responsavel_cadastramento='40' where responsavel_cadastramento like 'NUBIA%' or responsavel_cadastramento like 'Núbia%' or responsavel_cadastramento like 'NÚBIA%';

update access.pescador set responsavel_cadastramento='39' where responsavel_cadastramento like 'MARCOS VINICIUS%' or responsavel_cadastramento like 'Marcos Vinicius%'or responsavel_cadastramento like ' MARCOS  VINICIUS%' 
or responsavel_cadastramento like 'Marcus Vinicius%' or responsavel_cadastramento like 'MARCOS%'or responsavel_cadastramento like 'Mário%';
update access.pescador set responsavel_cadastramento='64' where responsavel_cadastramento like 'Marcio%' or responsavel_cadastramento like 'MÁRCIO%'or responsavel_cadastramento like 'Márcio%'or responsavel_cadastramento like 'MARCIO%';

insert into access.equipe (codigo, nome) values (78,'Márcia');
update access.pescador set responsavel_cadastramento='78' where responsavel_cadastramento like 'Márcia%' or responsavel_cadastramento like 'Marcia%';

insert into access.equipe (codigo, nome) values (79,'Nilson');
update access.pescador set responsavel_cadastramento='79' where responsavel_cadastramento like 'Nilson%';
update access.pescador set responsavel_cadastramento='66' where responsavel_cadastramento like 'MARCELO%' or responsavel_cadastramento like 'Marcelo%';

update access.pescador set responsavel_cadastramento='37' where responsavel_cadastramento like 'Luciano Martins%' or responsavel_cadastramento like 'LUCIANO MARQUES%'
 or responsavel_cadastramento like ' LUCIANO MARQUES%'or responsavel_cadastramento like 'Luciano Marques%'or responsavel_cadastramento like 'Luciano dos Santos%';

update access.pescador set responsavel_cadastramento='36' where responsavel_cadastramento like 'LUCIANO%' or responsavel_cadastramento like 'Luciano%';

update access.pescador set responsavel_cadastramento='35' where responsavel_cadastramento like 'Letícia%' or responsavel_cadastramento like 'LETICIA%';
update access.pescador set responsavel_cadastramento='34' where responsavel_cadastramento like 'JUVAN%' or responsavel_cadastramento like 'Juvan%';
update access.pescador set responsavel_cadastramento='33' where responsavel_cadastramento like 'Juliano%';

update access.pescador set responsavel_cadastramento='32' where responsavel_cadastramento like 'JOSÉ%' or responsavel_cadastramento like 'José%'or responsavel_cadastramento like 'Jose%';
update access.pescador set responsavel_cadastramento='31' where responsavel_cadastramento like 'JOICE%';
update access.pescador set responsavel_cadastramento='29' where responsavel_cadastramento like 'JAILTON%' or responsavel_cadastramento like 'Jailton%';
update access.pescador set responsavel_cadastramento='27' where responsavel_cadastramento like 'HUAN%' or responsavel_cadastramento like 'Huan%';

update access.pescador set responsavel_cadastramento='25' where responsavel_cadastramento like 'Eliana%' or responsavel_cadastramento like 'ELIANA%';
update access.pescador set responsavel_cadastramento='59' where responsavel_cadastramento like 'DIEGO%' or responsavel_cadastramento like 'Diego%';

insert into access.equipe (codigo, nome) values (80,'Débora Bluhu');
update access.pescador set responsavel_cadastramento='80' where responsavel_cadastramento like 'Débora%' or responsavel_cadastramento like 'DÉBORA%'or responsavel_cadastramento like 'Debora%'or responsavel_cadastramento like 'DEBORA%';

update access.pescador set responsavel_cadastramento='22' where responsavel_cadastramento like 'DANILA%' or responsavel_cadastramento like 'Danila%';
update access.pescador set responsavel_cadastramento='20' where responsavel_cadastramento like '%Apolo';

insert into access.equipe (codigo, nome) values (81,'Cristiane de Jesus');
update access.pescador set responsavel_cadastramento='81' where responsavel_cadastramento like 'Cristiane de Jesus%';


update access.pescador set responsavel_cadastramento='18' where responsavel_cadastramento like '%LOBO%'or responsavel_cadastramento like '%Lobo%'or responsavel_cadastramento like 'ANTÔNIO N.%'or responsavel_cadastramento like 'Antonio N.%'
or responsavel_cadastramento like '%ANTONIO A.';
update access.pescador set responsavel_cadastramento='19' where responsavel_cadastramento like '%Filho' or responsavel_cadastramento like '%SANTOS'or responsavel_cadastramento like '%FILHO';
update access.pescador set responsavel_cadastramento='17' where responsavel_cadastramento like 'Antonio Maicon%';

update access.pescador set responsavel_cadastramento='18' where responsavel_cadastramento like 'Ant%' or responsavel_cadastramento like 'ANT%';






-- FICHA DIÁRIA
insert into t_ficha_diaria (fd_id, t_estagiario_tu_id, t_monitor_tu_id1, fd_data, fd_turno, obs, pto_id, tmp_id, vnt_id)
select fd.cod_ficha, cast(fd.estagiario as int8), cast(fd.monitor as int8), fd.data, case to_char(fd.horach, 'AM') when 'AM' then 'M' else 'V' end, left(fd.obs, 255), fd.porto_de_desembarque, tmp.tmp_id, vnt.vnt_id 
from access.ficha_diaria as fd, t_vento as vnt, t_tempo as tmp
where fd.vento = vnt.vnt_forca and
fd.tempo = tmp.tmp_estado;


-- Exemplo original
-- SELECT p.p_name, a.activity, a.category
-- FROM people As p 
--   LEFT JOIN lu_activities AS a ON(';' || p.activities || ';' LIKE '%;' || a.activity || ';%')
-- ORDER BY p,p_name, a.category, a.activity;

--arte de pesca
select tap_id, tap_artepesca from t_artepesca;

select codigo, arte_pesca from access.pescador;

SELECT pesc.codigo, pesc.arte_pesca, arte.tap_artepesca, arte.tap_id
FROM access.pescador As pesc 
    INNER JOIN t_artepesca AS arte ON(';' || pesc.arte_pesca || ';' LIKE '%;' || arte.tap_artepesca || ';%')
ORDER BY pesc.codigo, arte.tap_id, arte.tap_artepesca;

-- tipo dependente
select ttd_id, ttd_tipodependente from t_tipodependente;

select codigo, dependente from access.pescador;

SELECT pesc.codigo, pesc.dependente, dep.ttd_tipodependente, dep.ttd_id
FROM access.pescador As pesc 
    INNER JOIN t_tipodependente AS dep ON(';' || pesc.dependente || ';' LIKE '%;' || dep.ttd_tipodependente || ';%')
ORDER BY pesc.codigo, dep.ttd_id, dep.ttd_tipodependente;


-- tipo capturada
select itc_id, itc_tipo from t_tipocapturada;

select codigo, sp_capt from access.pescador;

SELECT pesc.codigo, pesc.sp_capt, cap.itc_tipo, cap.itc_id
FROM access.pescador As pesc 
    INNER JOIN t_tipocapturada AS cap ON(';' || pesc.sp_capt || ';' LIKE '%;' || cap.itc_tipo || ';%')
ORDER BY pesc.codigo, cap.itc_id, cap.itc_tipo;

--
-- --- Tem que ser no final do arquivo
-- select relname from pg_class where relkind='S' order by relname;
--
SELECT pg_catalog.setval(' t_areapesca_tareap_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_artepesca_tap_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_colonia_tc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_comunidade_tcom_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_endereco_te_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_escolaridade_esc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_especie_esp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_familia_fam_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_ficha_diaria_fd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_genero_gen_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_grupo_grp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_login_tl_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_monitoramento_mnt_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_municipio_tmun_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_ordem_ord_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_perfil_tp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pescador_has_tt_dependente_tptd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pescador_tp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pesqueiro_af_paf_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_porteembarcacao_tpe_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_porto_pto_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_programasocial_prs_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_renda_ren_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_situacao_ts_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_subamostra_sa_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_telefonecontato_ttcont_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tempo_tmp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipocapturada_itc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipodependente_ttd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipoembarcacao_tte_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tiporenda_ttr_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipotel_ttel_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_usuario_tu_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_vento_vnt_id_seq', 11000, true);



CREATE OR REPLACE FUNCTION IMPORT_PESCADOR( ) RETURNS INT4 AS $$
DECLARE R RECORD;
DECLARE RET INT4;
BEGIN
FOR R IN SELECT 
CODIGO, NOME, SEXO, MATRICULA, APELIDO,
PAI, MAE, CTPS, PIS, INSS,
CEI, RG, RGP, CIR, CPF, DT_NASC,
NATURALIDADE, ESPECIFICIDADE, ESCOLARIDADE, DATA_INSC, RESPONSAVEL_LANCAMENTO,
RESPONSAVEL_CADASTRAMENTO, DATA_CADASTRO, P.MUNICIPIO, M.TMUN_ID AS MUN, P.NATURALIDADE, M2.TMUN_ID AS NAT, M2.TMUN_MUNICIPIO, OBS, ESC.ESC_ID AS ESCID, RUA, BAIRRO
FROM ACCESS.PESCADOR AS P
LEFT JOIN T_MUNICIPIO AS M 
ON  P.MUNICIPIO=M.TMUN_MUNICIPIO
LEFT JOIN T_MUNICIPIO AS M2
ON  P.NATURALIDADE=M2.TMUN_MUNICIPIO
LEFT JOIN T_ESCOLARIDADE AS ESC
ON  P.ESCOLARIDADE=ESC.ESC_NIVEL
LOOP
    INSERT INTO T_ENDERECO ( TE_ID, TE_LOGRADOURO,TE_NUMERO,TE_BAIRRO,TE_CEP,TE_COMP,TMUN_ID)
        VALUES (NEXTVAL('T_ENDERECO_TE_ID_SEQ'),R.RUA,NULL,R.BAIRRO,NULL,NULL,R.MUN);
    
    INSERT INTO  T_PESCADOR (TP_ID,TP_NOME,TP_SEXO,TP_MATRICULA,TP_APELIDO,
            TP_FILIACAOPAI,TP_FILIACAOMAE,TP_CTPS,TP_PIS,TP_INSS,TP_NIT_CEI,
            TP_RG, TP_CMA,TP_RGB_MAA_IBAMA,TP_CIR_CAP_PORTO,TP_CPF,
            TP_DATANASC,TMUN_ID_NATURAL,TE_ID,TP_ESPECIFICIDADE,
            ESC_ID,TP_RESP_LAN,TP_RESP_CAD,TP_DTA_CAD,TP_OBS)
        VALUES (R.CODIGO,left(R.NOME,60),left(R.SEXO,1),R.MATRICULA,R.APELIDO,
            left(R.PAI,60), left(R.MAE,60),R.CTPS,R.PIS,R.INSS,R.CEI,
            R.RG,NULL,R.RGP,R.CIR,R.CPF,
            TO_DATE(R.DT_NASC, 'DD/MM/YYYY'),R.NAT,CURRVAL('T_ENDERECO_TE_ID_SEQ'),R.ESPECIFICIDADE,
            R.ESCID,to_number(R.RESPONSAVEL_LANCAMENTO,'999'),to_number(R.RESPONSAVEL_CADASTRAMENTO,'999'),TO_DATE(R.DATA_CADASTRO, 'DD/MM/YYYY'),R.OBS);
END LOOP;
RETURN RET;
END;
$$ LANGUAGE PLPGSQL;

select codigo, nome, sexo, matricula, apelido, pai,mae,ctps,pis,inss,cei,rg, rgp,cir,cpf,dt_nasc,naturalidade, 
especificidade, escolaridade, data_insc, responsavel_lancamento,responsavel_cadastramento,data_cadastro, p.municipio,
 m.tmun_id, p.naturalidade, m2.tmun_id, m2.tmun_municipio, esc.esc_id
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio
left join t_escolaridade as esc
on  p.escolaridade=esc.esc_nivel;


select codigo, p.municipio, m.tmun_id, p.naturalidade, m2.tmun_id, m2.tmun_municipio as nat, p.escolaridade, esc.esc_nivel, esc.esc_id
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio
left join t_escolaridade as esc
on  p.escolaridade=esc.esc_nivel;

SELECT pg_catalog.setval(' t_endereco_te_id_seq', 11000, true);

select codigo, m.tmun_id, p.municipio,  m2.tmun_id, p.naturalidade
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio;

update access.pescador set municipio='Uruçuca' where municipio like 'Serra Grande%' or municipio like 'Serra Grsande-Uruçuca%';
update access.pescador set municipio='Ilhéus' where municipio like 'ILHÉUS%' or municipio like 'Ilhéusx%';


update access.pescador set naturalidade='Una' where naturalidade like 'Uma%' ;
update access.pescador set naturalidade='Itabuna' where naturalidade like 'ITABUNA%' ;
update access.pescador set naturalidade='Ituberá' where naturalidade like 'ITUBERÁ%' ;
update access.pescador set naturalidade='Camamu' where naturalidade like 'CAMAMU%' or naturalidade like 'Camacau%'or naturalidade like 'Camumu%';
update access.pescador set naturalidade='Iramaia' where naturalidade like 'IRAMAIA/BA%' ;
update access.pescador set naturalidade='Maraú' where naturalidade like 'MARAÚ%' ;
update access.pescador set naturalidade='Jaquacuara' where naturalidade like 'JAQUACUARA%' ;
update access.pescador set naturalidade='Conceição Do Almeida' where naturalidade like 'Conceição do Almeida%' ;
update access.pescador set naturalidade='Vitorino Freire' where naturalidade like 'VITORINO FREIRE%' ;
update access.pescador set naturalidade='São José Dos Campos' where naturalidade like 'São José dos Campos%' ;
update access.pescador set naturalidade='Neopolis' where naturalidade like 'Neopolis%';
update access.pescador set naturalidade='Canavieiras' where naturalidade like 'Canavieras%' ;
update access.pescador set naturalidade='Catú' where naturalidade like 'Cairu%' ;
update access.pescador set naturalidade='Piacabucu' where naturalidade like 'PIAÇABUÇU%' ;
update access.pescador set naturalidade='Itacaré' where naturalidade like 'ITACARÉ%' ;
update access.pescador set naturalidade='Duque De Caxias' where naturalidade like 'Duque de Caxias%' ;
update access.pescador set naturalidade='Macambira' where naturalidade like 'Macambira%' ;
update access.pescador set naturalidade='Itaju Da Colônia' where naturalidade like 'Itaju da Colônia%' ;
update access.pescador set naturalidade='Uruçuca' where naturalidade like 'URUÇUCA%'or naturalidade like 'uruçuca%';
update access.pescador set naturalidade='Ilhéus' where naturalidade like 'ILHÉUS%'or naturalidade like 'ilhéus%';
update access.pescador set naturalidade='Osasco' where naturalidade like 'Osasco%';
update access.pescador set naturalidade='Caravelas' where naturalidade like 'Caravelas%';

update access.pescador set naturalidade='' where naturalidade like '%' or naturalidade like '%';


select codigo, m.tmun_id, p.municipio
from access.pescador as p, t_municipio as m 
where
p.municipio=m.tmun_municipio;

select codigo, m2.tmun_id, p.naturalidade
from access.pescador as p, t_municipio as m2
where
p.naturalidade=m2.tmun_municipio;


insert into t_escolaridade values (0, 'Não Declarado');
insert into t_renda (ren_id, ren_renda) values (0, 'Não Declarado');

insert into t_pescador_has_telefone (tpt_tp_id, tpt_ttel_id, tpt_telefone )
select codigo, '2', cel from access.pescador where cel notnull order by codigo;

insert into t_pescador_has_telefone (tpt_tp_id, tpt_ttel_id, tpt_telefone )
select codigo, '1', tel from access.pescador where tel notnull order by codigo;

select codigo, area_pesca from access.pescador where area_pesca notnull order by codigo;

select codigo, area_pesca from access.pescador where area_pesca='';
update access.pescador set area_pesca=NULL where area_pesca='';
select * from t_areapesca;


SELECT pesc.codigo, pesc.area_pesca, area.tareap_id, area.tareap_areapesca
FROM access.pescador As pesc 
    INNER JOIN t_areapesca AS area ON(';' || pesc.area_pesca || ';' LIKE '%;' || area.tareap_areapesca || ';%')
ORDER BY pesc.codigo, area.tareap_id, area.tareap_areapesca;

insert into t_pescador_has_t_areapesca ( tp_id, tareap_id)
SELECT pesc.codigo, area.tareap_id
FROM access.pescador As pesc 
    INNER JOIN t_areapesca AS area ON(';' || pesc.area_pesca || ';' LIKE '%;' || area.tareap_areapesca || ';%')
ORDER BY pesc.codigo, area.tareap_id, area.tareap_areapesca;


select * from t_artepesca;

insert into T_PESCADOR_HAS_T_ARTEPESCA (TP_ID, TAP_ID)
SELECT pesc.codigo, arte.tap_id 
FROM access.pescador As pesc 
    INNER JOIN t_artepesca AS arte ON(';' || pesc.arte_pesca || ';' LIKE '%;' || arte.tap_artepesca || ';%')
ORDER BY pesc.codigo, arte.tap_id, arte.tap_artepesca;




insert into T_PESCADOR_HAS_T_TIPOCAPTURADA (TP_ID, ITC_ID)
SELECT pesc.codigo, tipo.itc_id
FROM access.pescador As pesc 
    INNER JOIN t_tipocapturada AS tipo ON(';' || pesc.sp_capt || ';' LIKE '%;' || tipo.itc_tipo || ';%')
ORDER BY pesc.codigo, tipo.itc_id, tipo.itc_tipo;


select * from T_PESCADOR_HAS_T_EMBARCACAO

insert into T_PESCADOR_HAS_T_EMBARCACAO (tp_id, tte_id, tpe_id, tpte_motor, tpte_dono)
SELECT pesc.codigo, tipo.tte_id, porte.tpe_id, case pesc.motor_embarc when 1 then true else false end, pesc.prop_embarc
FROM access.pescador As pesc 
    INNER JOIN t_tipoembarcacao AS tipo ON(';' || pesc.tipo_embarc || ';' LIKE '%;' || tipo.tte_tipoembarcacao || ';%')
    left join T_PORTEEMBARCACAO as porte on  pesc.tam_ambarc=porte.tpe_porte
ORDER BY pesc.codigo, tipo.tte_id, tipo.tte_tipoembarcacao; 



select count(*), colonia from access.pescador group by colonia;
update access.pescador set colonia='A-87' where colonia like 'Associação de São Miguel (A-87)%' ;

insert into t_pescador_has_t_colonia (tp_id, tc_id, tptc_datainsccolonia)
select p.codigo, col.tc_id, TO_DATE(p.data_insc, 'DD/MM/YYYY')
from access.pescador as p
inner join t_colonia as col on p.colonia=col.tc_nome;




-- tipo-renda
select count(*), qual from access.pescador group by qual order by qual;
update access.pescador set qual='Agricultor(a)' where qual='AGRICOLA' or qual='Agricultor' or qual='AGRICULTOR' or qual='AGRICULTURA';
update access.pescador set qual='Aposentado(a)' where qual='Aposentado' or qual='aposentado' or qual='Aposentadoria' or qual='APOSENTADORIA';
update access.pescador set qual='Pensionista' where qual like'Pensão%' or qual like'PENSÃO%' or qual='Pensionista' ;
update access.pescador set qual='Artesão' where qual='Artesão' or qual='Artesanato' or qual='artesão' or qual='Atersão';
update access.pescador set qual='Vendedor(a)' where qual like'Vende%';
update access.pescador set qual='Auxiliar de Construção Cívil' where 
qual='Ajudante de pedreiro' or qual='AJUDANTE DE PEDREIRO' or qual='Ajudante de pintor' or qual='Auxiliar de pedreiro' or qual='AUX. CARPINTEIRO' or qual='Servente'or qual='SERVENTE'or qual='servente de pedreiro';
update access.pescador set qual='Aluguel' where qual='' or qual='Aluga uma casa' or qual like'Aluguel%';
update access.pescador set qual='Construção Cívil' where qual='pedreiro' or qual='Pedreiro' or qual='PEDREIRO' or qual='Pintor' or qual='PINTOR' or qual='Carpinteiro'or qual='CARPINTEIRO' or qual='Construção Civil' or qual='MARCENEIRO';
update access.pescador set qual='Trabalhador(a) autônomo(a)/Diarista' 
where qual='Autônoma' or qual='AUTÔNOMA' or qual='AUTÔNOMO' or qual='AUTONÔMO' or qual='Ambulante' or qual='Avulso' or qual='BICOS' or qual='Biscateiro' or qual='diarista' or qual='DIARISTA' or qual='DIARISTA E TRABALHA NA PRAIA' 
or qual='Faxineira' or qual='FAXINEIRA' or qual='Faz bico' or qual='Faz \"bicos\".' or qual='Faz biscate' or qual='Faz faxina e lava roupa pra fora' or qual like'Bic%' or qual='R$ 245' 
or qual='Rende R$ 678,00'or qual='Tira coco pra vender' or qual='200,00' or qual='Ajudante' or qual='or qual='''or qual='SALGADINHOS'or qual='Tem uma horta'or qual='Trabalha com horta' or qual='Atravessador. Trabalho Expresso (Rio Cachoeira)'
or qual='confecciona redes' or qual='fabrica bombas' or qual='ROÇAGEM' or qual='Instalação de Antena';
update access.pescador set qual='Diarista/Faxineiro(a)' where qual='Ás vezes Faxina' or qual='Diarista' or qual='LAVA ROUPA PARA FORA';
update access.pescador set qual='Doméstico(a)/Caseiro(a)' where qual='caseiro' or qual='Caseiro' or qual='DOMÉSTICA' or qual='Doméstica';
update access.pescador set qual='Cabelereiro(a)/Manicure' where qual='CABELEREIRO' or qual='Manicure';
update access.pescador set qual='Vendedor(a)' where qual like'vende%' or  qual like'VENDE%';
update access.pescador set qual='Revendedor(a)' where qual like'REVENDE%';
update access.pescador set qual='Motorista' where qual='Motorista' or qual like'MOTORISTA%';
update access.pescador set qual='Turismo' where qual='GUIA TURÍSTICO' or qual like'TURISMO%';
update access.pescador set qual='Serviço Geral' where qual='SERVIÇO GERAL' or qual='SERVIÇOS GERAIS';
update access.pescador set qual='Sindicato' where qual like 'Sindicato%' ;
update access.pescador set qual='Comercializa Peixes/Frutos do Mar/Mariscos' where qual like 'Comercializa%' or qual like 'COMERCIALIZA%' or qual='venda de pescado';
update access.pescador set qual='Comerciante de Praia' where qual like '%praia%' or qual like '%Praia%';
update access.pescador set qual='Feirante' where qual like '%eirante%' or qual='TRABALHA COM MARISCO NA FEIRA';
update access.pescador set qual='Comerciante' where qual='Bar' or qual='BAR' or qual='Comerciante' or qual='COMERCIANTE'or qual='POSSUI UM BAR'or qual='PROPRIETRIO DE BAR'or qual='Quintadeira'or qual='Tem um bar'or qual='Mercearia';
update access.pescador set qual='Agricultor(a)' where qual='Trabalha na roça' or qual='TRABALHA NA ROÇA' or qual='Trabalha no sítio' or qual='Roça'or qual='ROÇA'or qual='ROÇA PRÓPRIA'or qual='tem uma rocinha';
update access.pescador set qual='Trabalho Assalariado' where qual='ASSALARIADO' or qual like 'Trabalha em um%' or qual like 'Trabalha n%' or qual ='Ass. Porto de Trás';
update access.pescador set qual=NULL where qual='NÃO' or qual='não' or qual='Ilegível no cadastro';
update access.pescador set qual='Estágio/Monitoria' where qual='MONITOR DE PESCA (MPESCA)' or qual='Pesquisador de desembarque pesqueiro' ;
update access.pescador set qual='Peeiro(a)' where qual='Peeiro' or qual='PEEIRO';
update access.pescador set qual='Marisqueira(o)' where qual='MARISCAGEM' or qual='Marisqueira' ;
update access.pescador set qual='Fileta camarão' where qual='Fileta camarão' or qual='FILETA CAMARÃO' or qual LIKE 'Fileta camarão%';
update access.pescador set qual='Servidor(a) Público(a)' where qual='Servidora Pública' or qual='Servidor Público Municipal (R$ 1190,00)'or qual='Funcionária municipal' or qual='Funcionário Público';
update access.pescador set qual='Portuário/Embarcado' where qual='Portuário' or qual='Trabalha embarcado';

CREATE OR REPLACE FUNCTION import_trenda( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT qual from access.pescador where qual notnull group by qual order by qual
LOOP
    INSERT INTO t_tiporenda(ttr_id, ttr_descricao)
        VALUES (nextval('t_tiporenda_ttr_id_seq'::regclass), r.qual);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

SELECT pg_catalog.setval(' t_tiporenda_ttr_id_seq'::regclass, 10, true);

insert into t_pescador_has_t_renda (tp_id, ren_id, ttr_id)
select p.codigo, renda.ren_id, '1'
from access.pescador as p
left join t_renda as renda on p.renda=renda.ren_renda;

insert into t_pescador_has_t_renda (tp_id, ren_id, ttr_id)
select p.codigo, '0', tren.ttr_id
from access.pescador as p
left join t_tiporenda as tren on p.qual=tren.ttr_descricao
where p.qual notnull;





update access.pescador set prog_soc=NULL where prog_soc='Não%';


insert into t_pescador_has_t_programasocial ( tp_id, prs_id)
select p.codigo, ps.prs_id
from access.pescador as p
left join t_programasocial as ps on p.prog_soc=ps.prs_programa
where p.prog_soc notnull;



-- tipo dependente
select ttd_id, ttd_tipodependente from t_tipodependente;

select codigo, dependente from access.pescador;

insert into t_pescador_has_t_tipodependente (tp_id, ttd_id, tptd_quantidade)
SELECT pesc.codigo, dep.ttd_id, cast(pesc.n_dependentes as int8)
FROM access.pescador As pesc 
    INNER JOIN t_tipodependente AS dep ON(';' || pesc.dependente || ';' LIKE '%;' || dep.ttd_tipodependente || ';%')
ORDER BY pesc.codigo, dep.ttd_id, dep.ttd_tipodependente;

select * from t_pescador_has_t_tipodependente order by tp_id, ttd_id;

update t_pescador_has_t_tipodependente set tptd_quantidade=1 where ttd_id=1;

insert into t_comunidade ( tcom_id, tcom_nome) 
select codigo, comunidade from access.comunidade;


select tp_id, tcom_id from t_pescador_has_t_comunidade;

insert into t_pescador_has_t_comunidade (tp_id, tcom_id)
select codigo, cast(comunidade as int8) from access.pescador where comunidade notnull order by codigo;



select codigo, comunidade from access.pescador where comunidade notnull;
select * from t_pescador_has_t_comunidade;

insert into t_pescador_has_t_comunidade (tp_id, tcom_id)
select codigo, cast(comunidade as int8) from access.pescador where comunidade notnull;

insert into T_PESCADOR_HAS_T_PORTO (TP_ID, PTO_ID)
select codigo, cod_pdesemb from access.pescador where cod_pdesemb notnull;

--Avistamento

select count(*), avist from access.entrev_pesca group by avist;

update access.entrev_pesca set avist='Tartaruga' where avist='Tartaruga.' or avist='Tartaruga (grande)' or avist='tartaruga' or avist='Tartaruga grande'
or avist='TARTARUGA' or avist='Tartaruga (cor amarelada)' or avist='tartaruga grande';

update access.entrev_pesca set avist='Tartaruga de Pente' where avist='Tartaruga de Pente.' or avist='tartaruga de pente' or avist='tartaruga pente' 
or avist='tartaruga pente (2 filhotes e 1 adulto)' or avist='Tartaruga de pente' or avist='três tartarugas de pente';

update access.entrev_pesca set avist='Baleia Jubarte' where avist='baleia jubarte' or avist='Balei Jubarte' or avist='baleia jubarte/ cacalote';

update access.entrev_pesca set avist='Baleia' where avist='BALEIA' or avist='baleia';

update access.entrev_pesca set avist='Golfinho' where avist='4 golfinhos' or avist='GOLFINHO' or avist='Golfinhos' or avist='golfinho'
or avist='Golfinho.' or avist='Golfinho - Boto' or avist=' Golfinho - Boto';

update access.entrev_pesca set avist='Tubarão' where avist='tubarão';

update access.entrev_pesca set avist='Boto Cinza' where avist='Boto cinza';

update access.entrev_pesca set avist='Tartaruga;Golfinho' where avist='Golfinho e Tartaruga.' or avist='Tartaruga e Golfinho (boto)'
or avist='Tartaruga e Golfinho.' or avist='Tartaruga e golfinho.' or avist='Tartarua e golfinho' or avist='golfinho e tartarugas'
or avist='Tartarura e golfinho' or avist='artaruga, golfinho' or avist='Tartaruga e Golfinho' or avist='Tartaruga, Golfinho'
or avist='tartarugas e golfinho' or avist='Tartaruga e golfinho' or avist='tartaruga e golfinho' or avist='Tartaruga, golfinho'
or avist=' Tartaruga e Golfinho' or avist='tartaruga, golfinho' or avist='Tartaruga e  Golfinho';

update access.entrev_pesca set avist='Tartaruga;Baleia' where avist='Tartaruga e baleia'or avist='Tartaruga e Baleia';

update access.entrev_pesca set avist='Golfinho;Baleia' where avist='baleia e golfinho'or avist='Baleia e Golfinho'or avist='golfinho e baleia'
or avist='Golfinho e Baleia';

update access.entrev_pesca set avist='Golfinho;Baleia Jubarte' where avist='Golfinho e Baleia Jubarte';

update access.entrev_pesca set avist='Golfinho;Tartaruga de Pente' where avist='tartaruga pente e golfinho';

update access.entrev_pesca set avist='Tartaruga;Golfinho;Baleia Cachalote' where avist='tartaruga, golfinho, baleia cachalote';

update access.entrev_pesca set avist='Tartaruga;Golfinho;Baleia' where avist='Tartaruga, golfinho e baleia';

update access.entrev_pesca set avist='Golfinho;Baleia Jubarte' where avist='Golfinho e Baleia Jubarte' or avist='Golfinho e Baleia Jubarte';

update access.entrev_pesca set avist='Golfinho;Baleia' where avist='Golfinho e Baleia' or avist='Golfinho e Baleia';

update access.entrev_pesca set avist='Tartaruga;Baleia Jubarte' where avist='Tartaruga e Baleia Jubarte' or avist='Tartaruga e Baleia (Jubarte)';

update access.entrev_pesca set avist='Boto Preto' where avist='8 individuos de boto preto';

update access.entrev_pesca set avist='Tartaruga de Pente;Baleia Jubarte' where avist='Jubart, tartaruga de pente';

update access.entrev_pesca set avist='Golfinho Nariz de Garrafa' where avist='Golfinho nariz de garrafa';

update access.entrev_pesca set avist='Tartaruga do Casco Mole' where avist='Tartaruga do casco mole';

update access.entrev_pesca set avist='Tartaruga - Ninho' where avist='Ninho de tartaruga';

update access.entrev_pesca set avist='Tartaruga - Morta' where avist='Tartaruga (morta)';

update access.entrev_pesca set avist='Baleia Jubarte - Morta' where avist='Jubarte morta em Barra Grande';

update access.entrev_pesca set avist='Peixe Lua;Baleia Jubarte' where avist='Peixe lua, Baleia Jubarte';

update access.entrev_pesca set avist='Peixe Lua;Baleia Jubarte' where avist='Peixe lua, Baleia Jubarte';

update access.entrev_pesca set avist=NULL where avist='';


select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='Uma rede de mais de 1000 metros com peixes mortos.';
update access.entrev_pesca set obs=avist where cod_fichadiaria=2440;
update access.entrev_pesca set avist='' where cod_fichadiaria=2440;

select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='Também utilizou rede de emalhar';
update access.entrev_pesca set obs=avist where cod_fichadiaria=494;
update access.entrev_pesca set avist='' where cod_fichadiaria=494;

select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='atravessadores' or avist='Atravessadores' or avist='Atravessador';
update access.entrev_pesca set obs=avist where cod_fichadiaria=1768;
update access.entrev_pesca set avist='' where cod_fichadiaria=1768;

update access.entrev_pesca set obs=avist where cod_fichadiaria=1155;
update access.entrev_pesca set avist='' where cod_fichadiaria=1155;

update access.entrev_pesca set obs=avist where cod_fichadiaria=1550;
update access.entrev_pesca set avist='' where cod_fichadiaria=1550;

select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='Sem captura';
update access.entrev_pesca set obs=avist where cod_fichadiaria=1061;
update access.entrev_pesca set avist='' where cod_fichadiaria=1061;

select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='Vender na banca mais próxima';
update access.entrev_pesca set obs=avist where cod_fichadiaria=582;
update access.entrev_pesca set avist='' where cod_fichadiaria=582;

select cod_fichadiaria, avist, obs from access.entrev_pesca where avist='Entrega na peixaria';
update access.entrev_pesca set obs=avist where cod_fichadiaria=1462;
update access.entrev_pesca set avist='' where cod_fichadiaria=1462;

CREATE TABLE T_AVISTAMENTO (
TA_ID SERIAL,
TA_DESCRICAO VARCHAR(50) NOT NULL,
CONSTRAINT T_TAVISTAMENTO_TA_ID_PKEY PRIMARY KEY (TA_ID)
);

INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 1, 'Baleia');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 2, 'Baleia Jubarte');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 3, 'Baleia Jubarte - Morta');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 4, 'Baleia Cachalote');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 5, 'Bijupirá 50kg');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 6, 'Boto');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 7, 'Boto Cinza');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 8, 'Boto Preto');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 9, 'Cardume de Tuninha');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 10, 'Golfinho');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 11, 'Golfinho Nariz de Garrafa');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 12, 'Lontras');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 13, 'Peixe Lua');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 14, 'Tartaruga');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 15, 'Tartaruga de Pente');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 16, 'Tartaruga do Casco Mole');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 17, 'Tartaruga - Morta');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 18, 'Tartaruga - Ninho');
INSERT INTO T_AVISTAMENTO (TA_ID, TA_DESCRICAO) VALUES ( 19, 'Tubarão');

CREATE TABLE T_ENTREVISTA_HAS_T_AVISTAMENTO (
TE_ID INTEGER,
FD_ID INTEGER, 
TA_ID INTEGER, 
CONSTRAINT T_T_ENTREVISTA_HAS_T_AVISTAMENTO_PKEY PRIMARY KEY (TE_ID,  FD_ID,  TA_ID)
);



INSERT INTO T_ENTREVISTA_HAS_T_AVISTAMENTO (TE_ID,  FD_ID,  TA_ID)
SELECT PESC.CODIGO, PESC.COD_FICHADIARIA, AV.TA_ID
FROM ACCESS.ENTREV_PESCA AS PESC 
    INNER JOIN T_AVISTAMENTO AS AV ON(';' || PESC.AVIST || ';' LIKE '%;' || AV.TA_DESCRICAO || ';%')
ORDER BY PESC.COD_FICHADIARIA, AV.TA_ID, AV.TA_DESCRICAO;



select count(*), arte from access.entrev_pesca group by arte;
select * from t_artepesca;
update access.entrev_pesca set arte='15' where arte='Mariscagem' or arte='MARISCAGEM';
update access.entrev_pesca set arte='5' where arte='REDE';
update access.entrev_pesca set arte='4' where arte='Pesca DE LINHA' or arte='PESCA DE LINHA';
update access.entrev_pesca set arte='1' where arte='ARRASTO DE FUNDO';



insert into t_tipoembarcacao(tte_id,tte_tipoembarcacao) values(0,'Sem Embarcação');

select count(*), tp_barco from access.entrev_pesca group by tp_barco;
update access.entrev_pesca set tp_barco='3' where tp_barco='Canoa';
update access.entrev_pesca set tp_barco='4' where tp_barco='Jangada';
update access.entrev_pesca set tp_barco='6' where tp_barco='Batera';
update access.entrev_pesca set tp_barco='0' where tp_barco='Sem barco' or tp_barco='sem barco';
update access.entrev_pesca set tp_barco='1;Motor1' where tp_barco='Barco a motor';



select count(*), tp_pesca from access.entrev_pesca group by tp_pesca;
select * from t_artepesca;
update access.entrev_pesca set tp_pesca='4' where tp_pesca='Linha de mão';
update access.entrev_pesca set tp_pesca='3' where tp_pesca='Grosseira';

select count(*), tp_rede from access.entrev_pesca group by tp_rede;
select * from t_artepesca;
update access.entrev_pesca set tp_rede='2' where tp_rede='Calão';
update access.entrev_pesca set tp_rede='5' where tp_rede='Emalhe' or tp_rede='3 malhos';
update access.entrev_pesca set tp_rede='7' where tp_rede='Tarrafa';
update access.entrev_pesca set tp_rede='5' where tp_rede='6';

-- Precisa terminar
select count(*), mare from access.entrev_pesca group by mare;
update access.entrev_pesca set mare='Viva' where mare='viva';
update access.entrev_pesca set mare='Morta' where mare='morta';

-- Precisa terminar
select count(*), tipomariscagem from access.entrev_pesca group by tipomariscagem;
update access.entrev_pesca set tipomariscagem='11' where tipomariscagem='Manzuá';
update access.entrev_pesca set tipomariscagem='5' where tipomariscagem='Emalhe' or tipomariscagem='3 malhos';


select count(*), tempo from access.ficha_diaria group by tempo;
update access.ficha_diaria set tempo='1' where tempo='chuva' or tempo='Chuva';
update access.ficha_diaria set tempo='2' where tempo='Nublado';
update access.ficha_diaria set tempo='3' where tempo='Sol' or tempo='SOL' or tempo='sol';

select count(*), vento from access.ficha_diaria group by vento;
update access.ficha_diaria set vento='1' where vento='Forte';
update access.ficha_diaria set vento='2' where vento='Fraco';
update access.ficha_diaria set vento='3' where vento='Moderado';

CREATE TABLE IF NOT EXISTS t_turno (
TURNO_ID VARCHAR NOT NULL,
TURNO_NOME VARCHAR(30) NOT NULL,
PRIMARY KEY (TURNO_ID)
);

insert into t_turno(TURNO_ID, TURNO_NOME) values ('M','Matutino');
insert into t_turno(TURNO_ID, TURNO_NOME) values ('V','Vespertino');
insert into t_turno(TURNO_ID, TURNO_NOME) values ('N','Noturno');
insert into t_turno(TURNO_ID, TURNO_NOME) values ('I','Integral');

-- Precisa terminar
update access.ficha_diaria set turno='1' where turno='Forte';
update access.ficha_diaria set turno='2' where turno='Fraco';
update access.ficha_diaria set turno='3' where turno='Moderado';