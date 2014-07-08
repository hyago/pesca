CREATE OR REPLACE VIEW v_subamostra AS
 SELECT t_subamostra.sa_id, t_pescador.tp_nome, t_subamostra.sa_datachegada, t_subamostra.sa_pescador
   FROM t_subamostra, t_pescador
  WHERE to_number(t_subamostra.sa_pescador, '9999999') = t_pescador.tp_id;


-- Alter table t_amostra_camarao
-- Add tu_id_monitor integer not null, Add Foreign Key (tu_id_monitor)
--       REFERENCES t_usuario (tu_id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION;


CREATE OR REPLACE VIEW v_unidade_camarao AS
 SELECT t_unidade_camarao.tuc_id, t_unidade_camarao.tamc_id,
    t_unidade_camarao.tuc_sexo, t_maturidade.tmat_tipo,
    t_unidade_camarao.tuc_comprimento_cabeca, t_unidade_camarao.tuc_peso
   FROM t_unidade_camarao, t_maturidade
  WHERE t_unidade_camarao.tmat_id = t_maturidade.tmat_id;


Insert into t_maturidade (tmat_tipo) values ('Aberto');
Insert into t_maturidade (tmat_tipo) values ('Fechado');
Insert into t_maturidade (tmat_tipo) values ('Em Desenvolvimento');
Insert into t_maturidade (tmat_tipo) values ('Desenvolvida');
Insert into t_maturidade (tmat_tipo) values ('Rudimentar');
Insert into t_maturidade (tmat_tipo) values ('Não informado');