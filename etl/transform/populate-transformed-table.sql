-- FIRST: SELECT ALL DATA
SELECT
	eb.id AS empresas_bolsa_id,
    eb.cd_acao_rdz AS empresas_bolsa_cd_acao_rdz,
    eb.nm_empresa AS empresas_bolsa_nm_empresa,
    eb.setor_economico AS empresas_bolsa_setor_economico,
    eb.subsetor AS empresas_bolsa_subsetor,
    eb.segmento AS empresas_bolsa_segmento,
    eb.segmento_b3 AS empresas_bolsa_segmento_b3,
    eb.nm_segmento_b3 AS empresas_bolsa_nm_segmento_b3,
    eb.cd_acao AS empresas_bolsa_cd_acao,
    eb.tx_cnpj AS empresas_bolsa_tx_cnpj,
    eb.vl_cnpj AS empresas_bolsa_vl_cnpj,
    eb.created_at AS empresas_bolsa_created_at,
    eb.updated_at AS empresas_bolsa_updated_at,

	de.id AS df_empresas_id,
    de.cnpj AS df_empresas_cnpj,
    de.dt_abertura AS df_empresas_dt_abertura,
    de.empresa_matriz AS df_empresas_empresa_matriz,
    de.cd_cnae_principal AS df_empresas_cd_cnae_principal,
    de.de_cnae_principal AS df_empresas_de_cnae_principal,
    de.de_ramo_atividade AS df_empresas_de_ramo_atividade,
    de.de_setor AS df_empresas_de_setor,
    de.endereco_cep AS df_empresas_endereco_cep,
    de.endereco_municipio AS df_empresas_endereco_municipio,
    de.endereco_uf AS df_empresas_endereco_uf,
    de.endereco_regiao AS df_empresas_endereco_regiao,
    de.endereco_mesorregiao AS df_empresas_endereco_mesorregiao, 
    de.situacao_cadastral AS df_empresas_situacao_cadastral,

    ena.id AS empresas_nivel_atividade_id,
    ena.cnpj AS empresas_nivel_atividade_cnpj,
    ena.nivel_atividade AS empresas_nivel_atividade_nivel_atividade,

    ep.id AS empresas_porte_id,
    ep.cnpj AS empresas_porte_cnpj,
    ep.empresa_porte AS empresas_porte_empresa_porte,

    est.id AS empresas_saude_tributaria_id,
    est.cnpj AS empresas_saude_tributaria_cnpj,
    est.saude_tributaria AS empresas_saude_tributaria_saude_tributaria,

    es.id AS empresas_simples_id,
    es.cnpj AS empresas_simples_cnpj,
    es.optante_simples AS empresas_simples_optante_simples,
    es.optante_simei AS empresas_simples_optante_simei,
	
	cb.id AS cotacoes_bolsa_id,
	cb.tp_reg AS cotacoes_bolsa_tp_reg,
	cb.dt_pregao AS cotacoes_bolsa_dt_pregao,
	cb.cd_bdi AS cotacoes_bolsa_cd_bdi,
	cb.cd_acao AS cotacoes_bolsa_cd_acao,
	cb.tp_merc AS cotacoes_bolsa_tp_merc,
	cb.nm_empresa_rdz AS cotacoes_bolsa_nm_empresa_rdz,
	cb.especi AS cotacoes_bolsa_especi,
	cb.prazot AS cotacoes_bolsa_prazot,
	cb.moeda_ref AS cotacoes_bolsa_moeda_ref,
	cb.vl_abertura AS cotacoes_bolsa_vl_abertura,
	cb.vl_maximo AS cotacoes_bolsa_vl_maximo,
	cb.vl_minimo AS cotacoes_bolsa_vl_minimo,
	cb.vl_medio AS cotacoes_bolsa_vl_medio,
	cb.vl_fechamento AS cotacoes_bolsa_vl_fechamento,
	cb.vl_mlh_oft_compra AS cotacoes_bolsa_vl_mlh_oft_compra,
	cb.vl_mlh_oft_venda AS cotacoes_bolsa_vl_mlh_oft_venda,
	cb.vl_ttl_neg AS cotacoes_bolsa_vl_ttl_neg,
	cb.qt_tit_neg AS cotacoes_bolsa_qt_tit_neg,
	cb.vl_volume AS cotacoes_bolsa_vl_volume,
	cb.vl_exec_opc AS cotacoes_bolsa_vl_exec_opc,
	cb.in_opc AS cotacoes_bolsa_in_opc,
	cb.dt_vnct_opc AS cotacoes_bolsa_dt_vnct_opc,
	cb.ft_cotacao AS cotacoes_bolsa_ft_cotacao,
	cb.vl_exec_moeda_corrente AS cotacoes_bolsa_vl_exec_moeda_corrente,
	cb.cd_isin AS cotacoes_bolsa_cd_isin,
	cb.cd_acao_rdz AS cotacoes_bolsa_cd_acao_rdz,
	cb.created_at AS cotacoes_bolsa_created_at,
	cb.updated_at AS cotacoes_bolsa_updated_at,
	cb.__index_level_0__ AS cotacoes_bolsa___index_level_0__

FROM public.empresas_bolsa eb
INNER JOIN public.df_empresas de ON eb.vl_cnpj = de.cnpj
INNER JOIN public.empresas_nivel_atividade ena ON eb.vl_cnpj = ena.cnpj
INNER JOIN public.empresas_porte ep ON eb.vl_cnpj = ep.cnpj
INNER JOIN public.empresas_saude_tributaria est ON eb.vl_cnpj = est.cnpj
INNER JOIN public.empresas_simples es ON eb.vl_cnpj = es.cnpj
INNER JOIN public.cotacoes_bolsa cb ON eb.cd_acao LIKE CONCAT('%', cb.cd_acao, '%')

OFFSET 0 LIMIT 10;

-- SECOND: INSERT