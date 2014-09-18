Select t_porto.pto_nome,
        'Calão' as artepesca,
	t_calao.cal_data, 
	t_calao.cal_tempogasto, 
	t_calao.cal_id, 
	t_pescador.tp_nome, 
	t_calao.cal_embarcada, 
	t_barco.bar_nome, 
	t_calao.cal_quantpescadores, 
	t_calao.cal_npanos,
	t_calao.cal_tamanho,
	t_calao.cal_altura,
	t_calao.cal_malha,
	t_calao.cal_malha1,
	t_calao.cal_malha2,
	t_calao.cal_numlances,
	t_calao_tipo.tcat_tipo,
	t_calao.cal_motor,
	t_destinopescado.dp_destino, 
	t_especie.esp_nome, 
t_calao_has_t_especie_capturada.spc_peso_kg From t_calao
	LEFT JOIN t_pescador ON t_calao.tp_id_entrevistado = t_pescador.tp_id
	LEFT JOIN t_barco ON t_calao.bar_id = t_barco.bar_id
	LEFT Join t_monitoramento on t_calao.mnt_id = t_monitoramento.mnt_id 
	LEFT Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
	LEFT Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
	LEFT Join t_calao_tipo On t_calao.cal_tipo = t_calao_tipo.tcat_id
	LEFT Join t_calao_has_t_especie_capturada On t_calao.cal_id = t_calao_has_t_especie_capturada.cal_id
	LEFT Join t_especie On t_calao_has_t_especie_capturada.esp_id = t_especie.esp_id
	LEFT Join t_destinopescado On t_calao.dp_id = t_destinopescado.dp_id
Group by t_porto.pto_nome, t_calao.cal_data, t_calao.cal_tempogasto,t_calao.cal_id, 
t_pescador.tp_nome, t_barco.bar_nome,t_calao_tipo.tcat_tipo,
t_especie.esp_nome,t_calao_has_t_especie_capturada.spc_peso_kg,t_destinopescado.dp_destino
Order By t_porto.pto_nome;

Select t_porto.pto_nome,
        'Tarrafa',
	t_tarrafa.tar_data, 
	t_tarrafa.tar_tempogasto, 
	t_tarrafa.tar_id, 
	t_pescador.tp_nome, 
	t_tarrafa.tar_embarcado, 
	t_barco.bar_nome, 
	t_tarrafa.tar_quantpescadores, 
	t_tarrafa.tar_roda,
	t_tarrafa.tar_altura,
	t_tarrafa.tar_malha,
	t_tarrafa.tar_numlances, 
	t_tarrafa.tar_motor,
	t_destinopescado.dp_destino, 
	t_especie.esp_nome, 
t_tarrafa_has_t_especie_capturada.spc_peso_kg From t_tarrafa
	LEFT JOIN t_pescador ON t_tarrafa.tp_id_entrevistado = t_pescador.tp_id
	LEFT JOIN t_barco ON t_tarrafa.bar_id = t_barco.bar_id
	LEFT Join t_monitoramento on t_tarrafa.mnt_id = t_monitoramento.mnt_id 
	LEFT Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
	LEFT Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
	LEFT Join t_tarrafa_has_t_especie_capturada On t_tarrafa.tar_id = t_tarrafa_has_t_especie_capturada.tar_id
	LEFT Join t_especie On t_tarrafa_has_t_especie_capturada.esp_id = t_especie.esp_id
	LEFT Join t_destinopescado On t_tarrafa.dp_id = t_destinopescado.dp_id
Group by t_porto.pto_nome, t_tarrafa.tar_data, t_tarrafa.tar_tempogasto,t_tarrafa.tar_id, 
t_pescador.tp_nome, t_barco.bar_nome,
t_especie.esp_nome,t_tarrafa_has_t_especie_capturada.spc_peso_kg,t_destinopescado.dp_destino
Order By t_porto.pto_nome;

