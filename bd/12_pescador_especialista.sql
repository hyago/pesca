
Drop table if exists t_estado_civil;
Drop table if exists t_origem;
Drop table if exists t_residencia;
Drop table if exists t_possui_em_casa;
Drop table if exists t_estrutura_residencial;
Drop table if exists t_seguro_defeso;
Drop table if exists t_no_seguro;
Drop table if exists t_motivo_pesca;
Drop table if exists t_tipo_transporte;
Drop table if exists t_horario_pesca;
Drop table if exists t_frequencia_pesca;
Drop table if exists t_ultima_pesca;
Drop table if exists t_fornecedor_insumos;
Drop table if exists t_sobra_pesca;
Drop table if exists t_rgp_orgao;
Drop table if exists t_dificuldade;
Drop table if exists t_estacao_ano;
Drop table if exists t_associacao_pesca;
Drop table if exists t_acompanhado;
Drop table if exists t_insumo;
Drop table if exists t_recurso;
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
    terd_possui Varchar(50),
    Primary Key (tpec_id)

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
--- IMPORTAR ATÉ AQUI -----------------------------
-- Create Table t_pescador_especialista(
-- tps_id serial,
-- tps_nome Varchar(60),
-- tps_apelido Varchar(30),
--     pto_id int,
-- tps_data_nasc Date,
-- tps_idade int,
--     tec_id int, 
-- tps_filhos int,
-- tps_tempo_residencia float,
--      to_id int,
--      tre_id int,
-- tps_pessoas_na_casa int, 
-- tps_tempo_sustento float,
-- tps_renda_menor_ano float,
--     tea_id_menor int,
-- tps_renda_maior_ano float,
--     tea_id_maior int,
-- tps_tempo_em_pesca float,
-- tps_tutor_pesca Varchar(50),
--     ttr_id_antes_pesca int,
-- tps_mora_onde_pesca int,
-- tps_embarcado int,
-- tps_num_dias_pescando int,
-- tps_hora_pescando float,
--      tup_id int,
-- tps_unidade_beneficiamento Varchar(50),
-- tps_curso_beneficiamento Varchar(100),
--      tc_id int,
--      tasp_id int,
-- tps_tempo_em_colonia float,
-- tps_pagamento_colonia int,
-- tps_motivo_falta_pagamento Varchar(50),
-- tps_beneficio_colonia Varchar(50),
-- tps_rgp int,
--      trgp_id int,
-- tps_habilidade_extra Varchar(60),
-- ttr_id_alternativa_renda int,
--      ttr_id_outra_profissao int,
-- tps_filho_seguir_profissao int,
-- tps_motivo_filho_seguir_profissao Varchar(200),
-- tps_grau_dependencia_pesca float,
-- tu_id_entrevistador int,
-- tps_data date,
-- Primary Key (tps_id),
-- Foreign Key (pto_id) References t_porto,
-- Foreign Key (tec_id) References t_estado_civil,
-- Foreign Key (to_id) References t_origem,
-- Foreign Key (tre_id) References t_residencia,
-- Foreign Key (tea_id_maior) References t_estacao_ano,
-- Foreign Key (tea_id_menor) References t_estacao_ano,
-- Foreign Key (ttr_id_antes_pesca) References t_tiporenda,
-- Foreign Key (tup_id) References t_ultima_pesca,
-- Foreign Key (tc_id) References t_colonia,
-- Foreign Key (tasp_id) References t_associacao_pesca,
-- Foreign Key (trgp_id) References t_rgp_orgao,
-- Foreign Key (ttr_id_outra_profissao) References t_tiporenda
-- );
-- 
-- Create Table t_pescador_especialista_has_t_estrutura_residencial(
--     tpsterd_id serial,
--     tps_id int,
--     terd_id int,
--     Primary Key (tpsterd_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (terd_id) References t_estrutura_residencial
-- );
-- 
-- Create Table t_pescador_especialista_has_t_programa_social(
--     tps_id int,
--     prs_id int,
--     Primary Key (tps_id, prs_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (prs_id) References t_programasocial
-- );
-- 
-- Create Table t_pescador_especialista_has_t_seguro_defeso(
--     tpstsd_id serial,
--     tps_id int,
--     tsd_id int,
--     Primary Key (tpstsd_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (tsd_id) References t_seguro_defeso
-- );
-- 
-- Create Table t_pescador_especialista_has_t_no_seguro(
--     tns_id int,
--     tps_id int,
--     tpstns_renda_no_defeso float,
--     Primary Key (tns_id, tps_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (tns_id) References t_no_seguro
-- );
-- 
-- Create Table t_pescador_especialista_has_t_motivo_pesca
--     tps_id int,
--     tmp_id int,
--     Primary Key (tps_id, tmp_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (tmp_id) References t_motivo_pesca
-- );
-- 
-- Create Table t_pescador_especialista_has_t_tipo_transporte(
--     tps_id int,
--     ttr_id int,
--     Primary Key (tps_id, ttr_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (ttr_id) References t_tipo_transporte
-- );
-- 
-- Create Table t_pescador_especialista_has_t_acompanhado(
--     tpstacp_id serial,
--     tps_id int,
--     tacp_id int,
--     tpstacp_quantidade int,
--     ttd_id int,
--     Primary Key (tpstacp_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (tacp_id) References t_acompanhado,
--     Foreign Key (ttd_id) References t_tipodependente
-- );
-- 
-- Create Table t_pescador_especialista_has_t_acompanhado(
--     tpstacp_id serial,
--     tps_id int,
--     tacp_id int,
--     tpstacp_quantidade int,
--     ttd_id int, -- t_tipodependente
--     Primary Key (tpstacp_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (tacp_id) References t_acompanhado,
--     Foreign Key (ttd_id) References t_tipodependente
-- );
-- 
-- Create Table t_pescador_especialista_has_t_parentes (
--     tpsttd_id serial, 
--     tps_id int
--     ttd_id_parente int, -- t_tipodependente
--     tpsttd_quantidade int,
--     Primary Key (tpsttd_id),
--     Foreign Key (ttd_id) References t_tipodependente
--     
-- );
-- 
-- Create Table t_pescador_especialista_has_t_horario_pesca(
--     tps_id int,
--     thp_id int,
--     Primary Key (tps_id, ths_id),
--     Foreign Key (tps_id) References t_pescador_especialista,
--     Foreign Key (thp_id) References t_hora_pesca
-- );
-- 
-- t_pescador_especialista_has_t_insumo
-- tps_id
-- tin_id
-- tin_valor_rs
-- 
-- t_pescador_especialista_has_t_sobra_pesca
-- tps_id
-- tsp_id
-- 
-- t_pescador_especialista_has_t_local_tratamento
-- tps_id
-- tlt_id
-- 
-- t_pescador_especialista_has_t_dificuldade
-- tps_id
-- tdif_id
-- 
