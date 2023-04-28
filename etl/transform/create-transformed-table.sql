CREATE TABLE IF NOT EXISTS empresas (
    id SERIAL PRIMARY KEY,

    -- MERGED CNPJ
    cnpj VARCHAR(14),

    -- empresas_bolsa
    cd_acao_rdz VARCHAR(20),
    -- created_at VARCHAR(27),
    -- updated_at VARCHAR(27),
    nm_empresa VARCHAR(50),
    setor_economico VARCHAR(50),
    subsetor VARCHAR(100),
    segmento VARCHAR(100),
    segmento_b3 VARCHAR(50),
    nm_segmento_b3 VARCHAR(50),
    cd_acao VARCHAR(50),

    -- df_empresas
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
    situacao_cadastral VARCHAR(15),

    -- empresas_nivel_atividade
    nivel_atividade VARCHAR(15),

    -- empresas_porte
    empresa_porte VARCHAR(15),

    -- empresas_saude_tributaria
    saude_tributaria VARCHAR(15),

    -- empresas_simples
    optante_simples BOOLEAN,
    optante_simei BOOLEAN
);
CREATE INDEX IF NOT EXISTS empresas_cnpj_idx ON empresas (cnpj);
CREATE INDEX IF NOT EXISTS empresas_cd_acao_idx ON empresas (cd_acao_rdz);
