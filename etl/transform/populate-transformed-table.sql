-- FIRST: SELECT ALL DATA
CREATE VIEW empresas_meged_view AS
SELECT 
    -- MERGED CNPJ
	COALESCE(eb.vl_cnpj, de.cnpj, ena.cnpj, ep.cnpj, est.cnpj, es.cnpj) AS cnpj,

    -- empresas_bolsa
    eb.cd_acao_rdz AS cd_acao_rdz,
    eb.nm_empresa AS nm_empresa,
    eb.setor_economico AS setor_economico,
    eb.subsetor AS subsetor,
    eb.segmento AS segmento,
    eb.segmento_b3 AS segmento_b3,
    eb.nm_segmento_b3 AS nm_segmento_b3,
    eb.cd_acao AS cd_acao,
    -- eb.created_at AS created_at,
    -- eb.updated_at AS updated_at,

    -- df_empresas
    de.dt_abertura AS dt_abertura,
    de.empresa_matriz AS empresa_matriz,
    de.cd_cnae_principal AS cd_cnae_principal,
    de.de_cnae_principal AS de_cnae_principal,
    de.de_ramo_atividade AS de_ramo_atividade,
    de.de_setor AS de_setor,
    de.endereco_cep AS endereco_cep,
    de.endereco_municipio AS endereco_municipio,
    de.endereco_uf AS endereco_uf,
    de.endereco_regiao AS endereco_regiao,
    de.endereco_mesorregiao AS endereco_mesorregiao, 
    de.situacao_cadastral AS situacao_cadastral,

    -- empresas_nivel_atividade
    ena.nivel_atividade AS nivel_atividade,
    
    -- empresas_porte
    ep.empresa_porte AS empresa_porte,

    -- empresas_saude_tributaria
    est.saude_tributaria AS saude_tributaria,

    -- empresas_simples
    es.optante_simples AS optante_simples,
    es.optante_simei AS optante_simei

FROM public.empresas_simples es
FULL OUTER JOIN public.df_empresas de ON es.cnpj = de.cnpj
FULL OUTER JOIN public.empresas_nivel_atividade ena ON es.cnpj = ena.cnpj
FULL OUTER JOIN public.empresas_porte ep ON es.cnpj = ep.cnpj
FULL OUTER JOIN public.empresas_saude_tributaria est ON es.cnpj = est.cnpj
FULL OUTER JOIN public.empresas_bolsa eb ON es.cnpj = eb.vl_cnpj

WHERE (
	COALESCE(eb.vl_cnpj, de.cnpj, ena.cnpj, ep.cnpj, est.cnpj, es.cnpj) IS NOT NULL AND 
		COALESCE(eb.vl_cnpj, de.cnpj, ena.cnpj, ep.cnpj, est.cnpj, es.cnpj) <> ''
	)
		OR
	(
		eb.cd_acao_rdz IS NOT NULL AND eb.cd_acao_rdz <> ''
	)
;



-- SECOND: SELECT ALL DISTINCT DATA
CREATE VIEW empresas_view AS
SELECT DISTINCT ON (ev.cnpj) ev.* FROM empresas_meged_view ev
UNION
SELECT DISTINCT ON (ev.cd_acao_rdz) ev.* FROM empresas_meged_view ev;



-- THIRD: INSERT
INSERT INTO empresas (
    -- MERGED CNPJ
    cnpj,

    -- empresas_bolsa
    cd_acao_rdz,
    -- created_at,
    -- updated_at,
    nm_empresa,
    setor_economico,
    subsetor,
    segmento,
    segmento_b3,
    nm_segmento_b3,
    cd_acao,

    -- df_empresas
    dt_abertura,
    empresa_matriz,
    cd_cnae_principal,
    de_cnae_principal,
    de_ramo_atividade,
    de_setor,
    endereco_cep,
    endereco_municipio,
    endereco_uf,
    endereco_regiao,
    endereco_mesorregiao,
    situacao_cadastral,

    -- empresas_nivel_atividade
    nivel_atividade,

    -- empresas_porte
    empresa_porte,

    -- empresas_saude_tributaria
    saude_tributaria,

    -- empresas_simples
    optante_simples,
    optante_simei
)
SELECT * FROM empresas_view;



-- FILL FOREIGN KEY VALUES
UPDATE cotacoes_bolsa cb
SET empresa_id = em.id
FROM empresas em
WHERE cb.cd_acao_rdz = em.cd_acao_rdz;
