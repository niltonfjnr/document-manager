CREATE TABLE IF NOT EXISTS cotacoes_bolsa (
id SERIAL,
tp_reg VARCHAR(50),
dt_pregao VARCHAR(50),
cd_bdi VARCHAR(50),
cd_acao VARCHAR(50),
tp_merc VARCHAR(50),
nm_empresa_rdz VARCHAR(50),
especi VARCHAR(50),
prazot VARCHAR(50),
moeda_ref VARCHAR(50),
vl_abertura VARCHAR(50),
vl_maximo VARCHAR(50),
vl_minimo VARCHAR(50),
vl_medio VARCHAR(50),
vl_fechamento VARCHAR(50),
vl_mlh_oft_compra VARCHAR(50),
vl_mlh_oft_venda VARCHAR(50),
vl_ttl_neg VARCHAR(50),
qt_tit_neg VARCHAR(50),
vl_volume VARCHAR(50),
vl_exec_opc VARCHAR(50),
in_opc VARCHAR(50),
dt_vnct_opc VARCHAR(50),
ft_cotacao VARCHAR(50),
vl_exec_moeda_corrente VARCHAR(50),
cd_isin VARCHAR(50),
cd_acao_rdz VARCHAR(50),
created_at VARCHAR(50),
updated_at VARCHAR(50),
__index_level_0__ VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS df_empresas (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(18),
  dt_abertura VARCHAR(50),
  empresa_matriz BOOLEAN,
  cd_cnae_principal INTEGER,
  de_cnae_principal VARCHAR(200),
  de_ramo_atividade VARCHAR(50),
  de_setor VARCHAR(50),
  endereco_cep VARCHAR(20),
  endereco_municipio VARCHAR(50),
  endereco_uf VARCHAR(50),
  endereco_regiao VARCHAR(50),
  endereco_mesorregiao VARCHAR(50), 
  situacao_cadastral VARCHAR(15)
);
CREATE INDEX IF NOT EXISTS df_empresas_cnpj_idx ON df_empresas (cnpj);

CREATE TABLE IF NOT EXISTS empresas_bolsa (
  id SERIAL,
  cd_acao_rdz VARCHAR(20),
  nm_empresa VARCHAR(50),
  setor_economico VARCHAR(50),
  subsetor VARCHAR(100),
  segmento VARCHAR(100),
  segmento_b3 VARCHAR(50),
  nm_segmento_b3 VARCHAR(50),
  cd_acao VARCHAR(50),
  tx_cnpj VARCHAR(18),
  vl_cnpj VARCHAR(18),
  created_at VARCHAR(27),
  updated_at VARCHAR(27)
);

CREATE TABLE IF NOT EXISTS empresas_nivel_atividade (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(18),
  nivel_atividadeempresas_nivel_atividade VARCHAR(15)
);
CREATE INDEX IF NOT EXISTS empresas_nivel_atividade_cnpj_idx ON empresas_nivel_atividade (cnpj);

CREATE TABLE IF NOT EXISTS empresas_porte (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(18),
  empresa_porte VARCHAR(15)
);
CREATE INDEX IF NOT EXISTS empresas_porte_cnpj_idx ON empresas_porte (cnpj);

CREATE TABLE IF NOT EXISTS empresas_saude_tributaria (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(18),
  saude_tributaria VARCHAR(15)
);
CREATE INDEX IF NOT EXISTS empresas_saude_tributaria_cnpj_idx ON empresas_saude_tributaria (cnpj);

CREATE TABLE IF NOT EXISTS empresas_simples (
  id SERIAL PRIMARY KEY,
  cnpj VARCHAR(18),
  optante_simples BOOLEAN,
  optante_simei BOOLEAN
);
CREATE INDEX IF NOT EXISTS empresas_simples_cnpj_idx ON empresas_simples (cnpj);
