
--ALTERAÇÕES CALÃO!--------------------------------------------------------------------------------
Create table t_calao_tipo(
	tcat_id serial,
	tcat_tipo Varchar(30),
	Primary Key (tcat_id)
	);
Insert into t_calao_tipo(tcat_tipo) Values ('Calão');
Insert into t_calao_tipo(tcat_tipo) Values ('Arrasto de Rio');
Insert into t_calao_tipo(tcat_tipo) Values ('Arrasto de Praia');

Alter table t_calao Add Column cal_tipo int, Add Foreign Key (cal_tipo) References t_calao_tipo (tcat_id);

Update t_calao Set cal_tipo = 1;
------------------------------------------------------------------------------------------------




Drop Table if exists t_embarcacao_detalhada_has_t_cor Cascade; 
Drop Table if exists t_embarcacao_detalhada_has_t_seguro_defeso Cascade;
Drop Table if exists t_embarcacao_detalhada_has_t_material Cascade;
Drop Table if exists t_embarcacao_detalhada_has_t_equipamento Cascade;
Drop Table if exists t_embarcacao_detalhada_has_t_savatagem Cascade;
Drop Table if exists t_motor_embarcacao_has_t_frequencia_manutencao Cascade;
Drop Table if exists t_atuacao_embarcacao_has_t_areapesca Cascade;
Drop Table if exists t_atuacao_embarcacao_has_t_artepesca Cascade;
Drop Table if exists t_atuacao_embarcacao_has_t_fornecedor_petrechos Cascade;
Drop table if exists t_motor_embarcacao Cascade;
Drop table if exists t_area_atuacao Cascade;
Drop table if exists t_embarcacao_detalhada Cascade;
Drop table if exists t_tipocasco Cascade;
Drop table if exists t_cor Cascade;
Drop table if exists t_material Cascade;
Drop table if exists t_tipopagamento Cascade;
Drop table if exists t_equipamento Cascade;
Drop table if exists t_savatagem Cascade;
Drop table if exists t_tipomotor Cascade;
Drop table if exists t_modelo Cascade;
Drop table if exists t_marca Cascade;
Drop table if exists t_posto_combustivel Cascade; 
Drop table if exists t_financiador Cascade;
Drop table if exists t_area_atuacao Cascade;


Create table t_tipocasco ( tcas_id serial, tcas_tipo Varchar(30), Primary Key (tcas_id) );
Create table t_cor (tcor_id serial, tcor_cor Varchar(30), Primary Key(tcor_id));
Create table t_material (tmt_id serial, tmt_material Varchar(50), Primary Key(tmt_id));
Create table t_tipopagamento (tpg_id serial,tpg_pagamento Varchar(50), Primary Key(tpg_id));
Create table t_equipamento (teq_id serial,teq_equipamento Varchar(50), Primary Key(teq_id));
Create table t_savatagem (tsav_id serial, tsav_savatagem Varchar(50), Primary Key(tsav_id));
Create table t_tipomotor ( tmot_id serial, tmot_tipo Varchar(50), Primary Key(tmot_id));
Create table t_modelo ( tmod_id serial, tmod_modelo Varchar(50), Primary Key(tmod_id));
Create table t_marca (tmar_id serial, tmar_marca Varchar(50), Primary Key(tmar_id));
Create table t_posto_combustivel (tpc_id serial, tpc_posto Varchar(50),	Primary Key(tpc_id));
Create table t_financiador (tfin_id serial, tfin_financiador Varchar(50), Primary Key(tfin_id));
Create table t_conservacao_pescado (tcp_id serial, tcp_conserva Varchar(30), Primary Key(tcp_id));


Create Table t_embarcacao_detalhada(
    ted_id serial,
    pto_id_desembarque int,
    tp_id_proprietario int,
    tp_id_mestre int,
    bar_id int,
    ted_quant_embarcacoes int,
    ted_max_tripulantes int,
    ted_tripulacao int,
    ted_cozinheiro int,
    ted_estado_conservacao int,
    tte_id_tipobarco int,
    ted_comp_total float,
    ted_comp_boca float,
    ted_altura_calado float,
    ted_arqueadura float,
    ted_num_registro Varchar(20),
    pto_id_origem int,
    tcas_id	int,
    ted_ano_compra int,
    ted_estado int,
    ted_pagamento int,
    tpg_id	int,
    ted_financiamento Varchar(100),
    ted_ano_construcao int,

    Primary Key (ted_id),
    Foreign Key (pto_id_desembarque) References t_porto (pto_id),
    Foreign Key (tp_id_proprietario) References t_pescador (tp_id),
    Foreign Key (tp_id_mestre) References t_pescador (tp_id),
    Foreign Key (bar_id) References t_barco (bar_id),
    Foreign Key (tp_id_proprietario) References t_pescador (tp_id),
    Foreign Key (tte_id_tipobarco) References t_tipoembarcacao(tte_id),
    Foreign Key (tcas_id) References t_tipocasco(tcas_id),
    Foreign Key (tpg_id) References t_tipopagamento(tpg_id)
);

Create Table t_motor_embarcacao	(
    tme_id serial,
    ted_id int,
    tme_propulsao int,
    tmot_id int,
    tmod_id int,
    tmar_id int,
    tme_potencia float,
    tme_combustivel int,
    tme_armazenamento float,
    tpc_id int,
    tme_ano_motor int,
    tme_estado_motor int,
    tme_pagamento_motor	int,
    tpg_id_motor int,
    tfin_id int,
    tme_ano_motor_fabricacao int,
    tme_obs Varchar(200),
    tme_gasto_mensal float,
    Primary Key (tme_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id),
    Foreign Key (tmot_id) References t_tipomotor (tmot_id),
    Foreign Key (tmod_id) References t_modelo (tmod_id),
    Foreign Key (tmar_id) References t_marca (tmar_id),
    Foreign Key (tpc_id) References t_posto_combustivel (tpc_id),
    Foreign Key (tpg_id_motor) References t_tipopagamento (tpg_id),
    Foreign Key (tfin_id) References t_financiador (tfin_id)
);
Create Table t_atuacao_embarcacao(
    tae_id serial,
    ted_id int,
    tae_atuacao_batimatrica int,
    tae_autonomia int,
    tfp_id_pesca int,
    thp_id_pesca int,
    tae_capacidade float,
    tcp_id_pescado int,
    tc_id int,
    dp_id int,
    dp_id_venda int,
    ttr_id_renda int,
    tea_id_maior int,
    tea_id_menor int,
    tae_concorrencia int,
    tae_tempo_atividade int,
    tae_data date,
    tu_entrevistador int,
    tu_digitador int,
    Primary Key (tae_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id),
    Foreign Key (tfp_id_pesca) References t_frequencia_pesca,
    Foreign Key (thp_id_pesca) References t_horario_pesca,
    Foreign Key (tcp_id_pescado) References t_conservacao_pescado,
    Foreign Key (tc_id) References t_colonia,
    Foreign Key (dp_id) References t_destinopescado,
    Foreign Key (dp_id_venda) References t_destinopescado,
    Foreign Key (tea_id_maior) References t_estacao_ano,
    Foreign Key (tea_id_menor) References t_estacao_ano,
    Foreign Key (ttr_id_renda) References t_tiporenda,
    Foreign Key (tu_entrevistador) References t_usuario,
    Foreign Key (tu_digitador) References t_usuario
);

------------------------------------------------------------------------------------------------

Create Table t_embarcacao_detalhada_has_t_cor (
    
    tedcor_id serial,
    tcor_id int,
    ted_id int,
    
    Primary Key (tedcor_id),
    Foreign Key (tcor_id) References t_cor (tcor_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id)
); 

Create Table t_embarcacao_detalhada_has_t_seguro_defeso (
    
    tsded_id serial,
    tsd_id_licenca int,
    ted_id int,
    
    Primary Key (tsded_id),
    Foreign Key (tsd_id_licenca) References t_seguro_defeso (tsd_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id)
);


Create Table t_embarcacao_detalhada_has_t_material (
    
    tsdmt_id serial,
    tmt_id int,
    ted_id int,
    
    Primary Key (tsdmt_id),
    Foreign Key (tmt_id) References t_material (tmt_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id)
);

Create Table t_embarcacao_detalhada_has_t_equipamento (
    
    tsdeq_id serial,
    teq_id int,
    ted_id int,
    
    Primary Key (tsdeq_id),
    Foreign Key (teq_id) References t_equipamento (teq_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id)
);

Create Table t_embarcacao_detalhada_has_t_savatagem (
    
    tsdsav_id serial,
    tsav_id int,
    ted_id int,
    
    Primary Key (tsdsav_id),
    Foreign Key (tsav_id) References t_savatagem (tsav_id),
    Foreign Key (ted_id) References t_embarcacao_detalhada (ted_id)
);


Create Table t_motor_embarcacao_has_t_frequencia_manutencao(

    tmefp_id serial,
    tme_id int,
    tfp_id int,

    Primary Key (tmefp_id),
    Foreign Key (tme_id) References t_motor_embarcacao (tme_id),
    Foreign Key (tfp_id) References t_frequencia_pesca (tfp_id)

);

Create Table t_atuacao_embarcacao_has_t_areapesca (
    
    taeap_id serial,
    tae_id int,
    tap_id_atuacao int,
    
    Primary Key (taeap_id),
    Foreign Key (tae_id) References t_atuacao_embarcacao (tae_id),
    Foreign Key (tap_id_atuacao) References t_areapesca (tareap_id)

);

Create Table t_atuacao_embarcacao_has_t_artepesca (

    taeatp_id serial,
    tae_id int,
    tap_id int,

    Primary Key (taeatp_id),
    Foreign Key (tae_id) References t_atuacao_embarcacao (tae_id),
    Foreign Key (tap_id) References t_artepesca (tap_id)

);

Create Table t_atuacao_embarcacao_has_t_fornecedor_petrechos (

    taefp_id serial,
    tae_id int,
    tfp_id int,

    Primary Key (taefp_id),
    Foreign Key (tae_id) References t_atuacao_embarcacao (tae_id),
    Foreign Key (tfp_id) References t_fornecedor_insumos (tfi_id)

);

Create Table t_atuacao_embarcacao_has_t_artepesca (

    taeatp_id serial,
    tae_id int,
    tap_id int,

    Primary Key (teatp_id),
    Foreign Key (tae_id) References t_atuacao_embarcacao (tae_id),
    Foreign Key (tap_id) References t_artepesca (tap_id)

);

Create Table t_atuacao_embarcacao_has_t_fornecedor_petrechos (

    taefp_id serial,
    tae_id int,
    tfp_id int,

    Primary Key (taefp_id),
    Foreign Key (tae_id) References t_atuacao_embarcacao (tae_id),
    Foreign Key (tfp_id) References t_fornecedor_insumo (tfp_id)

);


zf create db-table TipoCasco t_tipocasco;
zf create db-table Cor t_cor;
zf create db-table Material t_material;
zf create db-table TipoPagamento t_tipopagamento;
zf create db-table Equipamento t_equipamento;
zf create db-table Savatagem t_savatagem;
zf create db-table TipoMotor t_tipomotor;
zf create db-table Modelo t_modelo;
zf create db-table Marca t_marca;
zf create db-table PostoCombustivel t_posto_combustivel; 
zf create db-table Financiador t_financiador;
zf create db-table ConservacaoPescado t_conservacao_pescado;
zf create db-table EmbarcacaoDetalhadaHasCor t_embarcacao_detalhada_has_t_cor; 
zf create db-table EmbarcacaoDetalhadaHasSeguroDefeso t_embarcacao_detalhada_has_t_seguro_defeso;
zf create db-table EmbarcacaoDetalhadaHasMaterial t_embarcacao_detalhada_has_t_material;
zf create db-table EmbarcacaoDetalhadaHasEquipamento t_embarcacao_detalhada_has_t_equipamento;
zf create db-table EmbarcacaoDetalhadaHasSavatagem t_embarcacao_detalhada_has_t_savatagem;
zf create db-table MotorEmbarcacaoHasFrequenciaManutencao t_motor_embarcacao_has_t_frequencia_manutencao;
zf create db-table AtuacaoEmbarcacaoHasAreaPesca t_atuacao_embarcacao_has_t_areapesca;
zf create db-table AtuacaoEmbarcacaoHasArtePesca t_atuacao_embarcacao_has_t_artepesca;
zf create db-table AtuacaoEmbarcacaoHasFornecedorPetrechos t_atuacao_embarcacao_has_t_fornecedor_petrechos;
zf create db-table EmbarcacaoDetalhada t_embarcacao_detalhada;
zf create db-table MotorEmbarcacao t_motor_embarcacao;
zf create db-table AtuacaoEmbarcacao t_atuacao_embarcacao;

zf create model TipoCasco;
zf create model Cor;
zf create model Material;
zf create model TipoPagamento;
zf create model Equipamento;
zf create model Savatagem;
zf create model TipoMotor;
zf create model Modelo;
zf create model Marca;
zf create model PostoCombustivel;
zf create model Financiador;
zf create model ConservacaoPescado;
zf create model EmbarcacaoDetalhadaHasCor;
zf create model EmbarcacaoDetalhadaHasSeguroDefeso;
zf create model EmbarcacaoDetalhadaHasMaterial;
zf create model EmbarcacaoDetalhadaHasEquipamento;
zf create model EmbarcacaoDetalhadaHasSavatagem;
zf create model MotorEmbarcacaoHasFrequenciaManutencao;
zf create model AtuacaoEmbarcacaoHasAreaPesca;
zf create model AtuacaoEmbarcacaoHasArtePesca;
zf create model AtuacaoEmbarcacaoHasFornecedorPetrechos;
zf create model EmbarcacaoDetalhada;
zf create model MotorEmbarcacao;
zf create model AtuacaoEmbarcacao;


zf create controller  TipoCasco;
zf create controller  Cor;
zf create controller  Material;
zf create controller  TipoPagamento;
zf create controller  Equipamento;
zf create controller  Savatagem;
zf create controller  TipoMotor;
zf create controller  Modelo;
zf create controller  Marca;
zf create controller  PostoCombustivel;
zf create controller  Financiador;
zf create controller  ConservacaoPescado;

DROP TABLE t_historico_login;

CREATE TABLE t_historico_login
(
  thl_id serial,
  thl_dhlogin timestamp without time zone,
  thl_dhlogoff timestamp without time zone,
  tu_id int,
  PRIMARY KEY (thl_id),
  Foreign Key (tu_id) References t_usuario (tu_id)  
)

  
  
  
  
  
  
  
  



