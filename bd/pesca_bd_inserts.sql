-- -----------------------------------------------------
-- Data for table "T_Perfil"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_Perfil" ("TP_ID", "TP_Perfil") VALUES (1, 'Administrador');
INSERT INTO "T_Perfil" ("TP_ID", "TP_Perfil") VALUES (2, 'Coordenador');
INSERT INTO "T_Perfil" ("TP_ID", "TP_Perfil") VALUES (3, 'Subcoordenador');
INSERT INTO "T_Perfil" ("TP_ID", "TP_Perfil") VALUES (4, 'Estagiário');
INSERT INTO "T_Perfil" ("TP_ID", "TP_Perfil") VALUES (5, 'Bamin');

COMMIT;

-- -----------------------------------------------------
-- Data for table "T_AreaPesca"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_AreaPesca" ("TAreaP_ID", "TAreaP_AreaPesca") VALUES (1, 'Mar');
INSERT INTO "T_AreaPesca" ("TAreaP_ID", "TAreaP_AreaPesca") VALUES (2, 'Estuário');
INSERT INTO "T_AreaPesca" ("TAreaP_ID", "TAreaP_AreaPesca") VALUES (3, 'Rio');

COMMIT;

-- -----------------------------------------------------
-- Data for table "T_TipoEmbarcacao"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_TipoEmbarcacao" ("TTE_ID", "TTE_TipoEmbarcacao") VALUES (1, 'Barco');
INSERT INTO "T_TipoEmbarcacao" ("TTE_ID", "TTE_TipoEmbarcacao") VALUES (2, 'Canoa');
INSERT INTO "T_TipoEmbarcacao" ("TTE_ID", "TTE_TipoEmbarcacao") VALUES (3, 'Jangada');

COMMIT;

-- -----------------------------------------------------
-- Data for table "T_TipoDependente"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (1, 'Cônjugue ou companheiro(a)');
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (2, 'Filho(a) ou enteado(a)');
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (3, 'Irmão(ã), neto(a) ou bisneto');
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (4, 'Pais, avós ou bisavós');
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (5, 'Sogro(a)');
INSERT INTO "T_TipoDependente" ("TDP_ID", "TDP_Tipo") VALUES (6, 'Incapaz');

COMMIT;

-- -----------------------------------------------------
-- Data for table "T_ArtePesca"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_ArtePesca" ("TAP_ID", "TAP_ArtePesca") VALUES (1, 'Rede');
INSERT INTO "T_ArtePesca" ("TAP_ID", "TAP_ArtePesca") VALUES (2, 'Linha');
INSERT INTO "T_ArtePesca" ("TAP_ID", "TAP_ArtePesca") VALUES (3, 'Anzol');
INSERT INTO "T_ArtePesca" ("TAP_ID", "TAP_ArtePesca") VALUES (4, 'Tarrafa');

COMMIT;

-- -----------------------------------------------------
-- Data for table "T_EspecieCapturada"
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO "T_EspecieCapturada" ("TEC_ID", "TEC_Especie") VALUES (1, 'Peixe');
INSERT INTO "T_EspecieCapturada" ("TEC_ID", "TEC_Especie") VALUES (2, 'Camarão');
INSERT INTO "T_EspecieCapturada" ("TEC_ID", "TEC_Especie") VALUES (3, 'Marisco');

COMMIT;
