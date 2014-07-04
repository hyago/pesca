ALTER TABLE t_calao
DROP COLUMN cal_tamanho1, DROP COLUMN cal_tamanho2, Add cal_malha1 double precision, add cal_malha2 double precision;

CREATE TABLE IF NOT EXISTS t_tipo_venda
(
ttv_id serial,
ttv_tipovenda character varying(30) NOT NULL,
Primary Key (ttv_id)
);

Alter table t_coletamanual
Add cml_combustivel double precision;

Alter table t_jerere
Add jre_combustivel double precision;

Alter table t_linhafundo
Add lf_combustivel double precision;

Alter table t_manzua
Add man_combustivel double precision;

Alter table t_mergulho
Add mer_combustivel double precision;

Alter table t_ratoeira
Add rat_combustivel double precision;

Alter table t_siripoia
Add sir_combustivel double precision;

Alter table t_varapesca
Add vp_combustivel double precision;


Alter Table t_coletamanual_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_jerere_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_linhafundo_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_manzua_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_mergulho_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_ratoeira_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_siripoia_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

Alter Table t_varapesca_has_t_especie_capturada
Add ttv_id integer, ADD FOREIGN KEY (ttv_id)
      REFERENCES t_tipo_venda (ttv_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Unidade');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Kilo');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Dúzia');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Litro');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Lata');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Corda');
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Cesto');