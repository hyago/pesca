Drop View v_entrevista_arrasto;
Drop View v_entrevista_calao;
Drop View v_entrevista_coletamanual;
Drop View v_entrevista_tarrafa;
Drop View v_entrevista_emalhe;
Drop View v_entrevista_grosseira;
Drop View v_entrevista_jerere;
Drop View v_entrevista_linha;
Drop View v_entrevista_linhafundo;
Drop View v_entrevista_manzua;
Drop View v_entrevista_mergulho;
Drop View v_entrevista_ratoeira;
Drop View v_entrevista_siripoia;
Drop View v_entrevista_varapesca;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_calao AS 
Select t_porto.pto_nome,
        'Calão' as artepesca,
	t_calao.cal_data, 
	t_calao.cal_tempogasto, 
	t_calao.cal_id, 
	t_pescador.tp_nome,
        t_pescador.tp_apelido,
	t_calao.cal_embarcada,
        t_calao.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
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
	t_destinopescado.dp_destino
        From t_calao
	LEFT JOIN t_pescador ON t_calao.tp_id_entrevistado = t_pescador.tp_id
	LEFT JOIN t_barco ON t_calao.bar_id = t_barco.bar_id
	LEFT Join t_monitoramento on t_calao.mnt_id = t_monitoramento.mnt_id 
	LEFT Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
	LEFT Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
	LEFT Join t_calao_tipo On t_calao.cal_tipo = t_calao_tipo.tcat_id
	LEFT Join t_destinopescado On t_calao.dp_id = t_destinopescado.dp_id
        LEFT JOIN t_tipoembarcacao ON t_calao.tte_id = t_tipoembarcacao.tte_id
        Group by t_porto.pto_nome, t_calao.cal_data, t_calao.cal_tempogasto,t_calao.cal_id, 
                 t_pescador.tp_nome, t_barco.bar_nome,t_calao_tipo.tcat_tipo,
                 t_destinopescado.dp_destino,t_tipoembarcacao.tte_tipoembarcacao
        Order By t_porto.pto_nome; 
--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_tarrafa AS 
Select t_porto.pto_nome,
        'Tarrafa' as artepesca,
	t_tarrafa.tar_data, 
	t_tarrafa.tar_tempogasto, 
	t_tarrafa.tar_id, 
	t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_tipoembarcacao.tte_tipoembarcacao,
	t_tarrafa.tar_embarcado, 
	t_barco.bar_nome, 
	t_tarrafa.tar_quantpescadores, 
	t_tarrafa.tar_roda,
	t_tarrafa.tar_altura,
	t_tarrafa.tar_malha,
	t_tarrafa.tar_numlances, 
	t_tarrafa.tar_motor,
	t_destinopescado.dp_destino 
        From t_tarrafa
	LEFT JOIN t_pescador ON t_tarrafa.tp_id_entrevistado = t_pescador.tp_id
	LEFT JOIN t_barco ON t_tarrafa.bar_id = t_barco.bar_id
	LEFT Join t_monitoramento on t_tarrafa.mnt_id = t_monitoramento.mnt_id 
	LEFT Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
	LEFT Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
	LEFT Join t_destinopescado On t_tarrafa.dp_id = t_destinopescado.dp_id
        LEFT JOIN t_tipoembarcacao ON t_tarrafa.tte_id = t_tipoembarcacao.tte_id
        Group by t_porto.pto_nome, t_tarrafa.tar_data, t_tarrafa.tar_tempogasto,t_tarrafa.tar_id, 
                t_pescador.tp_nome, t_barco.bar_nome,t_destinopescado.dp_destino,t_tipoembarcacao.tte_tipoembarcacao
        Order By t_porto.pto_nome;
--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_coletamanual AS 
Select t_porto.pto_nome,
        'Coleta Manual' as artepesca,
        t_coletamanual.cml_id,
        t_coletamanual.cml_embarcada,
        t_coletamanual.bar_id,
        t_coletamanual.tte_id,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_coletamanual.tp_id_entrevistado,
        t_coletamanual.cml_quantpescadores,
        t_coletamanual.cml_dhsaida,
        t_coletamanual.cml_dhvolta,
        DATE_PART('day', t_coletamanual.cml_dhvolta - t_coletamanual.cml_dhsaida) as dias,
        t_coletamanual.cml_tempogasto,
        t_coletamanual.cml_obs,
        t_coletamanual.mnt_id,
        t_coletamanual.mre_id,
        t_mare.mre_tipo,
        t_coletamanual.cml_mreviva,
        t_coletamanual.cml_motor,
        t_coletamanual.dp_id,
        t_destinopescado.dp_destino,
        t_coletamanual.cml_combustivel
        From t_coletamanual
	LEFT JOIN t_pescador ON t_coletamanual.tp_id_entrevistado = t_pescador.tp_id
	LEFT JOIN t_barco ON t_coletamanual.bar_id = t_barco.bar_id
	LEFT Join t_monitoramento on t_coletamanual.mnt_id = t_monitoramento.mnt_id 
	LEFT Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
	LEFT Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
	LEFT Join t_destinopescado On t_coletamanual.dp_id = t_destinopescado.dp_id
        LEFT JOIN t_tipoembarcacao ON t_coletamanual.tte_id = t_tipoembarcacao.tte_id
        LEFT JOIN t_mare On t_coletamanual.mre_id = t_mare.mre_id
        Group by t_porto.pto_nome, t_coletamanual.cml_tempogasto,t_coletamanual.cml_id, 
                 t_pescador.tp_nome, t_barco.bar_nome, t_destinopescado.dp_destino,t_tipoembarcacao.tte_tipoembarcacao,t_mare.mre_tipo
        Order By t_porto.pto_nome;

ALTER TABLE t_coletamanual DROP CONSTRAINT t_coletamanual_ttv_id_fkey;
Alter table t_coletamanual Drop column ttv_id;
--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_arrasto AS 
 SELECT 'Arrasto de Fundo' AS artepesca, t_arrastofundo.af_id, 
    t_arrastofundo.tp_id_entrevistado, t_pescador.tp_nome, 
    t_pescador.tp_apelido, t_arrastofundo.bar_id, t_barco.bar_nome, 
    t_arrastofundo.tte_id, t_tipoembarcacao.tte_tipoembarcacao, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_porto.pto_nome, 
    t_arrastofundo.af_embarcado, t_arrastofundo.af_quantpescadores, 
    t_ficha_diaria.fd_data, t_arrastofundo.af_dhsaida, 
    t_arrastofundo.af_dhvolta, 
    date_part('day'::text, t_arrastofundo.af_dhvolta - t_arrastofundo.af_dhsaida) AS dias, 
    t_arrastofundo.af_diesel, t_arrastofundo.af_oleo, 
    t_arrastofundo.af_alimento, t_arrastofundo.af_gelo, t_arrastofundo.af_obs, 
    t_arrastofundo.af_motor, t_arrastofundo.dp_id, t_destinopescado.dp_destino
   FROM t_arrastofundo
   LEFT JOIN t_pescador ON t_arrastofundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_arrastofundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_arrastofundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_arrastofundo.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado ON t_arrastofundo.dp_id = t_destinopescado.dp_id
  GROUP BY t_porto.pto_nome, t_arrastofundo.af_id, t_pescador.tp_nome, t_pescador.tp_apelido, t_barco.bar_nome, t_tipoembarcacao.tte_tipoembarcacao, t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_ficha_diaria.fd_data, t_destinopescado.dp_destino
  ORDER BY t_porto.pto_nome, t_arrastofundo.af_id;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_emalhe AS 
 SELECT 'Emalhe' as artepesca,
        t_emalhe.em_id, 
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_emalhe.bar_id,
        t_barco.bar_nome, 
        t_monitoramento.mnt_id, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_emalhe.em_embarcado,
        t_emalhe.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_emalhe.tp_id_entrevistado,
        t_emalhe.em_quantpescadores,
        t_emalhe.em_dhlancamento,
        t_emalhe.em_dhrecolhimento,
        DATE_PART('day', t_emalhe.em_dhrecolhimento - t_emalhe.em_dhlancamento) as dias,
        t_emalhe.em_diesel,
        t_emalhe.em_oleo,
        t_emalhe.em_alimento,
        t_emalhe.em_gelo,
        t_emalhe.em_tamanho,
        t_emalhe.em_altura,
        t_emalhe.em_numpanos,
        t_emalhe.em_malha,
        t_emalhe.em_obs,
        t_emalhe.em_motor,
        t_emalhe.dp_id,
        t_destinopescado.dp_destino
   FROM t_emalhe
   LEFT JOIN t_pescador ON t_emalhe.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_emalhe.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_emalhe.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_emalhe.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_emalhe.dp_id = t_destinopescado.dp_id;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_grosseira AS 
 SELECT t_grosseira.grs_id,
        'Grosseira' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_grosseira.grs_embarcada,
        t_grosseira.bar_id,
        t_grosseira.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_grosseira.tp_id_entrevistado,
        t_grosseira.grs_numpescadores,
        t_grosseira.grs_dhsaida,
        t_grosseira.grs_dhvolta,
        DATE_PART('day', t_grosseira.grs_dhvolta - t_grosseira.grs_dhsaida) as dias,
        t_grosseira.grs_diesel,
        t_grosseira.grs_oleo,
        t_grosseira.grs_alimento,
        t_grosseira.grs_gelo,
        t_grosseira.grs_numlinhas,
        t_grosseira.grs_numanzoisplinha,
        t_grosseira.isc_id,
        t_grosseira.grs_obs,
        t_grosseira.mnt_id,
        t_grosseira.grs_motor,
        t_grosseira.dp_id,
        t_destinopescado.dp_destino
        FROM t_grosseira
   LEFT JOIN t_pescador ON t_grosseira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_grosseira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_grosseira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_grosseira.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_grosseira.dp_id = t_destinopescado.dp_id;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_jerere AS 
 SELECT 'Jereré' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_jerere.jre_id,
        t_jerere.jre_embarcada,
        t_jerere.bar_id,
        t_jerere.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_mare.mre_tipo,
        t_jerere.tp_id_entrevistado,
        t_jerere.jre_quantpescadores,
        t_jerere.jre_dhsaida,
        t_jerere.jre_dhvolta,
        DATE_PART('day', t_jerere.jre_dhvolta - t_jerere.jre_dhsaida) as dias,
        t_jerere.jre_tempogasto,
        t_jerere.jre_numarmadilhas,
        t_jerere.jre_obs,
        t_jerere.mnt_id,
        t_jerere.mre_id,
        t_jerere.jre_mreviva,
        t_jerere.jre_motor,
        t_jerere.dp_id,
        t_destinopescado.dp_destino,
        t_jerere.jre_combustivel
   FROM t_jerere
   LEFT JOIN t_pescador ON t_jerere.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_jerere.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_jerere.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_jerere.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_jerere.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_mare On t_jerere.mre_id = t_mare.mre_id;



--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_linha AS 
 SELECT 'Linha' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_linha.lin_id,
        t_linha.lin_embarcada,
        t_linha.bar_id,
        t_linha.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_linha.tp_id_entrevistado,
        t_linha.lin_numpescadores,
        t_linha.lin_dhsaida,
        t_linha.lin_dhvolta,
        DATE_PART('day', t_linha.lin_dhvolta - t_linha.lin_dhsaida) as dias,
        t_linha.lin_diesel,
        t_linha.lin_oleo,
        t_linha.lin_alimento,
        t_linha.lin_gelo,
        t_linha.lin_numlinhas,
        t_linha.lin_numanzoisplinha,
        t_linha.isc_id,
        t_isca.isc_tipo,
        t_linha.mnt_id,
        t_linha.lin_motor,
        t_linha.lin_obs,
        t_linha.dp_id,
        t_destinopescado.dp_destino
   FROM t_linha
   LEFT JOIN t_pescador ON t_linha.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linha.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linha.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_linha.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_linha.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_isca On t_linha.isc_id = t_isca.isc_id;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_linhafundo AS 
 SELECT t_linhafundo.lf_id,
        'Linha de Fundo' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_monitoramento.mnt_id,
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_linhafundo.lf_embarcada,
        t_linhafundo.bar_id,
        t_linhafundo.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_linhafundo.tp_id_entrevistado,
        t_linhafundo.lf_quantpescadores,
        t_linhafundo.lf_dhsaida,
        t_linhafundo.lf_dhvolta,
        DATE_PART('day', t_linhafundo.lf_dhvolta - t_linhafundo.lf_dhsaida) as dias,
        t_linhafundo.lf_tempogasto,
        t_linhafundo.lf_diesel,
        t_linhafundo.lf_oleo,
        t_linhafundo.lf_alimento,
        t_linhafundo.lf_gelo,
        t_linhafundo.lf_numlinhas,
        t_linhafundo.lf_numanzoisplinha,
        t_linhafundo.isc_id,
        t_isca.isc_tipo,
        t_linhafundo.lf_obs,
        t_linhafundo.mre_id,
        t_linhafundo.lf_mreviva,
        t_linhafundo.lf_motor,
        t_linhafundo.dp_id
   FROM t_linhafundo
   LEFT JOIN t_pescador ON t_linhafundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linhafundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linhafundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id   
   LEFT JOIN t_tipoembarcacao ON t_linhafundo.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_linhafundo.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_isca On t_linhafundo.isc_id = t_isca.isc_id
   LEFT JOIN t_mare On t_linhafundo.mre_id = t_mare.mre_id;



--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_manzua AS 
 SELECT t_manzua.man_id, 
        'Manzuá' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome,
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_manzua.man_embarcada,
        t_manzua.bar_id,
        t_manzua.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_manzua.tp_id_entrevistado,
        t_manzua.man_quantpescadores,
        t_manzua.man_dhsaida,
        t_manzua.man_dhvolta,
        DATE_PART('day', t_manzua.man_dhvolta - t_manzua.man_dhsaida) as dias,
        t_manzua.man_tempogasto,
        t_manzua.man_numarmadilhas,
        t_manzua.man_obs,
        t_manzua.mnt_id,
        t_manzua.mre_id,
        t_mare.mre_tipo,
        t_manzua.man_mreviva,
        t_manzua.man_motor,
        t_manzua.dp_id,
        t_destinopescado.dp_destino,
        t_manzua.man_combustivel
   FROM t_manzua
   LEFT JOIN t_pescador ON t_manzua.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_manzua.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_manzua.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_manzua.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_manzua.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_mare On t_manzua.mre_id = t_mare.mre_id;




--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_mergulho AS 
 SELECT t_mergulho.mer_id,
        'Mergulho' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_monitoramento.mnt_id, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_mergulho.mer_embarcada,
        t_mergulho.bar_id,
        t_mergulho.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_mergulho.tp_id_entrevistado,
        t_mergulho.mer_quantpescadores,
        t_mergulho.mer_dhsaida,
        t_mergulho.mer_dhvolta,
        DATE_PART('day', t_mergulho.mer_dhvolta - t_mergulho.mer_dhsaida) as dias,
        t_mergulho.mer_tempogasto,
        t_mergulho.mer_obs,
        t_mergulho.mre_id,
        t_mare.mre_tipo,
        t_mergulho.mer_mreviva,
        t_mergulho.mer_motor,
        t_mergulho.dp_id,
        t_destinopescado.dp_destino,
        t_mergulho.mer_combustivel
   FROM t_mergulho
   LEFT JOIN t_pescador ON t_mergulho.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_mergulho.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_mergulho.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id   
   LEFT JOIN t_tipoembarcacao ON t_mergulho.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_mergulho.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_mare On t_mergulho.mre_id = t_mare.mre_id;



--/////////////////////////////////////////////////////////////////////////////////////////////////
    CREATE OR REPLACE VIEW v_entrevista_ratoeira AS 
 SELECT t_ratoeira.rat_id, 
        'Ratoeira' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_ratoeira.rat_embarcada,
        t_ratoeira.bar_id,
        t_ratoeira.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_ratoeira.tp_id_entrevistado,
        t_ratoeira.rat_quantpescadores,
        t_ratoeira.rat_dhsaida,
        t_ratoeira.rat_dhvolta,
        DATE_PART('day', t_ratoeira.rat_dhvolta - t_ratoeira.rat_dhsaida) as dias,
        t_ratoeira.rat_tempogasto,
        t_ratoeira.rat_numarmadilhas,
        t_ratoeira.rat_obs,
        t_ratoeira.mnt_id,
        t_ratoeira.mre_id,
        t_mare.mre_tipo,
        t_ratoeira.rat_mreviva,
        t_ratoeira.rat_motor,
        t_ratoeira.dp_id,
        t_destinopescado.dp_destino,
        t_ratoeira.rat_combustivel
   FROM t_ratoeira
   LEFT JOIN t_pescador ON t_ratoeira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_ratoeira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_ratoeira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_ratoeira.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_ratoeira.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_mare On t_ratoeira.mre_id = t_mare.mre_id;



--/////////////////////////////////////////////////////////////////////////////////////////////////
    CREATE OR REPLACE VIEW v_entrevista_siripoia AS 
 SELECT t_siripoia.sir_id, 
        'Siripóia' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_siripoia.sir_embarcada,
        t_siripoia.bar_id,
        t_siripoia.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_siripoia.tp_id_entrevistado,
        t_siripoia.sir_quantpescadores,
        t_siripoia.sir_dhsaida,
        t_siripoia.sir_dhvolta,
        DATE_PART('day', t_siripoia.sir_dhvolta - t_siripoia.sir_dhsaida) as dias,
        t_siripoia.sir_tempogasto,
        t_siripoia.sir_numarmadilhas,
        t_siripoia.sir_obs,
        t_siripoia.mnt_id,
        t_siripoia.mre_id,
        t_mare.mre_tipo,
        t_siripoia.sir_mreviva,
        t_siripoia.sir_motor,
        t_siripoia.dp_id,
        t_destinopescado.dp_destino,
        t_siripoia.sir_combustivel
   FROM t_siripoia
   LEFT JOIN t_pescador ON t_siripoia.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_siripoia.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_siripoia.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_siripoia.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_siripoia.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_mare On t_siripoia.mre_id = t_mare.mre_id;




--/////////////////////////////////////////////////////////////////////////////////////////////////
    CREATE OR REPLACE VIEW v_entrevista_varapesca AS 
 SELECT t_varapesca.vp_id,
        'Vara de pesca' as artepesca,
        t_pescador.tp_nome,
        t_pescador.tp_apelido,
        t_barco.bar_nome, 
        t_ficha_diaria.fd_id, 
        t_porto.pto_nome,
        t_varapesca.vp_embarcada,
        t_varapesca.bar_id,
        t_varapesca.tte_id,
        t_tipoembarcacao.tte_tipoembarcacao,
        t_varapesca.tp_id_entrevistado,
        t_varapesca.vp_quantpescadores,
        t_varapesca.vp_dhsaida,
        t_varapesca.vp_dhvolta,
        DATE_PART('day', t_varapesca.vp_dhvolta - t_varapesca.vp_dhsaida) as dias,
        t_varapesca.vp_tempogasto,
        t_varapesca.vp_diesel,
        t_varapesca.vp_oleo,
        t_varapesca.vp_alimento,
        t_varapesca.vp_gelo,
        t_varapesca.vp_numanzoisplinha,
        t_varapesca.vp_numlinhas,
        t_varapesca.isc_id,
        t_isca.isc_tipo,
        t_varapesca.vp_obs,
        t_varapesca.mnt_id,
        t_varapesca.mre_id,
        t_mare.mre_tipo,
        t_varapesca.vp_mreviva,
        t_varapesca.vp_motor,
        t_varapesca.dp_id,
        t_destinopescado.dp_destino
   FROM t_varapesca
   LEFT JOIN t_pescador ON t_varapesca.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_varapesca.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_varapesca.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
   LEFT JOIN t_porto ON t_ficha_diaria.pto_id = t_porto.pto_id
   LEFT JOIN t_tipoembarcacao ON t_varapesca.tte_id = t_tipoembarcacao.tte_id
   LEFT JOIN t_destinopescado On t_varapesca.dp_id = t_destinopescado.dp_id
   LEFT JOIN t_isca On t_varapesca.isc_id = t_isca.isc_id
   LEFT JOIN t_mare On t_varapesca.mre_id = t_mare.mre_id;



--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevistas_monitoradas AS 
Select  porto.pto_nome, 
arte.tap_artepesca, 
DATE_PART('month', ficha.fd_data) as mes, 
DATE_PART('year', ficha.fd_data) as ano, 
sum(monit.mnt_quantidade) as monitorados 
From t_ficha_diaria as ficha
    Inner Join t_monitoramento as monit On ficha.fd_id = monit.fd_id
    Inner Join t_porto as porto On ficha.pto_id = porto.pto_id
    Inner Join t_artepesca as arte On monit.mnt_arte = arte.tap_id
    Where monit.mnt_monitorado Is True
    Group By porto.pto_nome, arte.tap_artepesca, DATE_PART('month', ficha.fd_data),DATE_PART('year', ficha.fd_data)
    Order By arte.tap_artepesca, porto.pto_nome, DATE_PART('month', ficha.fd_data) ,DATE_PART('year', ficha.fd_data);

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_entrevista_naomonitoradas AS 
Select  porto.pto_nome, 
arte.tap_artepesca, 
DATE_PART('month', ficha.fd_data) as mes,
DATE_PART('year', ficha.fd_data)  as ano, 
sum(monit.mnt_quantidade) as monitorados 
From t_ficha_diaria as ficha
    Inner Join t_monitoramento as monit On ficha.fd_id = monit.fd_id
    Inner Join t_porto as porto On ficha.pto_id = porto.pto_id
    Inner Join t_artepesca as arte On monit.mnt_arte = arte.tap_id
    Where monit.mnt_monitorado Is Not True
    Group By porto.pto_nome, arte.tap_artepesca, DATE_PART('month', ficha.fd_data),DATE_PART('year', ficha.fd_data)
    Order By arte.tap_artepesca, porto.pto_nome, DATE_PART('month', ficha.fd_data) ,DATE_PART('year', ficha.fd_data);

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_especies_capturadas AS
Select t_porto.pto_nome, 
'Arrasto de Fundo' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_arrastofundo on t_monitoramento.mnt_id = t_arrastofundo.mnt_id
Left Join t_arrastofundo_has_t_especie_capturada on t_arrastofundo.af_id = t_arrastofundo_has_t_especie_capturada.af_id
Inner Join t_especie on t_arrastofundo_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Calão' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_calao on t_monitoramento.mnt_id = t_calao.mnt_id
Left Join t_calao_has_t_especie_capturada on t_calao.cal_id = t_calao_has_t_especie_capturada.cal_id
Inner Join t_especie on t_calao_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Coleta Manual' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_coletamanual on t_monitoramento.mnt_id = t_coletamanual.mnt_id
Left Join t_coletamanual_has_t_especie_capturada on t_coletamanual.cml_id = t_coletamanual_has_t_especie_capturada.cml_id
Inner Join t_especie on t_coletamanual_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Emalhe' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_emalhe on t_monitoramento.mnt_id = t_emalhe.mnt_id
Left Join t_emalhe_has_t_especie_capturada on t_emalhe.em_id = t_emalhe_has_t_especie_capturada.em_id
Inner Join t_especie on t_emalhe_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Jereré' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_jerere on t_monitoramento.mnt_id = t_jerere.mnt_id
Left Join t_jerere_has_t_especie_capturada on t_jerere.jre_id = t_jerere_has_t_especie_capturada.jre_id
Inner Join t_especie on t_jerere_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Linha' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_linha on t_monitoramento.mnt_id = t_linha.mnt_id
Left Join t_linha_has_t_especie_capturada on t_linha.lin_id = t_linha_has_t_especie_capturada.lin_id
Inner Join t_especie on t_linha_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Linha de Fundo' as arte, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_linhafundo on t_monitoramento.mnt_id = t_linhafundo.mnt_id
Left Join t_linhafundo_has_t_especie_capturada on t_linhafundo.lf_id = t_linhafundo_has_t_especie_capturada.lf_id
Inner Join t_especie on t_linhafundo_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum


Union All
Select t_porto.pto_nome, 
'Grosseira' as arte,  
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_grosseira on t_monitoramento.mnt_id = t_grosseira.mnt_id
Left Join t_grosseira_has_t_especie_capturada on t_grosseira.grs_id = t_grosseira_has_t_especie_capturada.grs_id
Inner Join t_especie on t_grosseira_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum


Union All
Select t_porto.pto_nome, 
'Manzuá' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_manzua on t_monitoramento.mnt_id = t_manzua.mnt_id
Left Join t_manzua_has_t_especie_capturada on t_manzua.man_id = t_manzua_has_t_especie_capturada.man_id
Inner Join t_especie on t_manzua_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Mergulho' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_mergulho on t_monitoramento.mnt_id = t_mergulho.mnt_id
Left Join t_mergulho_has_t_especie_capturada on t_mergulho.mer_id = t_mergulho_has_t_especie_capturada.mer_id
Inner Join t_especie on t_mergulho_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Ratoeira' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_ratoeira on t_monitoramento.mnt_id = t_ratoeira.mnt_id
Left Join t_ratoeira_has_t_especie_capturada on t_ratoeira.rat_id = t_ratoeira_has_t_especie_capturada.rat_id
Inner Join t_especie on t_ratoeira_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Siripoia' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_siripoia on t_monitoramento.mnt_id = t_siripoia.mnt_id
Left Join t_siripoia_has_t_especie_capturada on t_siripoia.sir_id = t_siripoia_has_t_especie_capturada.sir_id
Inner Join t_especie on t_siripoia_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Tarrafa' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_tarrafa on t_monitoramento.mnt_id = t_tarrafa.mnt_id
Left Join t_tarrafa_has_t_especie_capturada on t_tarrafa.tar_id = t_tarrafa_has_t_especie_capturada.tar_id
Inner Join t_especie on t_tarrafa_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum

Union All
Select t_porto.pto_nome, 
'Varapesca' as arte,   
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_varapesca on t_monitoramento.mnt_id = t_varapesca.mnt_id
Left Join t_varapesca_has_t_especie_capturada on t_varapesca.vp_id = t_varapesca_has_t_especie_capturada.vp_id
Inner Join t_especie on t_varapesca_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum;

--/////////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE VIEW v_especies_capturadas_by_mes AS
Select t_porto.pto_nome, 
'Arrasto de Fundo' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes,
DATE_PART('year', t_ficha_diaria.fd_data) as ano,
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_arrastofundo on t_monitoramento.mnt_id = t_arrastofundo.mnt_id
Left Join t_arrastofundo_has_t_especie_capturada on t_arrastofundo.af_id = t_arrastofundo_has_t_especie_capturada.af_id
Inner Join t_especie on t_arrastofundo_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Calão' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes,
DATE_PART('year', t_ficha_diaria.fd_data) as ano,
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_calao on t_monitoramento.mnt_id = t_calao.mnt_id
Left Join t_calao_has_t_especie_capturada on t_calao.cal_id = t_calao_has_t_especie_capturada.cal_id
Inner Join t_especie on t_calao_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Coleta Manual' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_coletamanual on t_monitoramento.mnt_id = t_coletamanual.mnt_id
Left Join t_coletamanual_has_t_especie_capturada on t_coletamanual.cml_id = t_coletamanual_has_t_especie_capturada.cml_id
Inner Join t_especie on t_coletamanual_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Emalhe' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes,
DATE_PART('year', t_ficha_diaria.fd_data) as ano,
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_emalhe on t_monitoramento.mnt_id = t_emalhe.mnt_id
Left Join t_emalhe_has_t_especie_capturada on t_emalhe.em_id = t_emalhe_has_t_especie_capturada.em_id
Inner Join t_especie on t_emalhe_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Jereré' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_jerere on t_monitoramento.mnt_id = t_jerere.mnt_id
Left Join t_jerere_has_t_especie_capturada on t_jerere.jre_id = t_jerere_has_t_especie_capturada.jre_id
Inner Join t_especie on t_jerere_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome,  t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Linha' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_linha on t_monitoramento.mnt_id = t_linha.mnt_id
Left Join t_linha_has_t_especie_capturada on t_linha.lin_id = t_linha_has_t_especie_capturada.lin_id
Inner Join t_especie on t_linha_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Linha de Fundo' as arte, 
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_linhafundo on t_monitoramento.mnt_id = t_linhafundo.mnt_id
Left Join t_linhafundo_has_t_especie_capturada on t_linhafundo.lf_id = t_linhafundo_has_t_especie_capturada.lf_id
Inner Join t_especie on t_linhafundo_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)


Union All
Select t_porto.pto_nome, 
'Grosseira' as arte,  
DATE_PART('month', t_ficha_diaria.fd_data)as mes,
DATE_PART('year', t_ficha_diaria.fd_data) as ano,
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_grosseira on t_monitoramento.mnt_id = t_grosseira.mnt_id
Left Join t_grosseira_has_t_especie_capturada on t_grosseira.grs_id = t_grosseira_has_t_especie_capturada.grs_id
Inner Join t_especie on t_grosseira_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)


Union All
Select t_porto.pto_nome, 
'Manzuá' as arte,   
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_manzua on t_monitoramento.mnt_id = t_manzua.mnt_id
Left Join t_manzua_has_t_especie_capturada on t_manzua.man_id = t_manzua_has_t_especie_capturada.man_id
Inner Join t_especie on t_manzua_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Mergulho' as arte,   
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano,  
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_mergulho on t_monitoramento.mnt_id = t_mergulho.mnt_id
Left Join t_mergulho_has_t_especie_capturada on t_mergulho.mer_id = t_mergulho_has_t_especie_capturada.mer_id
Inner Join t_especie on t_mergulho_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Ratoeira' as arte,   
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_ratoeira on t_monitoramento.mnt_id = t_ratoeira.mnt_id
Left Join t_ratoeira_has_t_especie_capturada on t_ratoeira.rat_id = t_ratoeira_has_t_especie_capturada.rat_id
Inner Join t_especie on t_ratoeira_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Siripoia' as arte,   
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_siripoia on t_monitoramento.mnt_id = t_siripoia.mnt_id
Left Join t_siripoia_has_t_especie_capturada on t_siripoia.sir_id = t_siripoia_has_t_especie_capturada.sir_id
Inner Join t_especie on t_siripoia_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Tarrafa' as arte,   
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano, 
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_tarrafa on t_monitoramento.mnt_id = t_tarrafa.mnt_id
Left Join t_tarrafa_has_t_especie_capturada on t_tarrafa.tar_id = t_tarrafa_has_t_especie_capturada.tar_id
Inner Join t_especie on t_tarrafa_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data)

Union All
Select t_porto.pto_nome, 
'Varapesca' as arte,  
DATE_PART('month', t_ficha_diaria.fd_data)as mes, 
DATE_PART('year', t_ficha_diaria.fd_data) as ano,  
t_especie.esp_nome, 
t_especie.esp_nome_comum, 
sum(spc_peso_kg) as peso, 
sum(spc_quantidade) as quantidade 
from  t_ficha_diaria
Left Join t_monitoramento on t_ficha_diaria.fd_id = t_monitoramento.mnt_id
Left Join t_varapesca on t_monitoramento.mnt_id = t_varapesca.mnt_id
Left Join t_varapesca_has_t_especie_capturada on t_varapesca.vp_id = t_varapesca_has_t_especie_capturada.vp_id
Inner Join t_especie on t_varapesca_has_t_especie_capturada.esp_id = t_especie.esp_id
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group By t_porto.pto_nome, t_especie.esp_nome, t_especie.esp_nome_comum, DATE_PART('month', t_ficha_diaria.fd_data), 
DATE_PART('year', t_ficha_diaria.fd_data);

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_projeto as
select 
porto.pto_nome, 
pescador.tp_nome,
projeto.tpr_descricao
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_arrastofundo as
select 
'Arrasto' as arte,
count(arrasto.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_arrastofundo as arrasto On pescador.tp_id = arrasto.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_calao as
select 
'Calão' as arte,
count(calao.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_calao as calao On pescador.tp_id = calao.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_coletamanual as
select 
'Coleta Manual' as arte,
count(coletamanual.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_coletamanual as coletamanual On pescador.tp_id = coletamanual.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_emalhe as
select 
'Emalhe' as arte,
count(emalhe.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_emalhe as emalhe On pescador.tp_id = emalhe.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_grosseira as
select 
'Grosseira' as arte,
count(grosseira.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_grosseira as grosseira On pescador.tp_id = grosseira.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_jerere as
select 
'Jereré' as arte,
count(jerere.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_jerere as jerere On pescador.tp_id = jerere.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_linha as
select 
'Linha' as arte,
count(linha.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_linha as linha On pescador.tp_id = linha.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_linhafundo as
select 
'Linha de Fundo' as arte,
count(linhafundo.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_linhafundo as linhafundo On pescador.tp_id = linhafundo.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_manzua as
select 
'Manzuá' as arte,
count(manzua.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_manzua as manzua On pescador.tp_id = manzua.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_mergulho as
select 
'Mergulho' as arte,
count(mergulho.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_mergulho as mergulho On pescador.tp_id = mergulho.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_ratoeira as
select 
'Ratoeira' as arte,
count(ratoeira.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_ratoeira as ratoeira On pescador.tp_id = ratoeira.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_siripoia as
select 
'Siripóia' as arte,
count(siripoia.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_siripoia as siripoia On pescador.tp_id = siripoia.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_tarrafa as
select 
'Tarrafa' as arte,
count(tarrafa.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_tarrafa as tarrafa On pescador.tp_id = tarrafa.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;

--/////////////////////////////////////////////////////////////////////////////////////////////////
Create or replace view v_pescadores_by_varapesca as
select 
'Vara de Pescar' as arte,
count(varapesca.tp_id_entrevistado) as quantidade
From t_pescador as pescador
Left Join t_pescador_has_t_porto on pescador.tp_id = t_pescador_has_t_porto.tp_id
Left Join t_porto as porto On t_pescador_has_t_porto.pto_id = porto.pto_id
Left Join t_projeto as projeto On pescador.tpr_id = projeto.tpr_id
Left Join t_varapesca as varapesca On pescador.tp_id = varapesca.tp_id_entrevistado
Group By porto.pto_nome, pescador.tp_nome,projeto.tpr_descricao
Order By porto.pto_nome, pescador.tp_nome;


zf create db-table VPescadorByArrasto v_pescadores_by_arrastofundo
zf create db-table VPescadorByCalao v_pescadores_by_calao
zf create db-table VPescadorByColetaManual v_pescadores_by_coletamanual
zf create db-table VPescadorByEmalhe v_pescadores_by_emalhe
zf create db-table VPescadorByGrosseira v_pescadores_by_grosseira
zf create db-table VPescadorByJerere v_pescadores_by_jerere
zf create db-table VPescadorByLinha v_pescadores_by_linha
zf create db-table VPescadorByLinhaFundo v_pescadores_by_linhafundo
zf create db-table VPescadorByManzua v_pescadores_by_manzua
zf create db-table VPescadorByMergulho v_pescadores_by_mergulho
zf create db-table VPescadorByRatoeira v_pescadores_by_ratoeira
zf create db-table VPescadorBySiripoia v_pescadores_by_siripoia
zf create db-table VPescadorByTarrafa v_pescadores_by_tarrafa
zf create db-table VPescadorByVaraPesca v_pescadores_by_varapesca
zf create db-table VPescadorByProjeto v_pescadores_by_projeto