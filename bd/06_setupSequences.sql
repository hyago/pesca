

insert into t_perfil (tp_id, tp_perfil)
select at.codigo, left(at.atividades, 40) from access.atividades as at;



Delete from t_usuario where id>9;
SELECT pg_catalog.setval(' t_login_tl_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_endereco_te_id_seq', 11000, true);
select import_user();

CREATE OR REPLACE FUNCTION import_user( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT CODIGO, NOME, cod_ativ, email, tel, cel FROM ACCESS.EQUIPE
LOOP
    INSERT INTO T_Endereco (TE_ID, TE_Logradouro, TE_Numero, TE_Bairro, TE_CEP, TE_Comp, TMun_ID)
        VALUES (nextval('t_endereco_te_id_seq'), NULL, NULL, NULL, NULL, NULL, 7);
    INSERT INTO T_Login (TL_ID, TL_Login, TL_HashSenha, TL_UltimoAcesso) 
        VALUES (nextval('t_login_tl_id_seq'), R.CODIGO, '80980fcaf2ab3f243874695f57b2ed065d8e67e4', NULL);
    INSERT INTO T_USUARIO (TU_ID, TU_NOME, TU_SEXO,TU_CPF,TU_RG, TU_EMAIL,TU_TELRES,TU_TELCEL, TL_ID,TP_ID,TE_ID)
        VALUES (R.CODIGO, R.NOME, 'M','1','1','r.email',r.tel,r.cel,currval('t_login_tl_id_seq'),r.cod_ativ,currval('t_endereco_te_id_seq'));
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;
--
-- --- Tem que ser no final do arquivo
-- select relname from pg_class where relkind='S' order by relname;
--
SELECT pg_catalog.setval(' t_areapesca_tareap_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_artepesca_tap_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_colonia_tc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_comunidade_tcom_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_endereco_te_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_escolaridade_esc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_especie_esp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_familia_fam_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_ficha_diaria_fd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_genero_gen_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_grupo_grp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_login_tl_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_monitoramento_mnt_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_municipio_tmun_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_ordem_ord_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_perfil_tp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pescador_has_tt_dependente_tptd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pescador_tp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_pesqueiro_af_paf_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_porteembarcacao_tpe_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_porto_pto_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_programasocial_prs_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_renda_ren_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_situacao_ts_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_subamostra_sa_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_telefonecontato_ttcont_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tempo_tmp_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipocapturada_itc_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipodependente_ttd_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipoembarcacao_tte_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tiporenda_ttr_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_tipotel_ttel_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_usuario_tu_id_seq', 11000, true);
SELECT pg_catalog.setval(' t_vento_vnt_id_seq', 11000, true);

