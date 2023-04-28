# DATABASE CONTAINER CSV IMPORTER

### PLEASE FOLLOW THE STEPS
#
- <a href="https://docs.docker.com/engine/release-notes/20.10/#201021" target="_blank">INSTALL DOCKER (v. 20.10.21)</a>
- <a href="https://docs.docker.com/compose/install/" target="_blank">INSTALL DOCKER COMPOSE (v. 2.13.0)</a>

## Running WINDOWS (container)
```
# development
docker-compose up
```

## Running LINUX (container)
```bash
# development
$ sudo docker-compose up
```

## 1: DATA SOURCE EXTRACT - CHECKLIST
### 1.1: COMPANIES
- DF EMPRESAS: CNPJ DISTINCT (11583) = RECORD NUMBER (11583) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cnpj))
    FROM public.df_empresas
    WHERE cnpj IS NOT NULL AND cnpj <> '';

    SELECT COUNT(*)
    FROM public.df_empresas;
</code>

- EMPRESAS BOLSA: CNPJ DISTINCT (419) != RECORD NUMBER (485) => 66 RECORDS WITHOUT CNPJ <br>
<code>
    SELECT COUNT(DISTINCT(vl_cnpj))
    FROM public.empresas_bolsa
    WHERE vl_cnpj IS NOT NULL AND vl_cnpj <> '';

    SELECT COUNT(*)
    FROM public.empresas_bolsa;

    SELECT COUNT(*)
    FROM public.empresas_bolsa
    WHERE vl_cnpj = '' OR vl_cnpj IS NULL;
</code>

- EMPRESAS NIVEL ATIVIDADE: CNPJ DISTINCT (11853) = RECORD NUMBER (11853) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cnpj))
    FROM public.empresas_nivel_atividade
    WHERE cnpj IS NOT NULL AND cnpj <> '';

    SELECT COUNT(*)
    FROM public.empresas_nivel_atividade;
</code>

- EMPRESAS PORTE: CNPJ DISTINCT (11853) = RECORD NUMBER (11853) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cnpj))
    FROM public.empresas_porte
    WHERE cnpj IS NOT NULL AND cnpj <> '';

    SELECT COUNT(*)
    FROM public.empresas_porte;
</code>

- EMPRESAS SAUDE TRIBUTARIA: CNPJ DISTINCT (11853) = RECORD NUMBER (11853) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cnpj))
    FROM public.empresas_saude_tributaria
    WHERE cnpj IS NOT NULL AND cnpj <> '';

    SELECT COUNT(*)
    FROM public.empresas_saude_tributaria;
</code>

- EMPRESAS SIMPLES: CNPJ DISTINCT (11868) = RECORD NUMBER (11868) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cnpj))
    FROM public.empresas_simples
    WHERE cnpj IS NOT NULL AND cnpj <> '';

    SELECT COUNT(*)
    FROM public.empresas_simples;
</code>
#
- CNPJ WHICH ARE IN ALL COMPANY TABLES => 256 <br>
<code>
    SELECT COUNT(*)
	    FROM public.empresas_bolsa eb
            INNER JOIN public.df_empresas de ON eb.vl_cnpj = de.cnpj
            INNER JOIN public.empresas_nivel_atividade ena ON eb.vl_cnpj = ena.cnpj
            INNER JOIN public.empresas_porte ep ON eb.vl_cnpj = ep.cnpj
            INNER JOIN public.empresas_saude_tributaria est ON eb.vl_cnpj = est.cnpj
            INNER JOIN public.empresas_simples es ON eb.vl_cnpj = es.cnpj;
</code>
#

### 1.2: STOCK EXCHANGE QUOTATION
- COTACOES BOLSA: CNPJ DISTINCT (384) != RECORD NUMBER (100089) => OK <br>
<code>
    SELECT COUNT(DISTINCT(cd_acao_rdz))
    FROM public.cotacoes_bolsa
    WHERE cd_acao_rdz IS NOT NULL AND cd_acao_rdz <> '';

    SELECT COUNT(*) 	
	FROM public.cotacoes_bolsa;
</code>
#
#

## 2: DATA TRANSFORMATION
### 2.1: CREATION OF A POPULATED BIG COMPANY TABLE (empresas)
