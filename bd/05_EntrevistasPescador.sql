Drop view v_arrasto;
Drop view v_varapesca;
Drop view v_tarrafa;
Drop view v_siripoia;
Drop view v_ratoeira;
Drop view v_mergulho;
Drop view v_manzua;
Drop view v_linhafundo;
Drop view v_linha;
Drop view v_jerere;
Drop view v_grosseira;
Drop view v_coletamanual;
Drop view v_emalhe;
Drop view v_calao;

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

CREATE TABLE t_avistamento
(
  avs_id serial NOT NULL,
  avs_descricao character varying(50) NOT NULL,
  CONSTRAINT t_avistamento_pkey PRIMARY KEY (avs_id)
)


-- Table: t_mare



CREATE TABLE t_mare
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


CREATE TABLE t_arrastofundo
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

DROP TABLE t_calao;

CREATE TABLE t_calao
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


DROP TABLE t_coletamanual;

CREATE TABLE t_coletamanual
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
  cml_tempoatepesqueiro time without time zone,
  cml_distatepesqueiro double precision,
  cml_mreviva boolean,
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
-- Table: t_coletamanual_has_t_especie_capturada





-- Table: t_emalhe

DROP TABLE t_emalhe;

CREATE TABLE t_emalhe
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

DROP TABLE t_grosseira;

CREATE TABLE t_grosseira
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
  grs_tempoatepesqueiro time without time zone,
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
);
-- Table: t_grosseira_has_t_especie_capturada


-- Table: t_jerere

DROP TABLE t_jerere;

CREATE TABLE t_jerere
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

DROP TABLE t_linha;

CREATE TABLE t_linha
(
  lin_id serial NOT NULL,
  t_embarcada boolean,
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

DROP TABLE t_linhafundo;

CREATE TABLE t_linhafundo
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

CREATE TABLE t_manzua
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


CREATE TABLE t_mergulho
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
  mer_tempoatepesqueiro time without time zone,
  mer_distapesqueiro double precision,
  mer_mreviva boolean,
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


CREATE TABLE t_ratoeira
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


CREATE TABLE t_siripoia
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


CREATE TABLE t_tarrafa
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


CREATE TABLE t_varapesca
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



CREATE TABLE t_arrastofundo_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  af_id integer NOT NULL,
  CONSTRAINT t_arrastofundo_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_arrastofundo1 FOREIGN KEY (af_id)
      REFERENCES t_arrastofundo (af_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_calao_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  cal_id integer NOT NULL,
  CONSTRAINT t_calao_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (cal_id)
      REFERENCES t_calao (cal_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_coletamanual_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  cml_id integer NOT NULL,
  CONSTRAINT t_coletamanual_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_coletamanual1 FOREIGN KEY (cml_id)
      REFERENCES t_coletamanual (cml_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_emalhe_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  em_id integer NOT NULL,
  CONSTRAINT t_emalhe_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_emalhe1 FOREIGN KEY (em_id)
      REFERENCES t_emalhe (em_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_grosseira_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  grs_id integer NOT NULL,
  CONSTRAINT t_grosseira_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_grosseira1 FOREIGN KEY (grs_id)
      REFERENCES t_grosseira (grs_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_jerere_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  jre_id integer NOT NULL,
  CONSTRAINT t_jerere_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_jerere1 FOREIGN KEY (jre_id)
      REFERENCES t_jerere (jre_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_linha_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  lin_id integer NOT NULL,
  CONSTRAINT t_linha_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (lin_id)
      REFERENCES t_linha (lin_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_linhafundo_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  lf_id integer NOT NULL,
  CONSTRAINT t_linhafundo_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_linhafundo1 FOREIGN KEY (lf_id)
      REFERENCES t_linhafundo (lf_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_manzua_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  man_id integer NOT NULL,
  CONSTRAINT t_manzua_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_manzua1 FOREIGN KEY (man_id)
      REFERENCES t_manzua (man_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_mergulho_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  mer_id integer NOT NULL,
  CONSTRAINT t_mergulho_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_mergulho1 FOREIGN KEY (mer_id)
      REFERENCES t_mergulho (mer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_ratoeira_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  rat_id integer NOT NULL,
  CONSTRAINT t_ratoeira_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_ratoeira1 FOREIGN KEY (rat_id)
      REFERENCES t_ratoeira (rat_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_siripoia_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  sir_id integer NOT NULL,
  CONSTRAINT t_siripoia_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_siripoia1 FOREIGN KEY (sir_id)
      REFERENCES t_siripoia (sir_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_tarrafa_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  tar_id integer NOT NULL,
  CONSTRAINT t_tarrafa_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_calao1 FOREIGN KEY (tar_id)
      REFERENCES t_tarrafa (tar_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE t_varapesca_has_t_especie_capturada
(
  spc_id serial NOT NULL,
  
  spc_quantidade integer,
  spc_peso_kg float,
  spc_preco float,
  esp_id integer NOT NULL,
  vp_id integer NOT NULL,
  CONSTRAINT t_varapesca_has_t_especie_capturada_pkey PRIMARY KEY (spc_id),
  CONSTRAINT fk_dsbq_especie_capturada_dsbq_especie1 FOREIGN KEY (esp_id)
      REFERENCES t_especie (esp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_t_especie_capturada_t_varapesca1 FOREIGN KEY (vp_id)
      REFERENCES t_varapesca (vp_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


CREATE TABLE t_arrastofundo_has_t_pesqueiro
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
  t_tempoapesqueiro time without time zone,
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

CREATE TABLE t_linha_has_t_pesqueiro
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
CREATE TABLE t_linhafundo_has_t_pesqueiro
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
CREATE TABLE t_manzua_has_t_pesqueiro
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
CREATE TABLE t_mergulho_has_t_pesqueiro
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
CREATE TABLE t_ratoeira_has_t_pesqueiro
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
CREATE TABLE t_siripoia_has_t_pesqueiro
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
SELECT ENTREVISTA.AF_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_ARRASTOFUNDO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_ARRASTOFUNDO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.AF_ID = ESPCAPT.AF_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_CALAO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.CAL_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_CALAO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_CALAO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.CAL_ID = ESPCAPT.CAL_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_EMALHE_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.EM_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_EMALHE AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_EMALHE_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.EM_ID = ESPCAPT.EM_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_TARRAFA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.TAR_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_TARRAFA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_TARRAFA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.TAR_ID = ESPCAPT.TAR_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_LINHA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.LIN_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_LINHA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_LINHA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.LIN_ID = ESPCAPT.LIN_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_GROSSEIRA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.GRS_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_GROSSEIRA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_GROSSEIRA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.GRS_ID = ESPCAPT.GRS_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_MERGULHO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.MER_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_MERGULHO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_MERGULHO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.MER_ID = ESPCAPT.MER_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_COLETAMANUAL_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.CML_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_COLETAMANUAL AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_COLETAMANUAL_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.CML_ID = ESPCAPT.CML_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_VARAPESCA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.VP_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_VARAPESCA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_VARAPESCA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.VP_ID = ESPCAPT.VP_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_LINHAFUNDO_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.LF_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_LINHAFUNDO AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_LINHAFUNDO_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.LF_ID = ESPCAPT.LF_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_JERERE_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.JRE_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_JERERE AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_JERERE_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.JRE_ID = ESPCAPT.JRE_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_SIRIPOIA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.SIR_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_SIRIPOIA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_SIRIPOIA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.SIR_ID = ESPCAPT.SIR_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_MANZUA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.MAN_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_MANZUA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_MANZUA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.MAN_ID = ESPCAPT.MAN_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;

CREATE VIEW V_RATOEIRA_HAS_T_ESPECIE_CAPTURADA AS
SELECT ENTREVISTA.RAT_ID, ESPECIE.ESP_NOME_COMUM, ESPCAPT.SPC_QUANTIDADE, ESPCAPT.SPC_PESO_KG, ESPCAPT.SPC_PRECO
FROM T_RATOEIRA AS ENTREVISTA, T_ESPECIE AS ESPECIE, T_RATOEIRA_HAS_T_ESPECIE_CAPTURADA AS ESPCAPT
WHERE ENTREVISTA.RAT_ID = ESPCAPT.RAT_ID AND ESPECIE.ESP_ID = ESPCAPT.ESP_ID;