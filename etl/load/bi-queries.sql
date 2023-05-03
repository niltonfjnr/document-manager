-- 2 ITEMS
SELECT DISTINCT(em.optante_simples)
FROM public.empresas em
WHERE em.optante_simples IS NOT NULL
OFFSET 0 LIMIT 100;

-- 2 ITEMS
SELECT COUNT(DISTINCT(em.optante_simei))
FROM public.empresas em
WHERE em.optante_simei IS NOT NULL
OFFSET 0 LIMIT 100;

-- 4 ITEMS
SELECT DISTINCT(em.saude_tributaria)
FROM public.empresas em
WHERE em.saude_tributaria IS NOT NULL AND em.saude_tributaria <> ''
OFFSET 0 LIMIT 100;

-- 5 ITEMS
SELECT DISTINCT(em.nivel_atividade)
FROM public.empresas em
WHERE em.nivel_atividade IS NOT NULL AND em.nivel_atividade <> ''
OFFSET 0 LIMIT 100;

-- 5 ITEMS
SELECT DISTINCT(em.empresa_porte)
FROM public.empresas em
WHERE em.empresa_porte IS NOT NULL AND em.empresa_porte <> ''
OFFSET 0 LIMIT 100;

-- 5 ITEMS
SELECT DISTINCT(em.de_setor)
FROM public.empresas em
WHERE em.de_setor IS NOT NULL AND em.de_setor <> ''
OFFSET 0 LIMIT 100;

-- 5 ITEMS
SELECT DISTINCT(em.endereco_regiao)
FROM public.empresas em
WHERE em.endereco_regiao IS NOT NULL AND em.endereco_regiao <> ''
OFFSET 0 LIMIT 100;

-- 12 ITEMS
SELECT DISTINCT(em.setor_economico)
FROM public.empresas em 
WHERE em.setor_economico IS NOT NULL AND em.setor_economico <> ''
OFFSET 0 LIMIT 100;

-- 26 ITEMS
SELECT DISTINCT(em.de_ramo_atividade)
FROM public.empresas em
WHERE em.de_ramo_atividade IS NOT NULL AND em.de_ramo_atividade <> ''
OFFSET 0 LIMIT 100;

-- 27 ITEMS
SELECT DISTINCT(em.endereco_uf)
FROM public.empresas em
WHERE em.endereco_uf IS NOT NULL AND em.endereco_uf <> ''
OFFSET 0 LIMIT 100;

-- 45 ITEMS
SELECT DISTINCT(em.subsetor)
FROM public.empresas em
WHERE em.subsetor IS NOT NULL AND em.subsetor <> ''
OFFSET 0 LIMIT 100;

-- 84 ITEMS
SELECT DISTINCT(em.segmento)
FROM public.empresas em
WHERE em.segmento IS NOT NULL AND em.segmento <> ''
OFFSET 0 LIMIT 100;

-- 136 ITEMS
SELECT DISTINCT(em.endereco_mesorregiao)
FROM public.empresas em
WHERE em.endereco_mesorregiao IS NOT NULL AND em.endereco_mesorregiao <> ''
OFFSET 0 LIMIT 100;

-- 900 ITEMS
SELECT COUNT(DISTINCT(em.de_cnae_principal))
FROM public.empresas em
WHERE em.de_cnae_principal IS NOT NULL AND em.de_cnae_principal <> ''
OFFSET 0 LIMIT 100;

-- 2264 ITEMS
SELECT DISTINCT(em.endereco_municipio)
FROM public.empresas em
WHERE em.endereco_municipio IS NOT NULL AND em.endereco_municipio <> ''
OFFSET 0 LIMIT 100;
