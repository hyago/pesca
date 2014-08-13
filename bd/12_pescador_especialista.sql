
Drop table if exists t_estado_civil Cascade;
Drop table if exists t_origem Cascade;
Drop table if exists t_residencia Cascade;
Drop table if exists t_possui_em_casa Cascade;
Drop table if exists t_estrutura_residencial Cascade;
Drop table if exists t_seguro_defeso Cascade;
Drop table if exists t_no_seguro Cascade;
Drop table if exists t_motivo_pesca Cascade;
Drop table if exists t_tipo_transporte Cascade;
Drop table if exists t_horario_pesca Cascade;
Drop table if exists t_frequencia_pesca Cascade;
Drop table if exists t_ultima_pesca Cascade;
Drop table if exists t_fornecedor_insumos Cascade;
Drop table if exists t_sobra_pesca Cascade;
Drop table if exists t_rgp_orgao Cascade;
Drop table if exists t_dificuldade Cascade;
Drop table if exists t_estacao_ano Cascade;
Drop table if exists t_associacao_pesca Cascade;
Drop table if exists t_acompanhado Cascade;
Drop table if exists t_insumo Cascade;
Drop table if exists t_recurso Cascade;

DROP VIEW  if exists v_pescador_especialista_has_t_acompanhado;
DROP VIEW  if exists v_pescador_especialista_has_t_companhia;
DROP VIEW  if exists v_pescador_especialista_has_t_estrutura_residencial;
DROP VIEW  if exists v_pescador_especialista_has_t_horario_pesca;
DROP VIEW  if exists v_pescador_especialista_has_t_insumo;
DROP VIEW  if exists v_pescador_especialista_has_t_motivo_pesca;
DROP VIEW  if exists v_pescador_especialista_has_t_no_seguro;
DROP VIEW  if exists v_pescador_especialista_has_t_parentes;
DROP VIEW  if exists v_pescador_especialista_has_t_programa_social;
DROP VIEW  if exists v_pescador_especialista_has_t_seguro_defeso;
DROP VIEW  if exists v_pescador_especialista_has_t_tipo_transporte;


Drop table if exists t_pescador_especialista_has_t_estrutura_residencial;
Drop table if exists t_pescador_especialista_has_t_programa_social;
Drop table if exists t_pescador_especialista_has_t_seguro_defeso;
Drop table if exists t_pescador_especialista_has_t_no_seguro; 
Drop table if exists t_pescador_especialista_has_t_motivo_pesca; 
Drop table if exists t_pescador_especialista_has_t_tipo_transporte;
Drop table if exists t_pescador_especialista_has_t_acompanhado;
Drop table if exists t_pescador_especialista_has_t_companhia;
Drop table if exists t_pescador_especialista_has_t_parentes;
Drop table if exists t_pescador_especialista_has_t_horario_pesca;
Drop table if exists t_pescador_especialista_has_t_insumo;
Drop table if exists t_pescador_especialista;


Create Table t_estado_civil(
    tec_id serial,
    tec_estado Varchar(30),
    Primary Key (tec_id)
);

Create Table t_origem(
    to_id serial,
    to_origem Varchar(45),
    Primary Key (to_id)
);

Create Table t_residencia(
    tre_id serial,
    tre_residencia Varchar(50),
    Primary Key (tre_id)

);

Create Table t_estrutura_residencial(
    terd_id serial,
    terd_estrutura Varchar(50),
    Primary Key (terd_id)

);

Create Table t_seguro_defeso(
    tsd_id serial,
    tsd_seguro Varchar(45),
    Primary Key (tsd_id)

);

Create Table t_no_seguro(
    tns_id serial,
    tns_situacao Varchar(45),
    Primary Key (tns_id)

);

Create Table t_motivo_pesca(
    tmp_id serial,
    tmp_motivo Varchar(100),
    Primary Key (tmp_id)

);

Create Table t_tipo_transporte(
    ttr_id serial,
    ttr_transporte Varchar(100),
    Primary Key (ttr_id)

);

Create Table t_horario_pesca(
    thp_id serial,
    thp_horario Varchar(50),
    Primary Key (thp_id)

);


Create Table t_frequencia_pesca(
    tfp_id serial,
    tfp_frequencia Varchar(50),
    Primary Key (tfp_id)

);

Create Table t_ultima_pesca(
    tup_id serial,
    tup_pesca Varchar(50),
    Primary Key (tup_id)

);

Create Table t_fornecedor_insumos(
    tfi_id serial,
    tfi_fornecedor Varchar(50),
    Primary Key (tfi_id)

);

Create Table t_sobra_pesca(
    tsp_id serial,
    tsp_sobra Varchar(100),
    Primary Key (tsp_id)

);

Create Table t_rgp_orgao(
    trgp_id serial,
    trgp_emissor Varchar(30),
    Primary Key (trgp_id)
);

Create Table t_dificuldade(
    tdif_id serial,
    tdif_dificuldade Varchar(100),
    Primary Key (tdif_id)
);

Create Table t_estacao_ano(
    tea_id serial,
    tea_estacao Varchar(20),
    Primary Key (tea_id)
);

Create Table t_local_tratamento(
    tlt_id serial,
    tlt_local Varchar(100),
    Primary Key (tlt_id)
);

Create Table t_associacao_pesca(
    tasp_id serial,
    tasp_associacao Varchar(100),
    Primary Key (tasp_id)
);


Create Table t_acompanhado(
    tacp_id serial,
    tacp_companhia Varchar(100),
    Primary Key (tacp_id)
);

Create Table t_insumo(
    tin_id serial,
    tin_insumo Varchar(50),
    Primary Key (tin_id)
);
    

Create Table t_recurso(
    trec_id serial,
    trec_recurso Varchar(50),
    Primary Key (trec_id)
);
-- IMPORTAR ATÉ AQUI -----------------------------
 Create Table if not exists t_pescador_especialista(
     tp_id int unique,
     tp_resp_cad int,
     pto_id int,
 tps_data_nasc Date,
 tps_idade int,
     tec_id int, 
 tps_filhos int,
 tps_tempo_residencia float,
      to_id int,
      tre_id int,
 tps_pessoas_na_casa int,
 tps_tempo_sustento float,
 tps_renda_menor_ano float,
     tea_id_menor int,
 tps_renda_maior_ano float,
     tea_id_maior int,
 tps_renda_no_defeso float,
 tps_tempo_de_pesca float,
     ttd_id_tutor_pesca int,
     ttr_id_antes_pesca int,
 tps_mora_onde_pesca int,
 tps_embarcado int,
 tps_num_familiar_pescador int,
     tfp_id int,
 tps_num_dias_pescando int,
 tps_hora_pescando float,
      tup_id int,
      tfi_id int,
      trec_id int,
      dp_id_pescado int,
      tfp_id_consumo int,
      dp_id_comprador int,
      tsp_id int,
      tlt_id int,
 tps_unidade_beneficiamento Varchar(50),
 tps_curso_beneficiamento Varchar(100),
      tasp_id int,
      tc_id int,
 tps_tempo_em_colonia float,
 tps_motivo_falta_pagamento Varchar(50),
 tps_beneficio_colonia Varchar(50),
      trgp_id int,
      tdif_id_area int,
      ttr_id_outra_habilidade int,
      ttr_id_alternativa_renda int,
      ttr_id_outra_profissao int,
 tps_filho_seguir_profissao Varchar(100),
 tps_grau_dependencia_pesca float,
      tu_id_entrevistador int,
 tps_data date,
 Primary Key (tp_id),
 Foreign Key (pto_id) References t_porto,
 Foreign Key (tec_id) References t_estado_civil,
 Foreign Key (to_id) References t_origem,
 Foreign Key (tre_id) References t_residencia,
 Foreign Key (tea_id_maior) References t_estacao_ano,
 Foreign Key (tea_id_menor) References t_estacao_ano,
 Foreign Key (ttd_id_tutor_pesca) References t_tipodependente,
 Foreign Key (ttr_id_antes_pesca) References t_tiporenda,
 Foreign Key (tfp_id) References t_frequencia_pesca,
 Foreign Key (tup_id) References t_ultima_pesca,
 Foreign Key (tfi_id) References t_fornecedor_insumos,
 Foreign Key (trec_id) References t_recurso,
 Foreign Key (dp_id_pescado) References t_destinopescado,
 Foreign Key (tfp_id_consumo) References t_frequencia_pesca,
 Foreign Key (dp_id_comprador) References t_destinopescado,
 Foreign Key (tsp_id) References t_sobra_pesca,
 Foreign Key (tlt_id) References t_local_tratamento,
 Foreign Key (tc_id) References t_colonia,
 Foreign Key (tasp_id) References t_associacao_pesca,
 Foreign Key (trgp_id) References t_rgp_orgao,
 Foreign Key (tdif_id_area) References t_dificuldade,
 Foreign Key (ttr_id_outra_profissao) References t_tiporenda,
 Foreign Key (ttr_id_outra_habilidade) References t_tiporenda,
 Foreign Key (ttr_id_alternativa_renda) References t_tiporenda,
 Foreign Key (tp_id) References t_pescador,
 Foreign Key (tp_resp_cad) References t_usuario,
 Foreign Key (tu_id_entrevistador) References t_usuario
 );
 Alter table t_pescador_especialista ADD CONSTRAINT tp_id_unique UNIQUE (tp_id);
 Alter Table t_pescador Add column tp_especialidade timestamp without time zone;


 Create Table t_pescador_especialista_has_t_estrutura_residencial(
     tpsterd_id serial,
     tps_id int,
     terd_id int,
     Primary Key (tpsterd_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (terd_id) References t_estrutura_residencial
 );
 
 Create Table t_pescador_especialista_has_t_programa_social(
     tps_id int,
     prs_id int,
     Primary Key (tps_id, prs_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (prs_id) References t_programasocial
 );
 
 Create Table t_pescador_especialista_has_t_seguro_defeso(
     tpstsd_id serial,
     tps_id int,
     tsd_id int,
     Primary Key (tpstsd_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (tsd_id) References t_seguro_defeso
 );
 
 Create Table t_pescador_especialista_has_t_no_seguro(
     ttr_id int,
     tps_id int,
     Primary Key (ttr_id, tps_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (ttr_id) References t_tiporenda
 );
 
 Create Table t_pescador_especialista_has_t_motivo_pesca(
     tps_id int,
     tmp_id int,
     Primary Key (tps_id, tmp_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (tmp_id) References t_motivo_pesca
 );
 
 Create Table t_pescador_especialista_has_t_tipo_transporte(
     tps_id int,
     ttr_id int,
     Primary Key (tps_id, ttr_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (ttr_id) References t_tipo_transporte
 );
 
 Create Table t_pescador_especialista_has_t_acompanhado(
     tpstacp_id serial,
     tps_id int,
     tacp_id int,
     tpstacp_quantidade int,
     Primary Key (tpstacp_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (tacp_id) References t_acompanhado
 );

 Drop table if exists t_pescador_especialista_has_t_companhia;
 Create Table t_pescador_especialista_has_t_companhia(
     tpstcp_id serial,
     tps_id int,
     tpstcp_quantidade int,
     ttd_id int, -- t_tipodependente
     Primary Key (tpstcp_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (ttd_id) References t_tipodependente
 );
 
 Create Table t_pescador_especialista_has_t_parentes (
     tpsttd_id serial, 
     tps_id int,
     ttd_id_parente int, -- t_tipodependente
     Primary Key (tpsttd_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (ttd_id_parente) References t_tipodependente
     
 );
 
 Create Table t_pescador_especialista_has_t_horario_pesca(
     tps_id int,
     thp_id int,
     Primary Key (tps_id, thp_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (thp_id) References t_horario_pesca
 );
 
 Create Table t_pescador_especialista_has_t_insumo(
   tpstin_id serial,
   tps_id int,
   tin_id int,
   tin_valor_insumo float,
     Primary Key (tpstin_id),
     Foreign Key (tps_id) References t_pescador_especialista,
     Foreign Key (tin_id) References t_insumo
 );


CREATE OR REPLACE VIEW v_pescador_especialista_has_t_estrutura_residencial AS 
 SELECT hasestr.tps_id, hasestr.terd_id, estrutura.terd_estrutura
   FROM t_pescador_especialista_has_t_estrutura_residencial as hasestr, t_estrutura_residencial as estrutura
  WHERE hasestr.terd_id = estrutura.terd_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_programa_social AS 
 SELECT hasprogsocial.tps_id, hasprogsocial.prs_id, social.prs_programa
   FROM t_pescador_especialista_has_t_programa_social as hasprogsocial, t_programasocial as social
  WHERE hasprogsocial.prs_id = social.prs_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_seguro_defeso AS 
 SELECT hassegdefeso.tps_id, hassegdefeso.tsd_id, segdefeso.tsd_seguro
   FROM t_pescador_especialista_has_t_seguro_defeso as hassegdefeso, t_seguro_defeso as segdefeso
  WHERE hassegdefeso.tsd_id = segdefeso.tsd_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_no_seguro AS 
 SELECT hastiporenda.tps_id, hastiporenda.ttr_id, tiporenda.ttr_descricao
   FROM t_pescador_especialista_has_t_no_seguro as hastiporenda, t_tiporenda as tiporenda
  WHERE hastiporenda.ttr_id = tiporenda.ttr_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_motivo_pesca AS 
 SELECT hasmotivopesca.tps_id, hasmotivopesca.tmp_id, motivopesca.tmp_motivo
   FROM t_pescador_especialista_has_t_motivo_pesca as hasmotivopesca, t_motivo_pesca as motivopesca
  WHERE hasmotivopesca.tmp_id = motivopesca.tmp_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_tipo_transporte AS 
 SELECT hastransporte.tps_id, hastransporte.ttr_id, transporte.ttr_transporte
   FROM t_pescador_especialista_has_t_tipo_transporte as hastransporte, t_tipo_transporte as transporte
  WHERE hastransporte.ttr_id = transporte.ttr_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_acompanhado AS 
 SELECT hasacompanhado.tps_id, hasacompanhado.tacp_id, hasacompanhado.tpstacp_quantidade, acompanhado.tacp_companhia
   FROM t_pescador_especialista_has_t_acompanhado as hasacompanhado, t_acompanhado as acompanhado
  WHERE hasacompanhado.tacp_id = acompanhado.tacp_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_companhia AS 
 SELECT hascompanhia.tps_id, hascompanhia.ttd_id, hascompanhia.tpstcp_quantidade, companhia.ttd_tipodependente
   FROM t_pescador_especialista_has_t_companhia as hascompanhia, t_tipodependente as companhia
  WHERE hascompanhia.ttd_id = companhia.ttd_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_parentes AS 
 SELECT hasparentes.tps_id, hasparentes.ttd_id_parente, parentes.ttd_tipodependente
   FROM t_pescador_especialista_has_t_parentes as hasparentes, t_tipodependente as parentes
  WHERE hasparentes.ttd_id_parente = parentes.ttd_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_horario_pesca AS 
 SELECT hashorariopesca.tps_id, hashorariopesca.thp_id, horariopesca.thp_horario
   FROM t_pescador_especialista_has_t_horario_pesca as hashorariopesca, t_horario_pesca as horariopesca
  WHERE hashorariopesca.thp_id = horariopesca.thp_id;

CREATE OR REPLACE VIEW v_pescador_especialista_has_t_insumo AS 
 SELECT hasinsumo.tps_id, hasinsumo.tin_id, insumo.tin_insumo, hasinsumo.tin_valor_insumo
   FROM t_pescador_especialista_has_t_insumo as hasinsumo, t_insumo as insumo
  WHERE hasinsumo.tin_id = insumo.tin_id;


