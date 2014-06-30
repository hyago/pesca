CREATE OR REPLACE VIEW v_entrevista_arrasto AS 
 SELECT t_arrastofundo.af_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_arrastofundo
   LEFT JOIN t_pescador ON t_arrastofundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_arrastofundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_arrastofundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_calao AS 
 SELECT t_calao.cal_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_calao
   LEFT JOIN t_pescador ON t_calao.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_calao.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_calao.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_coletamanual AS 
 SELECT t_coletamanual.cml_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_coletamanual
   LEFT JOIN t_pescador ON t_coletamanual.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_coletamanual.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_coletamanual.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_emalhe AS 
 SELECT t_emalhe.em_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_emalhe
   LEFT JOIN t_pescador ON t_emalhe.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_emalhe.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_emalhe.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_grosseira AS 
 SELECT t_grosseira.grs_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_grosseira
   LEFT JOIN t_pescador ON t_grosseira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_grosseira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_grosseira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_jerere AS 
 SELECT t_jerere.jre_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_jerere
   LEFT JOIN t_pescador ON t_jerere.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_jerere.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_jerere.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_linha AS 
 SELECT t_linha.lin_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linha
   LEFT JOIN t_pescador ON t_linha.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linha.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linha.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_linhafundo AS 
 SELECT t_linhafundo.lf_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linhafundo
   LEFT JOIN t_pescador ON t_linhafundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linhafundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linhafundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_manzua AS 
 SELECT t_manzua.man_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_manzua
   LEFT JOIN t_pescador ON t_manzua.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_manzua.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_manzua.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_mergulho AS 
 SELECT t_mergulho.mer_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_mergulho
   LEFT JOIN t_pescador ON t_mergulho.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_mergulho.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_mergulho.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_ratoeira AS 
 SELECT t_ratoeira.rat_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_ratoeira
   LEFT JOIN t_pescador ON t_ratoeira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_ratoeira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_ratoeira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_siripoia AS 
 SELECT t_siripoia.sir_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_siripoia
   LEFT JOIN t_pescador ON t_siripoia.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_siripoia.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_siripoia.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;


CREATE OR REPLACE VIEW v_entrevista_varapesca AS 
 SELECT t_varapesca.vp_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_varapesca
   LEFT JOIN t_pescador ON t_varapesca.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_varapesca.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_varapesca.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

CREATE OR REPLACE VIEW v_entrevista_tarrafa AS 
 SELECT t_tarrafa.tar_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_tarrafa
   LEFT JOIN t_pescador ON t_tarrafa.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_tarrafa.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_tarrafa.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;
