--Já está no servidor
Alter table t_pescador_has_t_embarcacao
Drop Constraint t_pescador_has_t_embarcacao_pkey,
Add tpte_id serial,
ADD PRIMARY KEY (tpte_id);


--Já está no servidor
CREATE OR REPLACE VIEW v_pescadorhasembarcacao AS 
 SELECT phe.tp_id, phe.tte_id, tte.tte_tipoembarcacao, phe.tpte_motor, 
    phe.tpe_id, tpe.tpe_porte, phe.tpte_dono, phe.tpte_id
   FROM t_pescador_has_t_embarcacao phe, t_tipoembarcacao tte, 
    t_porteembarcacao tpe
  WHERE phe.tte_id = tte.tte_id AND phe.tpe_id = tpe.tpe_id;
