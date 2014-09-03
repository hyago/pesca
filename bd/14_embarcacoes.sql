Drop table t_tipocasco;
Drop table t_cor;
Drop table t_material;
Drop table t_tipopagamento;
Drop table t_equipamento;
Drop table t_savatagem;
Drop table t_tipomotor;
Drop table t_modelo;
Drop table t_marca;
Drop table t_posto_combustivel; 
Drop table t_financiador;
Drop table t_area_atuacao;



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
Create table t_area_atuacao (taat_id serial, taat_atuacao Varchar(50), Primary Key(taat_id));


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
    ted_id t_proprietario_embarcao,
    tme_propulsao int,
    tmot_id t_tipomotor,
    tmod_id t_modelo,
    tmar_id t_marca,
    tme_potencia float,
    tme_combustivel int,
    tme_armazenamento float,
    tpc_id t_posto_combustivel,
    tme_ano_motor int,
    tme_estado_motor int,
    tme_pagamento_motor	int,
    tpg_id_motor t_tipopagamento,
    tfin_id t_financiador,
    tme_ano_motor_fabricacao int,
    tme_obs Varchar(200),
    tme_gasto_mensal float,
    Primary Key (tme_id),
    Foreign Key (ted_id) References t_proprietario_embaracao (ted_id),
    Foreign Key (tmot_id) References t_tipomotor (tmot_id),
    Foreign Key (tmod_id) References t_modelo (tmod_id),
    Foreign Key (tmar_id) References t_marca (tmar_id),
    Foreign Key (tpc_id) References t_posto_combustivel (tpc_id),
    Foreign Key (tpg_id_motor) References t_tipopagamento (tpg_id),
    Foreign Key (tfin_id) References t_financiador (tfin_id)
);
Create Table t_atuacao_embarcao(
    tae_id serial,
    ted_id int,
    tae_atuacao_batimatrica	int,
    tae_autonomia int
    tfp_id_pesca	t_frequencia_pesca,
    thp_id_pesca t_horario_pesca,
    tae_capacidade float,
    tcp_id_pescado t_conservacao_pescado,
    tc_id t_colonia,
    dp_id t_destinopescado,
    dp_id_venda t_destinopescado,
    ttr_id_renda t_tiporenda,
    tae_concorrencia int,
    tae_tempo_atividade int,
    tae_data date,
    tu_entrevistador t_usuario,
    tu_digitador t_usuario,
    Primary Key (tae_id),
    Foreign Key (ted_id) References t_proprietario_embarcacao (ted_id),
    Foreign Key (tfp_id_pesca) References t_frequencia_pesca,
    Foreign Key (thp_id_pesca) References t_horario_pesca,
    Foreign Key (tcp_id_pescado) References t_conservacao_pescado,
    Foreign Key (tc_id) References t_colonia,
    Foreign Key (dp_id) References t_destinopescado,
    Foreign Key (dp_id_venda) References t_destinopescado,
    Foreign Key (ttr_id_renda) References t_tiporenda,
    Foreign Key (tu_entrevistador) References t_usuario,
    Foreign Key (tu_digitador) References t_usuario
);

Create table t_calao_tipo(
	tcat_id serial,
	tcat_tipo Varchar(30),
	Primary Key (tcat_id)
	);
Insert into t_calao_tipo(tcat_tipo) Values ('Calão');
Insert into t_calao_tipo(tcat_tipo) Values ('Arrasto de Rio');
Insert into t_calao_tipo(tcat_tipo) Values ('Arrasto de Praia');


Alter table t_calao Add Column cal_tipo int, Add Foreign Key (cal_tipo) References t_calao_tipo (tcat_id);

Update table t_calao Set cal_tipo = 1;