
----- PERFIL
insert into t_perfil (tp_id, tp_perfil)
select at.codigo, left(at.atividades, 40) from access.atividades as at;


-- USUÁRIOS
--Delete from t_usuario where id>9;
SELECT pg_catalog.setval(' t_login_tl_id_seq', 10, true);
SELECT pg_catalog.setval(' t_endereco_te_id_seq', 10, true);


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

select import_user();

-- -- Programa social
-- select count(*), prog_soc from access.pescador group by prog_soc order by prog_soc;
-- update access.pescador  set prog_soc=NULL where prog_soc='Não';
-- 
-- CREATE OR REPLACE FUNCTION import_psocial( ) returns int4 AS $$
-- DECLARE R RECORD;
-- declare ret int4;
-- BEGIN
-- FOR R IN SELECT prog_soc from access.pescador group by prog_soc order by prog_soc
-- LOOP
--     INSERT INTO t_programasocial(prs_id, prs_programa)
--         VALUES (nextval('t_programasocial_prs_id_seq'::regclass), r.prog_soc);
-- END LOOP;
-- RETURN ret;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- Escolaridade
select count(*), escolaridade from access.pescador group by escolaridade order by escolaridade;
update access.pescador  set escolaridade='Médio Completo' where escolaridade='médio completo' or escolaridade='Médio completo';
update access.pescador  set escolaridade='Fundamental Completo' where escolaridade='fundamental completo' or escolaridade='Fundamental completo';
update access.pescador  set escolaridade='Não Alfabetizado' where escolaridade='Não alfabetizado';
update access.pescador  set escolaridade='Não Declarado' where escolaridade ISNULL;

CREATE OR REPLACE FUNCTION import_escolaridade( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT escolaridade from access.pescador group by escolaridade order by escolaridade
LOOP
    INSERT INTO t_escolaridade(esc_id,esc_nivel)
        VALUES (nextval('t_escolaridade_esc_id_seq'::regclass), r.escolaridade);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

-- Renda
select count(*), renda from access.pescador group by renda order by renda;
update access.pescador  set renda='até 1/2 salário mínimo' where renda='200,00' or renda='220,00' or renda='300,00';
update access.pescador  set renda='de 1/2 a 1 salário mínimo' where renda='400,00' or renda='430,00' or renda='500,00' or renda='600,00';
update access.pescador  set renda='Subsistência' where renda='subsistência';
update access.pescador  set renda='maior que 5 salários mínimos' where renda='> 5 salários mínimos';
update access.pescador  set renda='Não Declarado' where renda ISNULL;

CREATE OR REPLACE FUNCTION import_renda( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT renda from access.pescador group by renda order by renda
LOOP
    INSERT INTO t_renda(ren_id, ren_renda)
        VALUES (nextval('t_renda_ren_id_seq'::regclass), r.renda);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

-- Responsável por cadastro
select responsavel_cadastramento from access.pescador where responsavel_cadastramento notnull order by responsavel_cadastramento;
select responsavel_cadastramento from access.pescador where responsavel_cadastramento like 'Tamires O%' or responsavel_cadastramento like 'TAMIRES O%' order by responsavel_cadastramento;
update access.pescador set responsavel_cadastramento='63' where responsavel_cadastramento like 'Taí%' or responsavel_cadastramento like 'Tai%' or responsavel_cadastramento like 'TAÍSSA%' or responsavel_cadastramento like 'TAISSA%';
update access.pescador set responsavel_cadastramento='45' where responsavel_cadastramento like 'Tamires O%' or responsavel_cadastramento like 'TAMIRES O%' ;
update access.pescador set responsavel_cadastramento='60' where responsavel_cadastramento like 'Andressa%' or responsavel_cadastramento like 'ANDRESSA%' 
or responsavel_cadastramento like 'Adressa%' or responsavel_cadastramento like 'Claúdia%' or responsavel_cadastramento like 'CLAUDIA%' or responsavel_cadastramento like 'Cláudia%'
or responsavel_cadastramento like 'Claudia%';
update access.pescador set responsavel_cadastramento='31' where responsavel_cadastramento like 'Joyce%' or responsavel_cadastramento like 'JOYCE%';
update access.pescador set responsavel_cadastramento='62' where responsavel_cadastramento like 'CARLA%' or responsavel_cadastramento like 'Carla%';
update access.pescador set responsavel_cadastramento='15' where responsavel_cadastramento like 'Alexsandro%' or responsavel_cadastramento like 'ALEXSANDO%';
update access.pescador set responsavel_cadastramento='16' where responsavel_cadastramento like 'Anderson%' or responsavel_cadastramento like 'ANDERSON%';
update access.pescador set responsavel_cadastramento='13' where responsavel_cadastramento ='Adriana Martins de Lima';

insert into access.equipe (codigo, nome) values (77,'AÍSSA HELENA');
update access.pescador set responsavel_cadastramento='77' where responsavel_cadastramento ='AÍSSA HELENA';
update access.pescador set responsavel_cadastramento='20' where responsavel_cadastramento ='APOLO';
update access.pescador set responsavel_cadastramento='21' where responsavel_cadastramento like 'CLEBERSON%' or responsavel_cadastramento like 'Cleberson%';
update access.pescador set responsavel_cadastramento='50' where responsavel_cadastramento like 'VANDERLEI%' or responsavel_cadastramento like 'Vanderlei%';
update access.pescador set responsavel_cadastramento='61' where responsavel_cadastramento like 'VALÉRIA%' or responsavel_cadastramento like 'Valéria%'or responsavel_cadastramento like 'VALERIA%';
update access.pescador set responsavel_cadastramento='49' where responsavel_cadastramento like 'Uilas%' or responsavel_cadastramento like 'UILAS%';
update access.pescador set responsavel_cadastramento='48' where responsavel_cadastramento like 'Uellington%';
update access.pescador set responsavel_cadastramento='46' where responsavel_cadastramento like 'TATIANO%' or responsavel_cadastramento like 'TATIANA%' or responsavel_cadastramento like 'Tatiana%';
update access.pescador set responsavel_cadastramento='55' where responsavel_cadastramento like 'TAYNÁ%';
update access.pescador set responsavel_cadastramento='45' where responsavel_cadastramento like 'Tamires%';
update access.pescador set responsavel_cadastramento='44' where responsavel_cadastramento like 'TALISSON%';
update access.pescador set responsavel_cadastramento='42' where responsavel_cadastramento like 'SILAS%' or responsavel_cadastramento like '? SANTOS SILVA%' or responsavel_cadastramento like 'Silas%';

update access.pescador set responsavel_cadastramento='54' where responsavel_cadastramento like 'ROON%' or responsavel_cadastramento like 'Roon%'or responsavel_cadastramento like 'RON%' or responsavel_cadastramento like 'Ron%';
update access.pescador set responsavel_cadastramento='41' where responsavel_cadastramento like 'Ramires%' or responsavel_cadastramento like 'RAMIRES%';
update access.pescador set responsavel_cadastramento='40' where responsavel_cadastramento like 'NUBIA%' or responsavel_cadastramento like 'Núbia%' or responsavel_cadastramento like 'NÚBIA%';

update access.pescador set responsavel_cadastramento='39' where responsavel_cadastramento like 'MARCOS VINICIUS%' or responsavel_cadastramento like 'Marcos Vinicius%'or responsavel_cadastramento like ' MARCOS  VINICIUS%' 
or responsavel_cadastramento like 'Marcus Vinicius%' or responsavel_cadastramento like 'MARCOS%'or responsavel_cadastramento like 'Mário%';
update access.pescador set responsavel_cadastramento='64' where responsavel_cadastramento like 'Marcio%' or responsavel_cadastramento like 'MÁRCIO%'or responsavel_cadastramento like 'Márcio%'or responsavel_cadastramento like 'MARCIO%';

insert into access.equipe (codigo, nome) values (78,'Márcia');
update access.pescador set responsavel_cadastramento='78' where responsavel_cadastramento like 'Márcia%' or responsavel_cadastramento like 'Marcia%';

insert into access.equipe (codigo, nome) values (79,'Nilson');
update access.pescador set responsavel_cadastramento='79' where responsavel_cadastramento like 'Nilson%';
update access.pescador set responsavel_cadastramento='66' where responsavel_cadastramento like 'MARCELO%' or responsavel_cadastramento like 'Marcelo%';

update access.pescador set responsavel_cadastramento='37' where responsavel_cadastramento like 'Luciano Martins%' or responsavel_cadastramento like 'LUCIANO MARQUES%'
 or responsavel_cadastramento like ' LUCIANO MARQUES%'or responsavel_cadastramento like 'Luciano Marques%'or responsavel_cadastramento like 'Luciano dos Santos%';

update access.pescador set responsavel_cadastramento='36' where responsavel_cadastramento like 'LUCIANO%' or responsavel_cadastramento like 'Luciano%';

update access.pescador set responsavel_cadastramento='35' where responsavel_cadastramento like 'Letícia%' or responsavel_cadastramento like 'LETICIA%';
update access.pescador set responsavel_cadastramento='34' where responsavel_cadastramento like 'JUVAN%' or responsavel_cadastramento like 'Juvan%';
update access.pescador set responsavel_cadastramento='33' where responsavel_cadastramento like 'Juliano%';

update access.pescador set responsavel_cadastramento='32' where responsavel_cadastramento like 'JOSÉ%' or responsavel_cadastramento like 'José%'or responsavel_cadastramento like 'Jose%';
update access.pescador set responsavel_cadastramento='31' where responsavel_cadastramento like 'JOICE%';
update access.pescador set responsavel_cadastramento='29' where responsavel_cadastramento like 'JAILTON%' or responsavel_cadastramento like 'Jailton%';
update access.pescador set responsavel_cadastramento='27' where responsavel_cadastramento like 'HUAN%' or responsavel_cadastramento like 'Huan%';

update access.pescador set responsavel_cadastramento='25' where responsavel_cadastramento like 'Eliana%' or responsavel_cadastramento like 'ELIANA%';
update access.pescador set responsavel_cadastramento='59' where responsavel_cadastramento like 'DIEGO%' or responsavel_cadastramento like 'Diego%';

insert into access.equipe (codigo, nome) values (80,'Débora Bluhu');
update access.pescador set responsavel_cadastramento='80' where responsavel_cadastramento like 'Débora%' or responsavel_cadastramento like 'DÉBORA%'or responsavel_cadastramento like 'Debora%'or responsavel_cadastramento like 'DEBORA%';

update access.pescador set responsavel_cadastramento='22' where responsavel_cadastramento like 'DANILA%' or responsavel_cadastramento like 'Danila%';
update access.pescador set responsavel_cadastramento='20' where responsavel_cadastramento like '%Apolo';

insert into access.equipe (codigo, nome) values (81,'Cristiane de Jesus');
update access.pescador set responsavel_cadastramento='81' where responsavel_cadastramento like 'Cristiane de Jesus%';


update access.pescador set responsavel_cadastramento='18' where responsavel_cadastramento like '%LOBO%'or responsavel_cadastramento like '%Lobo%'or responsavel_cadastramento like 'ANTÔNIO N.%'or responsavel_cadastramento like 'Antonio N.%'
or responsavel_cadastramento like '%ANTONIO A.';
update access.pescador set responsavel_cadastramento='19' where responsavel_cadastramento like '%Filho' or responsavel_cadastramento like '%SANTOS'or responsavel_cadastramento like '%FILHO';
update access.pescador set responsavel_cadastramento='17' where responsavel_cadastramento like 'Antonio Maicon%';

update access.pescador set responsavel_cadastramento='18' where responsavel_cadastramento like 'Ant%' or responsavel_cadastramento like 'ANT%';






-- FICHA DIÁRIA
insert into t_ficha_diaria (fd_id, t_estagiario_tu_id, t_monitor_tu_id1, fd_data, fd_turno, obs, pto_id, tmp_id, vnt_id)
select fd.cod_ficha, cast(fd.estagiario as int8), cast(fd.monitor as int8), fd.data, case to_char(fd.horach, 'AM') when 'AM' then 'M' else 'V' end, left(fd.obs, 255), fd.porto_de_desembarque, tmp.tmp_id, vnt.vnt_id 
from access.ficha_diaria as fd, t_vento as vnt, t_tempo as tmp
where fd.vento = vnt.vnt_forca and
fd.tempo = tmp.tmp_estado;


-- Exemplo original
-- SELECT p.p_name, a.activity, a.category
-- FROM people As p 
--   LEFT JOIN lu_activities AS a ON(';' || p.activities || ';' LIKE '%;' || a.activity || ';%')
-- ORDER BY p,p_name, a.category, a.activity;

--arte de pesca
select tap_id, tap_artepesca from t_artepesca;

select codigo, arte_pesca from access.pescador;

SELECT pesc.codigo, pesc.arte_pesca, arte.tap_artepesca, arte.tap_id
FROM access.pescador As pesc 
    INNER JOIN t_artepesca AS arte ON(';' || pesc.arte_pesca || ';' LIKE '%;' || arte.tap_artepesca || ';%')
ORDER BY pesc.codigo, arte.tap_id, arte.tap_artepesca;

-- tipo dependente
select ttd_id, ttd_tipodependente from t_tipodependente;

select codigo, dependente from access.pescador;

SELECT pesc.codigo, pesc.dependente, dep.ttd_tipodependente, dep.ttd_id
FROM access.pescador As pesc 
    INNER JOIN t_tipodependente AS dep ON(';' || pesc.dependente || ';' LIKE '%;' || dep.ttd_tipodependente || ';%')
ORDER BY pesc.codigo, dep.ttd_id, dep.ttd_tipodependente;


-- tipo capturada
select itc_id, itc_tipo from t_tipocapturada;

select codigo, sp_capt from access.pescador;

SELECT pesc.codigo, pesc.sp_capt, cap.itc_tipo, cap.itc_id
FROM access.pescador As pesc 
    INNER JOIN t_tipocapturada AS cap ON(';' || pesc.sp_capt || ';' LIKE '%;' || cap.itc_tipo || ';%')
ORDER BY pesc.codigo, cap.itc_id, cap.itc_tipo;

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



CREATE OR REPLACE FUNCTION IMPORT_PESCADOR( ) RETURNS INT4 AS $$
DECLARE R RECORD;
DECLARE RET INT4;
BEGIN
FOR R IN SELECT 
CODIGO, NOME, SEXO, MATRICULA, APELIDO,
PAI, MAE, CTPS, PIS, INSS,
CEI, RG, RGP, CIR, CPF, DT_NASC,
NATURALIDADE, ESPECIFICIDADE, ESCOLARIDADE, DATA_INSC, RESPONSAVEL_LANCAMENTO,
RESPONSAVEL_CADASTRAMENTO, DATA_CADASTRO, P.MUNICIPIO, M.TMUN_ID AS MUN, P.NATURALIDADE, M2.TMUN_ID AS NAT, M2.TMUN_MUNICIPIO, OBS, ESC.ESC_ID AS ESCID, RUA, BAIRRO
FROM ACCESS.PESCADOR AS P
LEFT JOIN T_MUNICIPIO AS M 
ON  P.MUNICIPIO=M.TMUN_MUNICIPIO
LEFT JOIN T_MUNICIPIO AS M2
ON  P.NATURALIDADE=M2.TMUN_MUNICIPIO
LEFT JOIN T_ESCOLARIDADE AS ESC
ON  P.ESCOLARIDADE=ESC.ESC_NIVEL
LOOP
    INSERT INTO T_ENDERECO ( TE_ID, TE_LOGRADOURO,TE_NUMERO,TE_BAIRRO,TE_CEP,TE_COMP,TMUN_ID)
        VALUES (NEXTVAL('T_ENDERECO_TE_ID_SEQ'),R.RUA,NULL,R.BAIRRO,NULL,NULL,R.MUN);
    
    INSERT INTO  T_PESCADOR (TP_ID,TP_NOME,TP_SEXO,TP_MATRICULA,TP_APELIDO,
            TP_FILIACAOPAI,TP_FILIACAOMAE,TP_CTPS,TP_PIS,TP_INSS,TP_NIT_CEI,
            TP_RG, TP_CMA,TP_RGB_MAA_IBAMA,TP_CIR_CAP_PORTO,TP_CPF,
            TP_DATANASC,TMUN_ID_NATURAL,TE_ID,TP_ESPECIFICIDADE,
            ESC_ID,TP_RESP_LAN,TP_RESP_CAD,TP_DTA_CAD,TP_OBS)
        VALUES (R.CODIGO,left(R.NOME,60),left(R.SEXO,1),R.MATRICULA,R.APELIDO,
            left(R.PAI,60), left(R.MAE,60),R.CTPS,R.PIS,R.INSS,R.CEI,
            R.RG,NULL,R.RGP,R.CIR,R.CPF,
            TO_DATE(R.DT_NASC, 'DD/MM/YYYY'),R.NAT,CURRVAL('T_ENDERECO_TE_ID_SEQ'),R.ESPECIFICIDADE,
            R.ESCID,to_number(R.RESPONSAVEL_LANCAMENTO,'999'),to_number(R.RESPONSAVEL_CADASTRAMENTO,'999'),TO_DATE(R.DATA_CADASTRO, 'DD/MM/YYYY'),R.OBS);
END LOOP;
RETURN RET;
END;
$$ LANGUAGE PLPGSQL;

select codigo, nome, sexo, matricula, apelido, pai,mae,ctps,pis,inss,cei,rg, rgp,cir,cpf,dt_nasc,naturalidade, 
especificidade, escolaridade, data_insc, responsavel_lancamento,responsavel_cadastramento,data_cadastro, p.municipio,
 m.tmun_id, p.naturalidade, m2.tmun_id, m2.tmun_municipio, esc.esc_id
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio
left join t_escolaridade as esc
on  p.escolaridade=esc.esc_nivel;


select codigo, p.municipio, m.tmun_id, p.naturalidade, m2.tmun_id, m2.tmun_municipio as nat, p.escolaridade, esc.esc_nivel, esc.esc_id
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio
left join t_escolaridade as esc
on  p.escolaridade=esc.esc_nivel;

SELECT pg_catalog.setval(' t_endereco_te_id_seq', 11000, true);

select codigo, m.tmun_id, p.municipio,  m2.tmun_id, p.naturalidade
from access.pescador as p
left join t_municipio as m 
on  p.municipio=m.tmun_municipio
left join t_municipio as m2
on  p.naturalidade=m2.tmun_municipio;

update access.pescador set municipio='Uruçuca' where municipio like 'Serra Grande%' or municipio like 'Serra Grsande-Uruçuca%';
update access.pescador set municipio='Ilhéus' where municipio like 'ILHÉUS%' or municipio like 'Ilhéusx%';


update access.pescador set naturalidade='Una' where naturalidade like 'Uma%' ;
update access.pescador set naturalidade='Itabuna' where naturalidade like 'ITABUNA%' ;
update access.pescador set naturalidade='Ituberá' where naturalidade like 'ITUBERÁ%' ;
update access.pescador set naturalidade='Camamu' where naturalidade like 'CAMAMU%' or naturalidade like 'Camacau%'or naturalidade like 'Camumu%';
update access.pescador set naturalidade='Iramaia' where naturalidade like 'IRAMAIA/BA%' ;
update access.pescador set naturalidade='Maraú' where naturalidade like 'MARAÚ%' ;
update access.pescador set naturalidade='Jaquacuara' where naturalidade like 'JAQUACUARA%' ;
update access.pescador set naturalidade='Conceição Do Almeida' where naturalidade like 'Conceição do Almeida%' ;
update access.pescador set naturalidade='Vitorino Freire' where naturalidade like 'VITORINO FREIRE%' ;
update access.pescador set naturalidade='São José Dos Campos' where naturalidade like 'São José dos Campos%' ;
update access.pescador set naturalidade='Neopolis' where naturalidade like 'Neopolis%';
update access.pescador set naturalidade='Canavieiras' where naturalidade like 'Canavieras%' ;
update access.pescador set naturalidade='Catú' where naturalidade like 'Cairu%' ;
update access.pescador set naturalidade='Piacabucu' where naturalidade like 'PIAÇABUÇU%' ;
update access.pescador set naturalidade='Itacaré' where naturalidade like 'ITACARÉ%' ;
update access.pescador set naturalidade='Duque De Caxias' where naturalidade like 'Duque de Caxias%' ;
update access.pescador set naturalidade='Macambira' where naturalidade like 'Macambira%' ;
update access.pescador set naturalidade='Itaju Da Colônia' where naturalidade like 'Itaju da Colônia%' ;
update access.pescador set naturalidade='Uruçuca' where naturalidade like 'URUÇUCA%'or naturalidade like 'uruçuca%';
update access.pescador set naturalidade='Ilhéus' where naturalidade like 'ILHÉUS%'or naturalidade like 'ilhéus%';
update access.pescador set naturalidade='Osasco' where naturalidade like 'Osasco%';
update access.pescador set naturalidade='Caravelas' where naturalidade like 'Caravelas%';

update access.pescador set naturalidade='' where naturalidade like '%' or naturalidade like '%';


select codigo, m.tmun_id, p.municipio
from access.pescador as p, t_municipio as m 
where
p.municipio=m.tmun_municipio;

select codigo, m2.tmun_id, p.naturalidade
from access.pescador as p, t_municipio as m2
where
p.naturalidade=m2.tmun_municipio;


insert into t_escolaridade values (0, 'Não Declarado');
insert into t_renda (ren_id, ren_renda) values (0, 'Não Declarado');

insert into t_pescador_has_telefone (tpt_tp_id, tpt_ttel_id, tpt_telefone )
select codigo, '2', cel from access.pescador where cel notnull order by codigo;

insert into t_pescador_has_telefone (tpt_tp_id, tpt_ttel_id, tpt_telefone )
select codigo, '1', tel from access.pescador where tel notnull order by codigo;

select codigo, area_pesca from access.pescador where area_pesca notnull order by codigo;

select codigo, area_pesca from access.pescador where area_pesca='';
update access.pescador set area_pesca=NULL where area_pesca='';
select * from t_areapesca;


SELECT pesc.codigo, pesc.area_pesca, area.tareap_id, area.tareap_areapesca
FROM access.pescador As pesc 
    INNER JOIN t_areapesca AS area ON(';' || pesc.area_pesca || ';' LIKE '%;' || area.tareap_areapesca || ';%')
ORDER BY pesc.codigo, area.tareap_id, area.tareap_areapesca;

insert into t_pescador_has_t_areapesca ( tp_id, tareap_id)
SELECT pesc.codigo, area.tareap_id
FROM access.pescador As pesc 
    INNER JOIN t_areapesca AS area ON(';' || pesc.area_pesca || ';' LIKE '%;' || area.tareap_areapesca || ';%')
ORDER BY pesc.codigo, area.tareap_id, area.tareap_areapesca;


select * from t_artepesca;

insert into T_PESCADOR_HAS_T_ARTEPESCA (TP_ID, TAP_ID)
SELECT pesc.codigo, arte.tap_id 
FROM access.pescador As pesc 
    INNER JOIN t_artepesca AS arte ON(';' || pesc.arte_pesca || ';' LIKE '%;' || arte.tap_artepesca || ';%')
ORDER BY pesc.codigo, arte.tap_id, arte.tap_artepesca;




insert into T_PESCADOR_HAS_T_TIPOCAPTURADA (TP_ID, ITC_ID)
SELECT pesc.codigo, tipo.itc_id
FROM access.pescador As pesc 
    INNER JOIN t_tipocapturada AS tipo ON(';' || pesc.sp_capt || ';' LIKE '%;' || tipo.itc_tipo || ';%')
ORDER BY pesc.codigo, tipo.itc_id, tipo.itc_tipo;


select * from T_PESCADOR_HAS_T_EMBARCACAO

insert into T_PESCADOR_HAS_T_EMBARCACAO (tp_id, tte_id, tpe_id, tpte_motor, tpte_dono)
SELECT pesc.codigo, tipo.tte_id, porte.tpe_id, case pesc.motor_embarc when 1 then true else false end, pesc.prop_embarc
FROM access.pescador As pesc 
    INNER JOIN t_tipoembarcacao AS tipo ON(';' || pesc.tipo_embarc || ';' LIKE '%;' || tipo.tte_tipoembarcacao || ';%')
    left join T_PORTEEMBARCACAO as porte on  pesc.tam_ambarc=porte.tpe_porte
ORDER BY pesc.codigo, tipo.tte_id, tipo.tte_tipoembarcacao; 



select count(*), colonia from access.pescador group by colonia;
update access.pescador set colonia='A-87' where colonia like 'Associação de São Miguel (A-87)%' ;

insert into t_pescador_has_t_colonia (tp_id, tc_id, tptc_datainsccolonia)
select p.codigo, col.tc_id, TO_DATE(p.data_insc, 'DD/MM/YYYY')
from access.pescador as p
inner join t_colonia as col on p.colonia=col.tc_nome;




-- tipo-renda
select count(*), qual from access.pescador group by qual order by qual;
update access.pescador set qual='Agricultor(a)' where qual='AGRICOLA' or qual='Agricultor' or qual='AGRICULTOR' or qual='AGRICULTURA';
update access.pescador set qual='Aposentado(a)' where qual='Aposentado' or qual='aposentado' or qual='Aposentadoria' or qual='APOSENTADORIA';
update access.pescador set qual='Pensionista' where qual like'Pensão%' or qual like'PENSÃO%' or qual='Pensionista' ;
update access.pescador set qual='Artesão' where qual='Artesão' or qual='Artesanato' or qual='artesão' or qual='Atersão';
update access.pescador set qual='Vendedor(a)' where qual like'Vende%';
update access.pescador set qual='Auxiliar de Construção Cívil' where 
qual='Ajudante de pedreiro' or qual='AJUDANTE DE PEDREIRO' or qual='Ajudante de pintor' or qual='Auxiliar de pedreiro' or qual='AUX. CARPINTEIRO' or qual='Servente'or qual='SERVENTE'or qual='servente de pedreiro';
update access.pescador set qual='Aluguel' where qual='' or qual='Aluga uma casa' or qual like'Aluguel%';
update access.pescador set qual='Construção Cívil' where qual='pedreiro' or qual='Pedreiro' or qual='PEDREIRO' or qual='Pintor' or qual='PINTOR' or qual='Carpinteiro'or qual='CARPINTEIRO' or qual='Construção Civil' or qual='MARCENEIRO';
update access.pescador set qual='Trabalhador(a) autônomo(a)/Diarista' 
where qual='Autônoma' or qual='AUTÔNOMA' or qual='AUTÔNOMO' or qual='AUTONÔMO' or qual='Ambulante' or qual='Avulso' or qual='BICOS' or qual='Biscateiro' or qual='diarista' or qual='DIARISTA' or qual='DIARISTA E TRABALHA NA PRAIA' 
or qual='Faxineira' or qual='FAXINEIRA' or qual='Faz bico' or qual='Faz \"bicos\".' or qual='Faz biscate' or qual='Faz faxina e lava roupa pra fora' or qual like'Bic%' or qual='R$ 245' 
or qual='Rende R$ 678,00'or qual='Tira coco pra vender' or qual='200,00' or qual='Ajudante' or qual='or qual='''or qual='SALGADINHOS'or qual='Tem uma horta'or qual='Trabalha com horta' or qual='Atravessador. Trabalho Expresso (Rio Cachoeira)'
or qual='confecciona redes' or qual='fabrica bombas' or qual='ROÇAGEM' or qual='Instalação de Antena';
update access.pescador set qual='Diarista/Faxineiro(a)' where qual='Ás vezes Faxina' or qual='Diarista' or qual='LAVA ROUPA PARA FORA';
update access.pescador set qual='Doméstico(a)/Caseiro(a)' where qual='caseiro' or qual='Caseiro' or qual='DOMÉSTICA' or qual='Doméstica';
update access.pescador set qual='Cabelereiro(a)/Manicure' where qual='CABELEREIRO' or qual='Manicure';
update access.pescador set qual='Vendedor(a)' where qual like'vende%' or  qual like'VENDE%';
update access.pescador set qual='Revendedor(a)' where qual like'REVENDE%';
update access.pescador set qual='Motorista' where qual='Motorista' or qual like'MOTORISTA%';
update access.pescador set qual='Turismo' where qual='GUIA TURÍSTICO' or qual like'TURISMO%';
update access.pescador set qual='Serviço Geral' where qual='SERVIÇO GERAL' or qual='SERVIÇOS GERAIS';
update access.pescador set qual='Sindicato' where qual like 'Sindicato%' ;
update access.pescador set qual='Comercializa Peixes/Frutos do Mar/Mariscos' where qual like 'Comercializa%' or qual like 'COMERCIALIZA%' or qual='venda de pescado';
update access.pescador set qual='Comerciante de Praia' where qual like '%praia%' or qual like '%Praia%';
update access.pescador set qual='Feirante' where qual like '%eirante%' or qual='TRABALHA COM MARISCO NA FEIRA';
update access.pescador set qual='Comerciante' where qual='Bar' or qual='BAR' or qual='Comerciante' or qual='COMERCIANTE'or qual='POSSUI UM BAR'or qual='PROPRIETRIO DE BAR'or qual='Quintadeira'or qual='Tem um bar'or qual='Mercearia';
update access.pescador set qual='Agricultor(a)' where qual='Trabalha na roça' or qual='TRABALHA NA ROÇA' or qual='Trabalha no sítio' or qual='Roça'or qual='ROÇA'or qual='ROÇA PRÓPRIA'or qual='tem uma rocinha';
update access.pescador set qual='Trabalho Assalariado' where qual='ASSALARIADO' or qual like 'Trabalha em um%' or qual like 'Trabalha n%' or qual ='Ass. Porto de Trás';
update access.pescador set qual=NULL where qual='NÃO' or qual='não' or qual='Ilegível no cadastro';
update access.pescador set qual='Estágio/Monitoria' where qual='MONITOR DE PESCA (MPESCA)' or qual='Pesquisador de desembarque pesqueiro' ;
update access.pescador set qual='Peeiro(a)' where qual='Peeiro' or qual='PEEIRO';
update access.pescador set qual='Marisqueira(o)' where qual='MARISCAGEM' or qual='Marisqueira' ;
update access.pescador set qual='Fileta camarão' where qual='Fileta camarão' or qual='FILETA CAMARÃO' or qual LIKE 'Fileta camarão%';
update access.pescador set qual='Servidor(a) Público(a)' where qual='Servidora Pública' or qual='Servidor Público Municipal (R$ 1190,00)'or qual='Funcionária municipal' or qual='Funcionário Público';
update access.pescador set qual='Portuário/Embarcado' where qual='Portuário' or qual='Trabalha embarcado';

CREATE OR REPLACE FUNCTION import_trenda( ) returns int4 AS $$
DECLARE R RECORD;
declare ret int4;
BEGIN
FOR R IN SELECT qual from access.pescador where qual notnull group by qual order by qual
LOOP
    INSERT INTO t_tiporenda(ttr_id, ttr_descricao)
        VALUES (nextval('t_tiporenda_ttr_id_seq'::regclass), r.qual);
END LOOP;
RETURN ret;
END;
$$ LANGUAGE PLPGSQL;

SELECT pg_catalog.setval(' t_tiporenda_ttr_id_seq'::regclass, 10, true);

insert into t_pescador_has_t_renda (tp_id, ren_id, ttr_id)
select p.codigo, renda.ren_id, '1'
from access.pescador as p
left join t_renda as renda on p.renda=renda.ren_renda;

insert into t_pescador_has_t_renda (tp_id, ren_id, ttr_id)
select p.codigo, '0', tren.ttr_id
from access.pescador as p
left join t_tiporenda as tren on p.qual=tren.ttr_descricao
where p.qual notnull;





update access.pescador set prog_soc=NULL where prog_soc='Não%';


insert into t_pescador_has_t_programasocial ( tp_id, prs_id)
select p.codigo, ps.prs_id
from access.pescador as p
left join t_programasocial as ps on p.prog_soc=ps.prs_programa
where p.prog_soc notnull;



-- tipo dependente
select ttd_id, ttd_tipodependente from t_tipodependente;

select codigo, dependente from access.pescador;

insert into t_pescador_has_t_tipodependente (tp_id, ttd_id, tptd_quantidade)
SELECT pesc.codigo, dep.ttd_id, cast(pesc.n_dependentes as int8)
FROM access.pescador As pesc 
    INNER JOIN t_tipodependente AS dep ON(';' || pesc.dependente || ';' LIKE '%;' || dep.ttd_tipodependente || ';%')
ORDER BY pesc.codigo, dep.ttd_id, dep.ttd_tipodependente;

select * from t_pescador_has_t_tipodependente order by tp_id, ttd_id;

update t_pescador_has_t_tipodependente set tptd_quantidade=1 where ttd_id=1;

insert into t_comunidade ( tcom_id, tcom_nome) 
select codigo, comunidade from access.comunidade;


select tp_id, tcom_id from t_pescador_has_t_comunidade;

insert into t_pescador_has_t_comunidade (tp_id, tcom_id)
select codigo, cast(comunidade as int8) from access.pescador where comunidade notnull order by codigo;



select codigo, comunidade from access.pescador where comunidade notnull;
select * from t_pescador_has_t_comunidade;

insert into t_pescador_has_t_comunidade (tp_id, tcom_id)
select codigo, cast(comunidade as int8) from access.pescador where comunidade notnull;

insert into T_PESCADOR_HAS_T_PORTO (TP_ID, PTO_ID)
select codigo, cod_pdesemb from access.pescador where cod_pdesemb notnull;