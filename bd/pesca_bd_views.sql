CREATE OR REPLACE VIEW "V_Endereco" ("TE_ID", "TE_Logradouro", "TE_Numero", "TE_CEP", "TE_Bairro", "TE_Comp", "TMun_ID", 
"TMun_Municipio", "TUF_Sigla", "TUF_Nome") AS
SELECT 
  "T_Endereco"."TE_ID", 
  "T_Endereco"."TE_Logradouro", 
  "T_Endereco"."TE_Numero", 
  "T_Endereco"."TE_CEP", 
  "T_Endereco"."TE_Bairro", 
  "T_Endereco"."TE_Comp", 
  "T_Municipio"."TMun_ID", 
  "T_Municipio"."TMun_Municipio", 
  "T_UF"."TUF_Sigla", 
  "T_UF"."TUF_Nome"
FROM 
  public."T_Endereco", 
  public."T_Municipio", 
  public."T_UF"
WHERE 
  "T_Endereco"."TMun_ID" = "T_Municipio"."TMun_ID" AND
  "T_Municipio"."TUF_Sigla" = "T_UF"."TUF_Sigla";
  

CREATE OR REPLACE VIEW "V_Usuario" ("TU_ID", "TU_Nome", "TU_Sexo", "TU_CPF", "TU_RG", "TU_Email", "TU_UsuarioDeletado", 
"TL_ID", "TL_Login", "TL_UltimoAcesso", "TP_ID", "TP_Perfil", "TE_ID", "TE_Logradouro", "TE_Numero", "TE_CEP", "TE_Bairro", 
"TE_Comp", "TMun_ID", "TMun_Municipio", "TUF_Sigla", "TUF_Nome") AS
SELECT 
  "T_Usuario"."TU_ID", 
  "T_Usuario"."TU_Nome", 
  "T_Usuario"."TU_Sexo", 
  "T_Usuario"."TU_CPF", 
  "T_Usuario"."TU_RG", 
  "T_Usuario"."TU_Email", 
  "T_Usuario"."TU_UsuarioDeletado", 
  "T_Login"."TL_ID", 
  "T_Login"."TL_Login", 
  "T_Login"."TL_UltimoAcesso", 
  "T_Perfil"."TP_ID", 
  "T_Perfil"."TP_Perfil", 
  "V_Endereco"."TE_ID", 
  "V_Endereco"."TE_Logradouro", 
  "V_Endereco"."TE_Numero", 
  "V_Endereco"."TE_CEP", 
  "V_Endereco"."TE_Bairro", 
  "V_Endereco"."TE_Comp", 
  "V_Endereco"."TMun_ID", 
  "V_Endereco"."TMun_Municipio", 
  "V_Endereco"."TUF_Sigla", 
  "V_Endereco"."TUF_Nome"
FROM 
  "T_Usuario", 
  "V_Endereco", 
  "T_Perfil", 
  "T_Login"
WHERE 
  "T_Usuario"."TL_ID" = "T_Login"."TL_ID" AND
  "T_Usuario"."TP_ID" = "T_Perfil"."TP_ID" AND
  "T_Usuario"."TE_ID" = "V_Endereco"."TE_ID";


CREATE OR REPLACE VIEW "V_Colonia" ("TC_ID", "TC_Nome", "TC_Especificidade", "TCOM_ID", "TCOM_NOME", "TE_ID", "TE_Logradouro", 
"TE_Numero", "TE_CEP", "TE_Bairro", "TE_Comp", "TMun_ID", "TMun_Municipio", "TUF_Sigla", "TUF_Nome") AS
SELECT 
  "T_Colonia"."TC_ID", 
  "T_Colonia"."TC_Nome", 
  "T_Colonia"."TC_Especificidade", 
  "T_Comunidade"."TCOM_ID", 
  "T_Comunidade"."TCOM_NOME", 
  "V_Endereco"."TE_ID", 
  "V_Endereco"."TE_Logradouro", 
  "V_Endereco"."TE_Numero", 
  "V_Endereco"."TE_CEP", 
  "V_Endereco"."TE_Bairro", 
  "V_Endereco"."TE_Comp", 
  "V_Endereco"."TMun_ID", 
  "V_Endereco"."TMun_Municipio", 
  "V_Endereco"."TUF_Sigla", 
  "V_Endereco"."TUF_Nome"
FROM 
  "T_Colonia", 
  "T_Comunidade", 
  "V_Endereco"
WHERE 
  "T_Colonia"."TCOM_ID" = "T_Comunidade"."TCOM_ID" AND
  "T_Colonia"."TE_ID" = "V_Endereco"."TE_ID";


CREATE OR REPLACE VIEW "V_UsuarioHasTelefone" ("TU_ID", "TTCont_ID", "TTCont_DDD", "TTCont_Telefone", "TTEL_ID", "TTEL_Desc") AS
SELECT 
  "T_Usuario_has_T_TelefoneContato"."TU_ID", 
  "T_TelefoneContato"."TTCont_ID", 
  "T_TelefoneContato"."TTCont_DDD", 
  "T_TelefoneContato"."TTCont_Telefone", 
  "T_TipoTel"."TTEL_ID", 
  "T_TipoTel"."TTEL_Desc"
FROM 
  "T_TelefoneContato", 
  "T_TipoTel", 
  "T_Usuario_has_T_TelefoneContato"
WHERE 
  "T_TelefoneContato"."TTEL_ID" = "T_TipoTel"."TTEL_ID" AND
  "T_Usuario_has_T_TelefoneContato"."TTCont_ID" = "T_TelefoneContato"."TTCont_ID";

CREATE OR REPLACE VIEW "V_Pescador" ("TP_ID", "TP_Nome", "TP_Sexo", "TP_Matricula", "TP_Apelido", "TP_FiliacaoPai", 
"TP_FiliacaoMae", "TP_CTPS", "TP_PIS", "TP_INSS", "TP_NIT_CEI", "TP_RG", "TP_CMA", "TP_RGB_MAA_IBAMA", "TP_CIR_Cap_Porto",
"TP_CPF", "TP_DataNasc", "TE_ID", "TE_Logradouro", "TE_Numero", "TE_Bairro", "TE_CEP", "TE_Comp", "TMun_Municipio", "TMun_ID", 
"TUF_Sigla", "TUF_Nome", "TMun_ID_Natural") AS
SELECT 
  "T_Pescador"."TP_ID", 
  "T_Pescador"."TP_Nome", 
  "T_Pescador"."TP_Sexo", 
  "T_Pescador"."TP_Matricula", 
  "T_Pescador"."TP_Apelido", 
  "T_Pescador"."TP_FiliacaoPai", 
  "T_Pescador"."TP_FiliacaoMae", 
  "T_Pescador"."TP_CTPS", 
  "T_Pescador"."TP_PIS", 
  "T_Pescador"."TP_INSS", 
  "T_Pescador"."TP_NIT_CEI", 
  "T_Pescador"."TP_RG", 
  "T_Pescador"."TP_CMA", 
  "T_Pescador"."TP_RGB_MAA_IBAMA", 
  "T_Pescador"."TP_CIR_Cap_Porto", 
  "T_Pescador"."TP_CPF", 
  "T_Pescador"."TP_DataNasc", 
  "T_Endereco"."TE_ID", 
  "T_Endereco"."TE_Logradouro", 
  "T_Endereco"."TE_Numero", 
  "T_Endereco"."TE_Bairro", 
  "T_Endereco"."TE_CEP", 
  "T_Endereco"."TE_Comp", 
  "T_Municipio"."TMun_Municipio", 
  "T_Municipio"."TMun_ID", 
  "T_UF"."TUF_Sigla", 
  "T_UF"."TUF_Nome", 
  "T_Pescador"."TMun_ID_Natural"
FROM 
  public."T_Pescador", 
  public."T_Endereco", 
  public."T_Municipio", 
  public."T_UF"
WHERE 
  "T_Pescador"."TE_ID" = "T_Endereco"."TE_ID" AND
  "T_Endereco"."TMun_ID" = "T_Municipio"."TMun_ID" AND
  "T_Municipio"."TUF_Sigla" = "T_UF"."TUF_Sigla";