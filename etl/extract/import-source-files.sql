COPY cotacoes_bolsa (
    id,
    tp_reg,
    dt_pregao,
    cd_bdi,
    cd_acao,
    tp_merc,
    nm_empresa_rdz,
    especi,
    prazot,
    moeda_ref,
    vl_abertura,
    vl_maximo,
    vl_minimo,
    vl_medio,
    vl_fechamento,
    vl_mlh_oft_compra,
    vl_mlh_oft_venda,
    vl_ttl_neg,
    qt_tit_neg,
    vl_volume,
    vl_exec_opc,
    in_opc,
    dt_vnct_opc,
    ft_cotacao,
    vl_exec_moeda_corrente,
    cd_isin,
    cd_acao_rdz,
    created_at,
    updated_at,
    __index_level_0__
) FROM '/data-source/cotacoes_bolsa.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';');

COPY df_empresas (
    cnpj,
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
    situacao_cadastral
) FROM '/data-source/df_empresas.csv'
WITH (FORMAT csv, HEADER true, NULL '', FORCE_NULL (cd_cnae_principal), DELIMITER ';');

COPY empresas_bolsa (
    id,
    cd_acao_rdz,
    nm_empresa,
    setor_economico,
    subsetor,
    segmento,
    segmento_b3,
    nm_segmento_b3,
    cd_acao,
    tx_cnpj,
    vl_cnpj,
    created_at,
    updated_at
) FROM '/data-source/empresas_bolsa.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';');

COPY empresas_nivel_atividade (
    cnpj,
    nivel_atividade
) FROM '/data-source/empresas_nivel_atividade.csv'
WITH (FORMAT csv, HEADER true, NULL '', FORCE_NULL (nivel_atividade), DELIMITER ';');

COPY empresas_porte (
    cnpj,
    empresa_porte
) FROM '/data-source/empresas_porte.csv'
WITH (FORMAT csv, HEADER true, NULL '', FORCE_NULL (empresa_porte), DELIMITER ';');

COPY empresas_saude_tributaria (
    cnpj,
    saude_tributaria
) FROM '/data-source/empresas_saude_tributaria.csv'
WITH (FORMAT csv, HEADER true, NULL '', FORCE_NULL (saude_tributaria), DELIMITER ';');

COPY empresas_simples (
    cnpj,
    optante_simples,
    optante_simei
) FROM '/data-source/empresas_simples.csv'
WITH (FORMAT csv, HEADER true, NULL '', FORCE_NULL (optante_simples, optante_simei), DELIMITER ';');
