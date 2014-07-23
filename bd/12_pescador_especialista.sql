
Drop table if exists t_estado_civil;
Drop table if exists t_origem;
Drop table if exists t_residencia;
Drop table if exists t_possui_em_casa;
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

Create Table t_possui_em_casa(
    tpec_id serial,
    tpec_possui Varchar(50),
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
