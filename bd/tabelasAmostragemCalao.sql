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


Alter table t_manzua
Add man_combustivel double precision;

Alter table t_mergulho
Add mer_combustivel double precision;

Alter table t_ratoeira
Add rat_combustivel double precision;

Alter table t_siripoia
Add sir_combustivel double precision;



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
INSERT INTO t_tipo_venda(ttv_tipovenda)
    VALUES ('Não Informado');

CREATE OR REPLACE VIEW v_coletamanual_has_t_especie_capturada AS 
 SELECT entrevista.cml_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_cml_id, tvenda.ttv_tipovenda
   FROM t_coletamanual entrevista
    
  LEFT JOIN t_coletamanual_has_t_especie_capturada as espcapt On entrevista.cml_id = espcapt.cml_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;

CREATE OR REPLACE VIEW v_jerere_has_t_especie_capturada AS 
 SELECT entrevista.jre_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_jre_id, tvenda.ttv_tipovenda
   FROM t_jerere entrevista
    
  LEFT JOIN t_jerere_has_t_especie_capturada as espcapt On entrevista.jre_id = espcapt.jre_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_linhafundo_has_t_especie_capturada AS 
 SELECT entrevista.lf_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_lf_id, tvenda.ttv_tipovenda
   FROM t_linhafundo entrevista
    
  LEFT JOIN t_linhafundo_has_t_especie_capturada as espcapt On entrevista.lf_id = espcapt.lf_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_manzua_has_t_especie_capturada AS 
 SELECT entrevista.man_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_man_id, tvenda.ttv_tipovenda
   FROM t_manzua entrevista
    
  LEFT JOIN t_manzua_has_t_especie_capturada as espcapt On entrevista.man_id = espcapt.man_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_mergulho_has_t_especie_capturada AS 
 SELECT entrevista.mer_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_mer_id, tvenda.ttv_tipovenda
   FROM t_mergulho entrevista
    
  LEFT JOIN t_mergulho_has_t_especie_capturada as espcapt On entrevista.mer_id = espcapt.mer_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_ratoeira_has_t_especie_capturada AS 
 SELECT entrevista.rat_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_rat_id, tvenda.ttv_tipovenda
   FROM t_ratoeira entrevista
    
  LEFT JOIN t_ratoeira_has_t_especie_capturada as espcapt On entrevista.rat_id = espcapt.rat_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;


CREATE OR REPLACE VIEW v_siripoia_has_t_especie_capturada AS 
 SELECT entrevista.sir_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_sir_id, tvenda.ttv_tipovenda
   FROM t_siripoia entrevista
    
  LEFT JOIN t_siripoia_has_t_especie_capturada as espcapt On entrevista.sir_id = espcapt.sir_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;



CREATE OR REPLACE VIEW v_varapesca_has_t_especie_capturada AS 
 SELECT entrevista.vp_id, especie.esp_nome_comum, espcapt.spc_quantidade, 
    espcapt.spc_peso_kg, espcapt.spc_preco, espcapt.spc_vp_id, tvenda.ttv_tipovenda
   FROM t_varapesca entrevista
    
  LEFT JOIN t_varapesca_has_t_especie_capturada as espcapt On entrevista.vp_id = espcapt.vp_id
  LEFT JOIN  t_especie as especie ON especie.esp_id = espcapt.esp_id
  LEFT JOIN t_tipo_venda as tvenda ON espcapt.ttv_id = tvenda.ttv_id;

