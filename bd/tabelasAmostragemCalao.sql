--Já está no servidor
Create or Replace View v_entrevistas As
SELECT 'Arrasto-Fundo' as artepesca,t_arrastofundo.af_id as id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_arrastofundo
   LEFT JOIN t_pescador ON t_arrastofundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_arrastofundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_arrastofundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Calão',t_calao.cal_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_calao
   LEFT JOIN t_pescador ON t_calao.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_calao.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_calao.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Coleta Manual',t_coletamanual.cml_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_coletamanual
   LEFT JOIN t_pescador ON t_coletamanual.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_coletamanual.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_coletamanual.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Emalhe', t_emalhe.em_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_emalhe
   LEFT JOIN t_pescador ON t_emalhe.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_emalhe.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_emalhe.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Espinhel/Groseira',t_grosseira.grs_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_grosseira
   LEFT JOIN t_pescador ON t_grosseira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_grosseira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_grosseira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Jereré',t_jerere.jre_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_jerere
   LEFT JOIN t_pescador ON t_jerere.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_jerere.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_jerere.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Pesca de Linha',t_linha.lin_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linha
   LEFT JOIN t_pescador ON t_linha.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linha.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linha.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Linha de Fundo',t_linhafundo.lf_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_linhafundo
   LEFT JOIN t_pescador ON t_linhafundo.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_linhafundo.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_linhafundo.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Manzuá',t_manzua.man_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_manzua
   LEFT JOIN t_pescador ON t_manzua.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_manzua.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_manzua.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Mergulho',t_mergulho.mer_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_mergulho
   LEFT JOIN t_pescador ON t_mergulho.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_mergulho.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_mergulho.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
 SELECT 'Ratoeira',t_ratoeira.rat_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_ratoeira
   LEFT JOIN t_pescador ON t_ratoeira.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_ratoeira.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_ratoeira.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Siripóia',t_siripoia.sir_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_siripoia
   LEFT JOIN t_pescador ON t_siripoia.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_siripoia.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_siripoia.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
SELECT 'Tarrafa',t_tarrafa.tar_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_tarrafa
   LEFT JOIN t_pescador ON t_tarrafa.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_tarrafa.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_tarrafa.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id
Union All
 SELECT 'Vara de Pesca',t_varapesca.vp_id, t_pescador.tp_nome, t_barco.bar_nome, 
    t_monitoramento.mnt_id, t_ficha_diaria.fd_id, t_pescador.tp_apelido
   FROM t_varapesca
   LEFT JOIN t_pescador ON t_varapesca.tp_id_entrevistado = t_pescador.tp_id
   LEFT JOIN t_barco ON t_varapesca.bar_id = t_barco.bar_id
   LEFT JOIN t_monitoramento ON t_varapesca.mnt_id = t_monitoramento.mnt_id
   LEFT JOIN t_ficha_diaria ON t_monitoramento.fd_id = t_ficha_diaria.fd_id;

Create or Replace View v_consultas_padrao As
Select 'Arrasto de Fundo' as consulta,count(t_arrastofundo.af_id) as quantidade, t_porto.pto_nome From t_arrastofundo 
Inner Join t_monitoramento on t_arrastofundo.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL

Select 'Calão',count(t_calao.cal_id), t_porto.pto_nome From t_calao 
Inner Join t_monitoramento on t_calao.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Coleta Manual',count(t_coletamanual.cml_id), t_porto.pto_nome From t_coletamanual 
Inner Join t_monitoramento on t_coletamanual.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Emalhe',count(t_emalhe.em_id), t_porto.pto_nome From t_emalhe 
Inner Join t_monitoramento on t_emalhe.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Grosseira',count(t_grosseira.grs_id), t_porto.pto_nome From t_grosseira
Inner Join t_monitoramento on t_grosseira.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Jereré',count(t_jerere.jre_id), t_porto.pto_nome From t_jerere
Inner Join t_monitoramento on t_jerere.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Linha',count(t_linha.lin_id), t_porto.pto_nome From t_linha
Inner Join t_monitoramento on t_linha.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome 
Union ALL
Select 'Linha de Fundo',count(t_linhafundo.lf_id), t_porto.pto_nome From t_linhafundo
Inner Join t_monitoramento on t_linhafundo.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome 
Union ALL
Select 'Manzuá',count(t_manzua.man_id), t_porto.pto_nome From t_manzua
Inner Join t_monitoramento on t_manzua.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Mergulho',count(t_mergulho.mer_id), t_porto.pto_nome From t_mergulho
Inner Join t_monitoramento on t_mergulho.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Ratoeira',count(t_ratoeira.rat_id), t_porto.pto_nome From t_ratoeira
Inner Join t_monitoramento on t_ratoeira.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Siripóia',count(t_siripoia.sir_id), t_porto.pto_nome From t_siripoia
Inner Join t_monitoramento on t_siripoia.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Tarrafa',count(t_tarrafa.tar_id), t_porto.pto_nome From t_tarrafa
Inner Join t_monitoramento on t_tarrafa.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union ALL
Select 'Vara de Pesca',count(t_varapesca.vp_id), t_porto.pto_nome From t_varapesca
Inner Join t_monitoramento on t_varapesca.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Right Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome
Union All
Select 'Monitoradas',sum(mnt_quantidade), NULL From t_monitoramento Where mnt_monitorado = TRUE
Union All
--Quantidade de monitoramentos não monitorados total
Select 'Não monitorados',sum(mnt_quantidade), NULL From t_monitoramento Where mnt_monitorado = FALSE
Union All
--Quantidade de Subamostras
Select 'Subamostras',count(sa_id), NULL From t_subamostra
Union all
Select 'Quantidade de Fichas',count(t_ficha_diaria.fd_data), t_porto.pto_nome from t_ficha_diaria 
Inner join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id group by t_porto.pto_nome;
