--Quantidade total de dias
Select distinct fd_data from t_ficha_diaria order by fd_data;
--Quantidade de dias por porto
Select distinct count(t_ficha_diaria.fd_data), t_porto.pto_nome from t_ficha_diaria 
Inner join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id group by t_porto.pto_nome order by t_porto.pto_nome;

Select distinct t_ficha_diaria.fd_data, t_porto.pto_nome from t_ficha_diaria 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id order by t_ficha_diaria.fd_data;

--Quantidade de entrevistas por arte de pesca
Select count(af_id) from t_arrastofundo;
Select count(cal_id) from t_calao;
Select count(cml_id) from t_coletamanual;
Select count(em_id) from t_emalhe;
Select count(grs_id) from t_grosseira;
Select count(jre_id) from t_jerere;
Select count(lin_id) from t_linha;
Select count(lf_id) from t_linhafundo;
Select count(man_id) from t_manzua;
Select count(mer_id) from t_mergulho;
Select count(rat_id) from t_ratoeira;
Select count(sir_id) from t_siripoia;
Select count(tar_id) from t_tarrafa;
Select count(vp_id) from t_varapesca;

--Quantidade de monitoramentos total
Select sum(mnt_quantidade) From t_monitoramento Where mnt_monitorado = TRUE;

--Quantidade de monitoramentos não monitorados total
Select sum(mnt_quantidade) From t_monitoramento Where mnt_monitorado = FALSE;

--Quantidade de Subamostras
Select count(sa_id) From t_subamostra;

--Quantidade de entrevistas por porto
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










--Entrevists
Select Count(pto_id) from t_porto;
Select Count(paf_id) from t_pesqueiro_af;
Select Count(tu_id) from t_usuario;
Select Count(bar_id) from t_barco;
Select Count(tp_id) from t_pescador where tp_pescadordeletado=false;
Select Count(fd_id) from t_ficha_diaria;
Select count(af_id) from t_arrastofundo;
Select count(cal_id) from t_calao;
Select count(cml_id) from t_coletamanual;
Select count(em_id) from t_emalhe;
Select count(grs_id) from t_grosseira;
Select count(jre_id) from t_jerere;
Select count(lin_id) from t_linha;
Select count(lf_id) from t_linhafundo;
Select count(man_id) from t_manzua;
Select count(mer_id) from t_mergulho;
Select count(rat_id) from t_ratoeira;
Select count(sir_id) from t_siripoia;
Select count(tar_id) from t_tarrafa;
Select count(vp_id) from t_varapesca;
Select count(esp_id) from t_especie;

Select count(spc_af_id) from t_arrastofundo_has_t_especie_capturada;
Select count(spc_cal_id) from t_calao_has_t_especie_capturada;
Select count(spc_cml_id) from t_coletamanual_has_t_especie_capturada;
Select count(spc_em_id) from t_emalhe_has_t_especie_capturada;
Select count(spc_grs_id) from t_grosseira_has_t_especie_capturada;
Select count(spc_jre_id) from t_jerere_has_t_especie_capturada;
Select count(spc_lin_id) from t_linha_has_t_especie_capturada;
Select count(spc_lf_id) from t_linhafundo_has_t_especie_capturada;
Select count(spc_man_id) from t_manzua_has_t_especie_capturada;
Select count(spc_mer_id) from t_mergulho_has_t_especie_capturada;
Select count(spc_rat_id) from t_ratoeira_has_t_especie_capturada;
Select count(spc_sir_id) from t_siripoia_has_t_especie_capturada;
Select count(spc_tar_id) from t_tarrafa_has_t_especie_capturada;
Select count(spc_vp_id) from t_varapesca_has_t_especie_capturada;