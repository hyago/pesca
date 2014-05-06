-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

delete from t_usuario;
delete from t_login;
delete from t_perfil;

delete from T_Endereco;
delete from T_Municipio;
delete from t_uf;




-- -----------------------------------------------------
-- Data for table T_UF
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('AC', 'Acre');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('AL', 'Alagoas');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('AM', 'Amazonas');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('AP', 'Amapá');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('BA', 'Bahia');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('CE', 'Ceará');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('DF', 'Distrito Federal');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('ES', 'Espírito Santo');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('GO', 'Goiás');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('MA', 'Maranhão');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('MG', 'Minas Gerais');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('MS', 'Mato Grosso do Sul');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('MT', 'Mato Grosso');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('PA', 'Pará');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('PB', 'Paraíba');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('PE', 'Pernambuco');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('PI', 'Piauí');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('PR', 'Paraná');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('RN', 'Rio Grande do Norte');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('RO', 'Rondônia');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('RR', 'Roraima');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('RS', 'Rio Grande do SUl');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('SC', 'Santa Catarina');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('SE', 'Sergipe');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('SP', 'São Paulo');
INSERT INTO T_UF (TUF_Sigla, TUF_Nome) VALUES ('TO', 'Tocantins');
COMMIT;

INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (1, 'Administrador');
INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (2, 'Coordenador');
INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (3, 'Subcoordenador');
INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (4, 'Estagiário');
INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (5, 'Bamin');



INSERT INTO T_Endereco (TE_ID, TE_Logradouro, TE_Numero, TE_Bairro, TE_CEP, TE_Comp, TMun_ID) VALUES (12, '112', '1213', 'Centro', '12345677', 'Casa', 1);
INSERT INTO T_Endereco (TE_ID, TE_Logradouro, TE_Numero, TE_Bairro, TE_CEP, TE_Comp, TMun_ID) VALUES (1, 'Teste', '12', 'Teste', '54565677', 'Teste', 1);
INSERT INTO T_Endereco (TE_ID, TE_Logradouro, TE_Numero, TE_Bairro, TE_CEP, TE_Comp, TMun_ID) VALUES (3, 'Teste3', '3', 'Teste3', '333333', 'Teste3', 2);

INSERT INTO T_Login (TL_ID, TL_Login, TL_HashSenha, TL_UltimoAcesso) VALUES (1, 'stefano', '80980fcaf2ab3f243874695f57b2ed065d8e67e4', NULL);
INSERT INTO T_Login (TL_ID, TL_Login, TL_HashSenha, TL_UltimoAcesso) VALUES (2, 'elenildo', '271ef194466bb4f3e9a962a1e2772c73ab87f8ad', NULL);
INSERT INTO T_Login (TL_ID, TL_Login, TL_HashSenha, TL_UltimoAcesso) VALUES (3, 'mohonda', '80980fcaf2ab3f243874695f57b2ed065d8e67e4', NULL);

INSERT INTO T_Usuario (TU_ID, TU_Nome, TU_Sexo, TU_CPF, TU_RG, TU_Email, TU_UsuarioDeletado, TL_ID, TP_ID, TE_ID) VALUES (1, 'Stefano', 'M', '12211221', '122222112', 'stefano@stefano.br', false, 1, 1, 1);
INSERT INTO T_Usuario (TU_ID, TU_Nome, TU_Sexo, TU_CPF, TU_RG, TU_Email, TU_UsuarioDeletado, TL_ID, TP_ID, TE_ID) VALUES (2, 'Elenildo', 'M', '121.131.242-34', '123456', 'elenildo@uesc.br', false, 2, 1, 12);
INSERT INTO T_Usuario (TU_ID, TU_Nome, TU_Sexo, TU_CPF, TU_RG, TU_Email, TU_UsuarioDeletado, TL_ID, TP_ID, TE_ID) VALUES (3, 'mohonda', 'M', '3333', '3333', 'mohonda@uesc.br', false, 3, 1, 3);


COMMIT;

