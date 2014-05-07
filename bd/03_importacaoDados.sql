-- psql -d DB_Pesca -a -f importacao.sql

delete from t_tempo;
delete from t_vento;

delete from T_Especie;
delete from T_Genero;
delete from T_Familia;
delete from T_Ordem;
-- delete from T_OrdemA;
delete from T_Grupo;


-- -- -----------------------------------------------------
-- -- Data for table T_ArtePesca
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Arrasto');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Calão');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Espinhel/Groseira');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Linha');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Mariscagem');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Mergulho');
-- INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (NULL,'Rede');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_TipoEmbarcacao
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Barco');
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Bote');
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Canoa');
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Desembarcado');
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Jangada');
-- INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (NULL,'Lancha');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_TipoDependente
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Conjugue ou Companheiro(a)');
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Filho(a) ou Enteado(a)');
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Irmão(ã), Neto(a) ou Bisneto(a)');
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Pais, Avós e Bisavós');
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Sogro(a)');
-- INSERT INTO T_TipoDependente (TTD_ID, TTP_TipoDependente) VALUES (NULL,'Incapaz');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_AreaPesca
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (NULL,'Estuário');
-- INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (NULL,'Mar');
-- INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (NULL,'Rio');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_TipoTel
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_TipoTel (TTEL_ID, TTEL_Desc) VALUES (NULL,'Celular');
-- INSERT INTO T_TipoTel (TTEL_ID, TTEL_Desc) VALUES (NULL,'Residencial');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_Perfil
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (NULL,'Administrador');
-- INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (NULL,'Coordenador');
-- INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (NULL,'Subcoordenador');
-- INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (NULL,'Estagiário');
-- INSERT INTO T_Perfil (TP_ID, TP_Perfil) VALUES (NULL,'Bamin');
-- 
-- COMMIT;
-- 
-- 
-- -- -----------------------------------------------------
-- -- Data for table T_PorteEmbarcacao
-- -- -----------------------------------------------------
-- START TRANSACTION;
-- INSERT INTO T_PorteEmbarcacao (TPE_ID, TPE_Porte) VALUES (NULL,'Pequeno');
-- INSERT INTO T_PorteEmbarcacao (TPE_ID, TPE_Porte) VALUES (NULL,'Médio');
-- INSERT INTO T_PorteEmbarcacao (TPE_ID, TPE_Porte) VALUES (NULL,'Grande');

-- t_vtempo
INSERT INTO T_TEMPO (TMP_ID, TMP_ESTADO) VALUES ( 1,'Chuva');
INSERT INTO T_TEMPO (TMP_ID, TMP_ESTADO) VALUES ( 2,'Nublado');
INSERT INTO T_TEMPO (TMP_ID, TMP_ESTADO) VALUES ( 3,'Sol');

-- t_vento
INSERT INTO T_VENTO (VNT_ID, VNT_FORCA) VALUES ( 1,'Forte');
INSERT INTO T_VENTO (VNT_ID, VNT_FORCA) VALUES ( 2,'Fraco');
INSERT INTO T_VENTO (VNT_ID, VNT_FORCA) VALUES ( 3,'Moderado');


-- GRUPO
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (1,'Actinopterigyii');
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (2,'Chondrichthyes');
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (3,'Elasmobrânquios');
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (4,'Crustáceos');
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (5,'Moluscos');
INSERT INTO T_Grupo (GRP_ID, GRP_Nome) VALUES (6,'Outros');

-- ORDEM
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (1,'Anguilliformes','Enguias', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (2,'Gasterosteiformes','Peixes trombeta', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (3,'Clupeiformes','Sardinhas e Anchovas', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (4,'Siluriformes','Bagres', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (5,'Aulopiformes','Peixe lagarto', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (6,'Lophiiformes','Peixe diabo', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (7,'Ophidiiformes','Enguias', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (8,'Batrachoidiformes','Peixes sapo', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (9,'Scorpaeniformes','Peixes escorpião', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (10,'Perciformes','Pescadas', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (11,'Pleuronectiformes','Linguados', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (12,'Tetraodontiformes','Baiacus', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (13,'Rajiformes','Raias', 2);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (14,'Cyprinodontiformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (15,'Myliobatiformes', NULL, 2);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (16,'Orectolobiformes', NULL, 3);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (17,'Carcharhiniformes', NULL, 3);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (18,'Mugiliformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (19,'Decapoda', NULL, 4);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (20,'Outros', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (21,'Albuliformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (22,'Beryciformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (23,'Teuthida', NULL, 5);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (24,'Atheriniformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (25,'Beloniformes', NULL, 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (26,'Cypriniformes','Carpas', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (27,'Characiformes','piabas', 1);
INSERT INTO T_Ordem (ORD_ID, ORD_Nome, ORD_Caracteristica, GRP_ID) VALUES (29,'Elopíformes', NULL, 1);


-- --
-- -- Teste de cadastro de ORDEM com tabela de características
-- --
-- DROP TABLE "T_OrdemA";
-- DROP TABLE "T_OrdemCaracterisitca";
-- 
-- delete from "T_OrdemA";
-- delete from "T_OrdemCaracterisitca";
-- 
-- 
-- CREATE TABLE "T_OrdemCaracterisitca" (
--   "ORDC_ID" serial NOT NULL,
--   "ORDC_Nome" character varying(30) NOT NULL,
--   CONSTRAINT "T_OrdemCaracterisitca_pkey" PRIMARY KEY ("ORDC_ID")
--   );
--   
-- 
-- CREATE TABLE "T_OrdemA"
-- (
--   "ORD_ID" serial NOT NULL,
--   "ORD_Nome" character varying(30),
--   "ORDC_ID" integer NOT NULL,
--   "GRP_ID" integer NOT NULL,
--   CONSTRAINT "T_OrdemA_pkey" PRIMARY KEY ("ORD_ID"),
--   CONSTRAINT "fk_T_Ordem_T_Grupo" FOREIGN KEY ("GRP_ID")
--       REFERENCES "T_Grupo" ("GRP_ID") MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION,
--     CONSTRAINT "fk_T_Ordem_T_OrdemCaracterisitca" FOREIGN KEY ("ORDC_ID")
--       REFERENCES "T_OrdemCaracterisitca" ("ORDC_ID") MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION
-- )
-- WITH (
--   OIDS=FALSE
-- );
-- ALTER TABLE "T_OrdemA"
--   OWNER TO mohonda;
-- 
-- 
-- 
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (0,'Não Cadastrado');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (1,'Bagres');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (2,'Baiacus');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (3,'Carpas');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (4,'Enguias');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (5,'Linguados');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (6,'Peixe Diabo');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (7,'Peixe Lagarto');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (8,'Peixes Escorpião');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (9,'Peixes Sapo');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (10,'Peixes Trombeta');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (11,'Pescadas');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (12,'Piabas');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (13,'Raias');
-- INSERT INTO "T_OrdemCaracterisitca" ("ORDC_ID", "ORDC_Nome") VALUES (14,'Sardinhas e Anchovas');
-- 
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (1,'Albuliformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (2,'Anguilliformes', 4,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (3,'Atheriniformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (4,'Aulopiformes', 7,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (5,'Batrachoidiformes', 9,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (6,'Beloniformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (7,'Beryciformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (26,'Carcharhiniformes', 0,4);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (8,'Characiformes', 12,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (9,'Clupeiformes', 14,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (10,'Cypriniformes', 3,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (11,'Cyprinodontiformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (25,'Decapoda', 0,3);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (12,'Elopíformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (13,'Gasterosteiformes', 10,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (14,'Lophiiformes', 6,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (15,'Mugiliformes', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (23,'Myliobatiformes', 0,2);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (16,'Ophidiiformes', 4,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (27,'Orectolobiformes', 0,4);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (17,'Outros', 0,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (18,'Perciformes', 11,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (19,'Pleuronectiformes', 5,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (24,'Rajiformes', 13,2);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (20,'Scorpaeniformes', 8,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (21,'Siluriformes', 1,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (22,'Tetraodontiformes', 2,1);
-- INSERT INTO "T_OrdemA" ("ORD_ID", "ORD_Nome", "ORDC_ID", "GRP_ID") VALUES (28,'Teuthida', 0,5);
-- 
-- --
-- -- FIM Teste de cadastro de ORDEM com tabela de características
-- --

-- ALTER TABLE T_Familia ALTER COLUMN FAM_Caracteristica TYPE character varying(240);

-- FAMILIA
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (1,'Ariidae','bagres', 4, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (3,'Carangidae','pampos', 10,1505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (6,'Clupeidae','sardinhas', 3,1515, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (7,'Engraulidae','anchovas', 3,1510, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (8,'Ephippidae','peixes espátula', 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (10,'Monacanthidae','baiacus', 12, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (12,'Paralychthyidae','linguados', 11,3005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (15,'Sciaenidae','pescadas', 10,4005,'peixes carnívoros, formam grandes cardumes, demersal de fundo arenoso');
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (17,'Serranidae','badejos', 10, NULL,'Nadadeiras com raios com espinhos; Pre-opérculos denteados; Típica de fundos rochosos próximos da costa; marinhos, mas podem penetrar águas doces.');
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (18,'Sphyraenidae','barracudas', 10, NULL,'predador voraz; caçam peixes em águas rasas');
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (19,'Trichiuridae','peixes espada', 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (22,'Gymnuridae','raias', 13, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (23,'Dasyatidae','raias', 15, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (30,'Batrachoididae','peixe sapo', 8,2015, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (31,'Haemulidae','roncador', 10,2005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (33,'Lutjanidae','vermelhos', 10,2010, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (36,'Pristigasteridae', NULL, 3, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (45,'Achiridae','linguados', 11, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (50,'Cynoglossidae','linguados', 11, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (51,'Diodontidae','baiacus', 12, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (54,'Gerreidae','carapicus', 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (58,'Ogcocephalidae','peixes morcego', 6, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (59,'Polynemidae','tainhas, barracudas', 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (60,'Scorpaenidae','peixes escorpião', 9, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (61,'Synodontidae','peixes lagarto', 5, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (63,'Stromateidae','peixes manteiga', 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (64,'Tetraodontidae','baiacus', 12, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (65,'Gobiidae', NULL, 10,5005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (66,'Triglidae','Tordo do mar', 9,4505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (67,'Muraenidae','enguias', 1, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (69,'Bothidae','linguados', 11,1010, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (70,'Acanthuridae','peixes cirurgião', 10,3505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (71,'Fistulariidae','peixes trombeta', 2, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (72,'Mullidae','salmonetes', 10,6065, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (73,'Ostraciidae','baiacus', 12,6015, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (74,'Dactylopteridae','peixe cabra voador', 9, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (75,'Ophidiidae','enguias', 7, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (76,'Ophichthidae','enguias', 1, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (77,'Nettastomatidae','enguias', 1, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (78,'Rhinobatidae','raia viola', 13,6060, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (79,'Priacanthidae','olhudos', 10,6025, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (82,'Scombridae', NULL, 10,6055, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (83,'Balistidae', NULL, 12,6030, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (84,'Coryphaenidae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (85,'Lobotidae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (86,'Rachycentridae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (87,'Ginglymostomatidae', NULL, 16, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (88,'Carcharhinidae', NULL, 17,6020, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (89,'Xiphiidae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (90,'Cichlidae', NULL, 10,6050, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (91,'Clariidae', NULL, 4,6040, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (92,'Mugilidae', NULL, 18, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (93,'Penaeidae', NULL, 19, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (94,'Alpheidae', NULL, 19,6010, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (95,'Outros', NULL, 20, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (97,'Albulidae', NULL, 21, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (99,'ZZZ', NULL, 1,6045, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (100,'Centropomidae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (101,'Holocentridae', NULL, 22,6005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (102,'Sparidae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (103,'Malacanthidae', NULL, 10,6070, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (105,'Lula', NULL, 23,6080, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (106,'Gecarcinidae', NULL, 19,6075, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (107,'Portunidae', NULL, 19, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (108,'Palinuridae', NULL, 19,6515, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (110,'Atherinidae', NULL, 24,6505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (111,'Belonidae', NULL, 25,6520, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (112,'Ciprinidae', NULL, 26,6510, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (113,'Characidae', NULL, 27,1015, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (114,'Palaemonidae', NULL, 19,1005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (115,'Pomacanthidae', NULL, 10,5505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (116,'Hemiramphidae', NULL, 25,5510, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (117,'Pomacentridae', NULL, 10,5515, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (118,'Loricariidae', NULL, 4,2505, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (119,'Ocypodidae', NULL, 19, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (120,'Sesarmidae', NULL, 19, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (121,'Istiophoridae', NULL, 10, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (122,'Kyphosidae', NULL, 10,7020, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (123,'Megalopidae', NULL, 29, NULL, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (124,'Scaridae', NULL, 10,7005, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (125,'Molidae','Peixe lua', 12,7010, NULL);
INSERT INTO T_Familia (FAM_ID, FAM_Nome, FAM_Tipo, ORD_ID, FAM_Ordem_Filogenetica, FAM_Caracteristica) VALUES (126,'Eleotridae', NULL, 10,7015, NULL);

--Genero
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (1,'Arius', 1);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (2,'Cathorops', 1);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (3,'Chaetodipterus', 8);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (4,'Chilomycterus', 51);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (5,'Chloroscombrus', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (6,'Dactylopterus', 74);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (7,'Etropus', 12);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (8,'Larimus', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (9,'Menticirrhus', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (10,'Odontognathus', 36);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (11,'Ogcocephalus', 58);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (12,'Paralonchurus', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (13,'Polydactylus', 59);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (14,'Pomadasys', 31);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (15,'Potamarius', 1);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (16,'Selene', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (17,'Sphoeroides', 64);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (18,'Sphyraena', 18);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (19,'Stellifer', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (20,'Syacium', 12);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (21,'Symphurus', 50);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (22,'Trinectes', 45);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (23,'Rhinobatos', 78);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (24,'Sciades', 1);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (25,'Caranx', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (26,'Chirocentrodon', 36);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (27,'Conodon', 31);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (28,'Cynoscion', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (29,'Heteropriacanthus', 79);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (30,'Isopisthus', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (31,'Nebris', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (32,'Pellona', 36);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (33,'Peprilus', 63);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (34,'Lagocephalus', 64);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (35,'Anchoa', 7);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (36,'Macrodon', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (37,'Ophichthus', 76);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (38,'Anchoviella', 7);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (39,'Trichiurus', 19);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (40,'Genidens', 1);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (41,'Acanthurus', 70);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (42,'Genyatremus', 31);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (43,'Cetengraulis', 7);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (44,'Lycengraulis', 7);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (45,'Eucinostomus', 54);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (46,'Lutjanus', 33);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (47,'Ophidion', 75);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (48,'Prionotus', 66);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (49,'Achirus', 45);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (50,'Raneya', 75);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (51,'Gymnura', 22);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (52,'Ctenosciaena', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (53,'Dasyatis', 23);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (54,'Synodus', 61);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (55,'Rypticus', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (56,'Diplectrum', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (57,'Paralichthys', 12);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (58,'Gymnothorax', 67);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (59,'Engraulis', 7);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (60,'Harengula', 6);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (61,'Aluterus', 10);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (62,'Monacantus', 10);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (63,'Bothus', 69);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (64,'Cyclopsetta', 12);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (65,'Lepophidium', 75);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (66,'Scorpaena', 60);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (67,'Upeneus', 72);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (68,'Acanthostracion', 73);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (69,'Porichthys', 30);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (70,'Cantherhines', 10);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (71,'Diapterus', 54);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (73,'Catathyridium', 45);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (74,'Hoplunnis', 77);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (75,'Fistularia', 71);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (76,'Microgobius', 65);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (79,'Ocyurus', 33);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (80,'Epinephelus', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (81,'Mycteroperca', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (82,'Cephalopholis', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (83,'Euthynnus', 82);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (84,'Thunnus', 82);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (85,'Balistes', 83);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (86,'Seriola', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (87,'Coryphaena', 84);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (88,'Lobotes', 85);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (89,'Scomberomorus', 82);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (90,'Rachycentron', 86);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (91,'Ginglymostoma', 87);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (92,'Prionace', 88);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (93,'Alectis', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (94,'Haemulon', 31);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (95,'Xiphias', 89);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (96,'Oreochromis', 90);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (97,'Clarias', 91);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (98,'Mugil', 92);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (99,'Xiphopenaeus', 93);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (100,'Litopenaeus', 94);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (101,'Farfantepenaeus', 93);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (102,'Outros', 95);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (103,'Micropogonias', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (106,'Albula', 97);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (109,'zzz', 99);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (110,'Centropomus', 100);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (111,'Cichla', 90);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (112,'Holocentrus', 101);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (113,'Anisotremus', 31);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (115,'Trachinotus', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (116,'Carangoides', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (117,'Calamus', 102);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (118,'Pseudupeneus', 72);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (119,'Mulloidichthys', 72);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (120,'Malacanthus', 103);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (122,'Lula', 105);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (125,'Geophagus', 90);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (126,'Cardisoma', 106);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (127,'Callinectes', 107);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (128,'Odontoscion', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (130,'Lagosta', 108);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (131,'Acanthocybium', 82);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (134,'Strongylura', 111);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (135,'Cyprinus', 112);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (136,'Astyanax', 113);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (137,'Macrobrachium', 114);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (138,'Pomacanthus', 115);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (139,'Hemiramphus', 116);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (140,'Opisthonema', 6);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (141,'Paranthias', 17);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (142,'Abudefduf', 117);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (143,'Rhomboplites', 33);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (144,'Cascudo', 118);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (145,'Oligoplites', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (146,'Ucides', 119);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (147,'Aratus', 120);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (148,'Elegatis', 3);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (149,'Etelis', 33);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (150,'Istiophorus', 121);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (151,'Kyphosus', 122);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (152,'Megalops', 123);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (153,'Myrichthys', 76);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (156,'Sparisoma', 124);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (157,'Peixe lua', 125);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (158,'Sametaria', 15);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (159,'Cação', 88);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (160,'Dormitator', 126);
INSERT INTO T_Genero (GEN_ID, GEN_Nome, FAM_ID) VALUES (161,'Morea', 67);

-- Espécie
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4151,'Caranx latus','Graçaim','(Agassiz, 1831)', 25);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4154,'Caranx crysus','Guaricema', NULL, 25);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4168,'Eucinostomus spp.','Carapeba','(Quoy & Gaimard, 1824)', 45);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4176,'Lutjanus synagris','Ariacó','(Linnaeus, 1758)', 46);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4205,'Dasyatis spp.','Arraia','(Bloch & Schneider, 1801)', 53);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4224,'Sphyraena sp','Bicuda', NULL, 18);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4487,'Caranx hippos','Xaréu','(Linnaeus, 1766)', 25);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4508,'Ocyurus chrysurus','Guaiúba','(Bloch, 1791)', 79);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4509,'Lutjanus jocu','Dentão', NULL, 46);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4510,'Lutjanus analis','Cioba', NULL, 46);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4511,'Epinephelus adscensionis','Mero gato', NULL, 80);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4512,'Mycteroperca interstitialis','Mero cabrinha', NULL, 81);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4513,'Cephalopholis fulva','Jabú', NULL, 82);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4514,'Euthynnus alletteratus','Bonito', NULL, 83);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4515,'Thunnus spp.','Atum', NULL, 84);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4516,'Balistes vetula','Peroá', NULL, 85);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4517,'Seriola spp.','Olho de boi', NULL, 86);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4518,'Coryphaena hippurus','Dourado', NULL, 87);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4519,'Lobotes surinamensis','Dorminhoco', NULL, 88);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4520,'Scomberomorus cavalla','Cavala', NULL, 89);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4521,'Rachycentron canadum','Bijupirá', NULL, 90);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4522,'Ginglymostoma cirratum','Cação lixa', NULL, 91);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4523,'Prionace glauca','Cação azul', NULL, 92);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4524,'Mycteroperca bonaci','Badejo', NULL, 81);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4525,'Alectis ciliaris','Aracanguira', NULL, 93);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4526,'Haemulon parra','Biquara', NULL, 94);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4527,'Xiphias gladius','Meca', NULL, 95);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4528,'Oreochromis niloticus','Tilápia', NULL, 96);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4529,'Clarias gariepinus','Bagre africano', NULL, 97);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4530,'Mugil spp.','Tainha', NULL, 98);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4532,'Xiphopenaeus kroyeri','7 barbas', NULL, 99);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4533,'Litopenaeus schimitti','Pistola', NULL, 100);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4534,'Farfantepenaeus brasiliensis','Rosa', NULL, 101);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4535,'Vária espécies de peixes','Moamba', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4538,'Micropogonias furnieri','Corvina', NULL, 103);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4541,'Albula vulpes','Ubarana', NULL, 106);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4543,'Scomberomorus brasiliensis','Sororoca', NULL, 89);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4546,'Anchoviella spp.','Manjuba', NULL, 38);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4548,'Centropomus sp.','Robalo', NULL, 110);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4549,'Cichla sp.','Tucunaré verdadeiro', NULL, 111);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4550,'Holocentrus adscensionis','Jaguaraça', NULL, 112);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4551,'Anisotremus surinamensis','Sargo', NULL, 113);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4552,'Chloroscombrus chrysurus','Garapau', NULL, 5);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4553,'Trachinotus spp.','Pampo', NULL, 115);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4554,'Selene spp.','Peixe Galo', NULL, 16);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4555,'Carangoides bartholomaei','Guarajuba', NULL, 116);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4556,'Cynoscion acoupa','Pescada amarela', NULL, 28);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4557,'Calamus pennatula','Peixe pena', NULL, 117);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4558,'Trichiurus lepturus','Espada', NULL, 39);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4559,'Pseudupeneus maculatus','Saramonete/Salmonete', NULL, 118);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4560,'Mulloidichthys martinicus','Saramonete Rei', NULL, 119);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4561,'Polydactylus virginicus','Barbudo', NULL, 13);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4562,'Dactylopterus volitans','Voador', NULL, 6);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4563,'Malacanthus plumieri','Bom nome', NULL, 120);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4565,'Lula','Lula', NULL, 122);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4568,'Lutjanus sp.','Vermelho', NULL, 46);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4573,'Pesarigo','Pesarigo', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4574,'Fornicida','Fornicida', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4576,'Menticirrhus americanus','Corre costa', NULL, 9);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4577,'Larimus breviceps','Boca torta', NULL, 8);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4579,'Geophagus sp.','Corró', NULL, 125);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4580,'Cardisoma guanhumi','Gaiamum', NULL, 126);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4581,'Callinectes sp','Siri', NULL, 127);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4583,'Sciades sp.','Bagre', NULL, 24);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4584,'Sphyraena picudilla','Bicoara', NULL, 18);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4585,'Cynocion spp.','Pescada', NULL, 28);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4586,'Odontoscion dentex','Pescada verdadeira', NULL, 128);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4587,'Isopisthus parvipinnis','Pescadinha', NULL, 30);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4588,'Lagosta','Lagosta', NULL, 130);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4589,'Sphyraena barracuda','Pescada Goiva', NULL, 18);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4590,'Acanthocybium solandri','Cavala aipim', NULL, 131);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4592,'Strongylura timucu','Agulhão', NULL, 134);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4593,'Cyphocharax gilbert','Carpa', NULL, 135);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4594,'Astyanax sp.','Piaba', NULL, 136);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4595,'Baiacu','Baiacu', NULL, 68);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4596,'Macrobrachium acanthurus','Calambau', NULL, 137);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4597,'Pomacanthus paru','Paru', NULL, 138);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4598,'Hemiramphus spp.','Agulhinha', NULL, 139);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4599,'Gymnothorax moringa','Caramuru', NULL, 58);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4600,'Anisotremus virginicus','Frade', NULL, 113);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4601,'Caranx lugubris','Xaréu preto', NULL, 25);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4602,'Opisthonema oglinum','Mançambê', NULL, 140);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4604,'Paranthias furcifer','Mata caboclo', NULL, 141);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4605,'Abudefduf saxatilis','Maná', NULL, 142);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4606,'Rhomboplites aurorubens','Paramirim', NULL, 143);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4607,'Cascudo','Cascudo', NULL, 144);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4608,'Jaçaí','Jaçaí', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4609,'Pitangola','Pitangola', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4610,'Oligoplites saurus','Guaibira', NULL, 145);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4611,'Ucides cordatus','Caranguejo', NULL, 146);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4612,'Aratus pisonii','Aratu', NULL, 147);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4615,'Chagolão','Chagolão', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4618,'Jaburisa','Jaburisa', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4619,'Anisotremus moricandi','Pano de costa', NULL, 113);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4621,'Maria velha','Maria velha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4622,'Sardinha','Sardinha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4623,'Lagocephalus leavigatus','Baiacu arara', NULL, 34);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4624,'Aluterus monocerus','Peixe rato', NULL, 61);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4626,'Stellifer rastrifer','Mirucaia', NULL, 19);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4627,'Balistes capriscus','Peroá branco', NULL, 85);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4628,'Cathorops spixii','Bagre amarelo', NULL, 2);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4629,'Ctenosciaena gracilicirrhus','Papa terra', NULL, 52);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4630,'Elegatis bipinnulatus','Peixe rei', NULL, 148);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4631,'Etelis oculatus','Vermelho de fundo', NULL, 149);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4632,'Haemulon aurolineatum','Guatinga', NULL, 94);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4633,'Istiophorus albicans','Marlin', NULL, 150);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4634,'Kyphosus sp.','Piramboca', NULL, 151);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4635,'Lutjanus alexandrei','Carapitanga', NULL, 46);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4636,'Megalops atlanticus','Cangurupim', NULL, 152);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4637,'Myrichthys sp.','Mucutuca', NULL, 153);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4639,'Sparisoma axillare','Budião batata', NULL, 156);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4640,'Trachinotus falcatus','Pampo da espinha mole', NULL, 115);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4641,'Peixe lua','Peixe lua', NULL, 157);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4642,'Sametaria','Sametaria', NULL, 158);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4644,'Cação','Cação', NULL, 159);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4645,'Traíra','Traíra', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4646,'Farfantepenaeus sp.','Rosinha', NULL, 101);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4647,'Piraca','Piraca', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4648,'Rabo seco','Rabo seco', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4649,'Manchulea','Manchulea', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4650,'Isopisthus sp.1','Chatinha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4652,'Patiga','Patiga', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4653,'Jaba','Jaba', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4655,'Camina','Camina', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4656,'Piaru','Piaru', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4657,'Pirambu','Pirambu', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4658,'Castanha','Castanha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4659,'Linguado','Linguado', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4660,'Navalha','Navalha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4661,'Scarus coeruleus','Budião azul', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4662,'Centropomus spp.','Camuri', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4663,'Pula-pula','Pula-pula', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4664,'Caboje','Caboje', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4665,'Namorado','Namorado', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4666,'Pescada 7 buchos','Pescada 7 buchos', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4667,'Lutjanus cyanopterus','Caranha', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4668,'Tambaqui','Tambaqui', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4669,'Peixe Cozinheira','Peixe Cozinheira', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4670,'Margarida','Margarida', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4673,'Caçari','Caçari', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4674,'Qualingó','Qualingó', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4675,'Peixote','Peixote', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4676,'Mero jambu','Mero jambu', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4677,'Bagre aluminio','Bagre aluminio', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4678,'Dormitator maculatus','Baricu', NULL, 160);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4679,'Zoião','Zoião', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4680,'Anchova','Anchova', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4681,'Carupuru','Carupuru', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4682,'João Gorosa','João Gorosa', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4683,'Seropé','Seropé', NULL, 102);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4684,'Harengula clupeola','Cascuda', NULL, 60);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4685,'Lycengraulis grossidens','Xangó', NULL, 44);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4686,'Paralichthys sp.','Peixe tapa', NULL, 57);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4687,'Scorpaena brasiliensis','Morea - tim', NULL, 66);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4688,'Morea','Morea', NULL, 161);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4689,'Rypticus randalli','Peixe sabão', NULL, 55);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4690,'Conodon nobilis','Roncador', NULL, 27);
INSERT INTO T_Especie (ESP_ID, ESP_Nome, ESP_Nome_Comum,  ESP_Descritor, GEN_ID) VALUES ( 4691,'Isopisthus sp.','Samucanga', NULL, 30);


-- Arte de Pesca
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (1,'Arrasto de Fundo');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (2,'Calão');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (3,'Espinhel/Groseira');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (4,'Pesca de Linha');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (5,'Rede de Emalhar');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (6,'Rede (3 malhos, etc)');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (7,'Tarrafa');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (8,'Vara de Pesca');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (9,'Gereré');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (10,'Siripóia');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (11,'Manzuá');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (12,'Ratoeira');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (13,'Catagem');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (14,'Mergulho');
INSERT INTO T_ArtePesca (TAP_ID, TAP_ArtePesca) VALUES (15,'Mariscagem');


-- Área de Pesca
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (1,'Barra');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (2,'Beira de Praia');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (3,'Coroa');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (4,'Estuário');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (5,'Mangue');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (6,'Mar');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (7,'Pedras');
INSERT INTO T_AreaPesca (TAreaP_ID, TAreaP_AreaPesca) VALUES (8,'Rio');

-- Colônias
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (1,'A-87');
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (2,'Z-18');
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (3,'Z-19');
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (4,'Z-34');
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (5,'Não Colonizado');
INSERT INTO T_Colonia (TC_ID, TC_Nome) VALUES (6,'Z-22');

-- Embarcação
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (1,'Barco');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (2,'Bote');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (3,'Canoa');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (4,'Jangada');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (5,'Lancha');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (6,'Batera');
INSERT INTO T_TipoEmbarcacao (TTE_ID, TTE_TipoEmbarcacao) VALUES (7,'Guincho');

-- Porte Embarcacao
INSERT INTO T_PorteEmbarcacao (TPE_ID, TTE_Porte) VALUES (1,'Pequeno');
INSERT INTO T_PorteEmbarcacao (TPE_ID, TTE_Porte) VALUES (2,'Médio');
INSERT INTO T_PorteEmbarcacao (TPE_ID, TTE_Porte) VALUES (3,'Grande');

-- Tipo de Dependente
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (1,'Cônjuge ou companheiro(a)');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (2,'Irmão');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (3,'Filho/Enteado');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (4,'Neto/Bisneto');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (5,'Pais');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (6,'Outros Familiares');
INSERT INTO T_TipoDependente (TTD_ID, TTD_TipoDependente) VALUES (7,'Outros');

-- Tipo de Captura
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (1,'Camarão');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (2,'Caranguejo');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (3,'Guaiamum');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (4,'Lagosta');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (5,'Marisco');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (6,'Peixes');
INSERT INTO T_TipoCapturada (ITC_ID, ITC_Tipo) VALUES (7,'Siri');

-- Municipios
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (1,'Almadina',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (2,'Andaraí',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (3,'Aracajú',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (4,'Arneiro',6);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (5,'Aurelino Leal',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (6,'Barreiros',16);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (8,'Belo Horizonte',11);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (9,'Boa Nova',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (10,'Brasília',7);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (11,'Buerarema',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (12,'Cabaceiras Do Paraguaçu',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (13,'Cairú',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (14,'Camacã',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (17,'Camamu',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (18,'Camonci',6);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (19,'Canavieiras',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (20,'Caravelas',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (21,'Cardeal Da Silva',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (22,'Casinha',16);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (23,'Castelo Novo',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (24,'Castro Alves',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (25,'Catú',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (26,'Coaraci',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (27,'Conceição Da Barra',8);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (28,'Conceição Do Almeida',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (29,'Coruripe',2);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (30,'Cubatão',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (31,'Curaçá',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (32,'Duque De Caxias',19);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (33,'Entre Rios',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (34,'Eunápolis',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (35,'Feira De Santana',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (36,'Feira Grande',2);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (37,'Firmino Alves',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (38,'Floresta Azul',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (39,'Fortaleza',6);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (40,'Frei Paulo',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (41,'Gandu',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (42,'Gongogi',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (43,'Guarulhos',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (44,'Ibicaraí',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (45,'Ibicui',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (46,'Ibirapitanga',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (47,'Ibirataia',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (48,'Igrapiúna',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (49,'Iguai',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (50,'Ilha Do Contrato',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (7,'Ilhéus',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (3553,'Ilhéus (rio)',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (51,'Ilhota',24);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (52,'Ipiau',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (53,'Iramaia',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (54,'Itabaianinha',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (55,'Itabuna',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (3554,'Itacaré',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (56,'Itagibá',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (57,'Itaju Da Colônia',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (58,'Itajuípe',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (59,'Itamari',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (60,'Itambé',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (61,'Itapé',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (62,'Itapebi',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (63,'Itapetinga',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (64,'Itapitanga',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (65,'Itororó',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (66,'Ituberá',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (67,'Japu',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (68,'Jaquaquara',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (69,'Jequié',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (70,'Jeremoabo',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (71,'Jitaúna',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (72,'Macambira',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (73,'Mairiporã',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (74,'Maragogi',2);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (75,'Maraú',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (76,'Mascote',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (77,'Muritiba',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (78,'Nanuque',11);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (79,'Neopolis',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (80,'Nilo Peçanha',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (81,'Nilopolis',19);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (82,'Nossa Senhora Da Glória',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (83,'Osasco',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (84,'P. De Areia',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (85,'Palmares',16);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (86,'Paranaíba',17);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (87,'Pau Brasil',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (88,'Penha',24);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (89,'Piabiru',18);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (90,'Piacabucu',2);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (91,'Pirai Do Norte',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (92,'Propriá',25);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (93,'Recife',16);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (94,'Rio De Janeiro',19);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (95,'Salvador',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (96,'Santa Cruz Cabrália',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (97,'Santa Inês',10);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (98,'São José Dos Campos',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (99,'São Paulo',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (100,'São Vicente',26);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (101,'Sapé',15);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (102,'Serra Grande',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (103,'Taboquinhas',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (104,'Tanque DArca',2);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (105,'Teolandia',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (106,'Ubaitaba',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (107,'Ubaporanga',11);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (108,'Ubatã',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (109,'Una',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (16,'Uruçuca',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (111,'Valença',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (112,'Vera Cruz',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (113,'Vitória Da Conquista',5);
INSERT INTO T_Municipio (TMun_ID, TMun_Municipio, TUF_Sigla) VALUES (114,'Vitorino Freire',10);

-- Porto
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (1,'Amendoeira',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (15,'Aritaguá',3553);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (14,'Juerana rio',3553);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (3,'Mamoã',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (19,'Pé de Serra',16);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (4,'Ponta da Tulha',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (5,'Ponta do Ramo',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (6,'Pontal',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (7,'Porto da Barra',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (16,'Porto da Concha',3554);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (17,'Porto do Forte',3554);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (9,'Prainha',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (13,'Sambaituba',3553);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (8,'São Miguel',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (18,'Sobradinho',16);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (10,'Terminal Pesqueiro',7);
INSERT INTO T_Porto (PTO_ID, PTO_Nome, TMun_ID) VALUES (12,'Urucutuca',3553);

-- Escolaridade
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (1,'Fundamental Completo');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (2,'Fundamental Incompleto');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (3,'Médio Completo');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (4,'Médio Incompleto');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (5,'Não Alfabetizado');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (6,'Superior Completo');
INSERT INTO T_Escolaridade (ESC_ID, ESC_Nivel) VALUES (7,'Superior Incompleto');

-- Programa Social
INSERT INTO T_ProgramaSocial (PRS_ID, PRS_Programa) VALUES (1,'Bolsa Família');
INSERT INTO T_ProgramaSocial (PRS_ID, PRS_Programa) VALUES (2,'Minha Casa, Minha Vida');

-- Renda
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (1,'até 1/2 salário');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (2,'1 salário');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (3,'de 1/2 a 1 salário');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (4,'de 1 a 2 salários');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (5,'de 2 a 3 salários');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (6,'de 3 a 4 salários');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (7,'de 4 a 5 salários');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (8,'mais que 5 salários');
INSERT INTO T_Renda (REN_ID, REN_Renda) VALUES (9,'subsistência');









--- Tem que ser no final do arquivo

SELECT pg_catalog.setval('t_ordem_ord_id_seq', 30, true);
SELECT pg_catalog.setval('t_familia_fam_id_seq', 130, true);
SELECT pg_catalog.setval('t_genero_gen_id_seq', 162, true);


