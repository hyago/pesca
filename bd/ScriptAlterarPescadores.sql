UPDATE	t_arrastofundo	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_calao	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_coletamanual	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_emalhe	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_jerere	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_grosseira	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_linha	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_linhafundo	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_manzua	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_mergulho	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_ratoeira	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_siripoia	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_tarrafa	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
UPDATE	t_varapesca	SET	tp_id_entrevistado=	?	WHERE	tp_id_entrevistado=	!	;
								
Delete From	 t_pescador_has_t_areapesca	Where	tp_id	=			!	;
Delete From	 t_pescador_has_t_artepesca	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_colonia	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_comunidade	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_embarcacao	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_endereco	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_escolaridade	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_especiecapturadas	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_porto	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_programasocial	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_renda	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_telefonecontato	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_tipoartepesca	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_tipocapturada	Where	tp_id	=			!	;
Delete From	t_pescador_has_t_tipodependente	Where	tp_id	=			!	;
Delete From	t_pescador_has_telefone	Where	tpt_tp_id	=			!	;
Delete From t_pescador WHERE tp_id = 							!	;
