--Quantidade total de dias
Select distinct fd_data from t_ficha_diaria order by fd_data;
--Quantidade de dias por porto
Select distinct count(fd_data), pto_id from t_ficha_diaria group by pto_id order by pto_id;



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
Select count(t_arrastofundo.af_id), t_porto.pto_nome From t_arrastofundo 
Inner Join t_monitoramento on t_arrastofundo.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_calao.cal_id), t_porto.pto_nome From t_calao 
Inner Join t_monitoramento on t_calao.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_coletamanual.cml_id), t_porto.pto_nome From t_coletamanual 
Inner Join t_monitoramento on t_coletamanual.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_emalhe.em_id), t_porto.pto_nome From t_emalhe 
Inner Join t_monitoramento on t_emalhe.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_grosseira.grs_id), t_porto.pto_nome From t_grosseira
Inner Join t_monitoramento on t_grosseira.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_jerere.jre_id), t_porto.pto_nome From t_jerere
Inner Join t_monitoramento on t_jerere.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_linha.lin_id), t_porto.pto_nome From t_linha
Inner Join t_monitoramento on t_linha.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_linhafundo.lf_id), t_porto.pto_nome From t_linhafundo
Inner Join t_monitoramento on t_linhafundo.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_manzua.man_id), t_porto.pto_nome From t_manzua
Inner Join t_monitoramento on t_manzua.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_mergulho.mer_id), t_porto.pto_nome From t_mergulho
Inner Join t_monitoramento on t_mergulho.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_ratoeira.rat_id), t_porto.pto_nome From t_ratoeira
Inner Join t_monitoramento on t_ratoeira.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_siripoia.sir_id), t_porto.pto_nome From t_siripoia
Inner Join t_monitoramento on t_siripoia.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_tarrafa.tar_id), t_porto.pto_nome From t_tarrafa
Inner Join t_monitoramento on t_tarrafa.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;

Select count(t_varapesca.vp_id), t_porto.pto_nome From t_varapesca
Inner Join t_monitoramento on t_varapesca.mnt_id = t_monitoramento.mnt_id 
Inner Join t_ficha_diaria On t_monitoramento.fd_id = t_ficha_diaria.fd_id 
Inner Join t_porto On t_ficha_diaria.pto_id = t_porto.pto_id
Group by t_porto.pto_nome Order By t_porto.pto_nome;
