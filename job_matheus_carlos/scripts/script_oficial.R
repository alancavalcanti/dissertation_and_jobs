install.packages("vctrs")
install.packages("electionsBR")

library(electionsBR)
library(tidyverse)


#baixando as bases
df_2014 <- candidate_fed(year = 2014)
df_2018 <- candidate_fed(year = 2018)
df_2022 <- candidate_fed(year = 2022)


#a base de 2022 foi importada localmente depois de baixá-la do site do TSe pois ela não está no electionsBR
df_2022 <- consulta_cand_2022_BRASIL

save(df_2014, file = "df_2014.Rda")
save(df_2018, file = "df_2018.Rda")
save(df_2022, file = "df_2022.Rda")

#filtrando apenas por deputados federais eleitos nos 3 anos
df_2014 <- df_2014 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

df_2018 <- df_2018 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

df_2022 <- df_2022 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

#selecionando variáveis de interesse nas 3 bases
df_2014 <- select(df_2014, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)
df_2018 <- select(df_2018, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)
df_2022 <- select(df_2022, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)


#transformando a variável CPF do ano de 2018 pois ela baixada do elections BR vem com o formato "characther"
df_2018$NR_CPF_CANDIDATO <- as.numeric(df_2018$NR_CPF_CANDIDATO)

# criando base com a interseção dos 3 anos
df_intersec <- inner_join(inner_join(df_2014, df_2018, by = "NR_CPF_CANDIDATO"), df_2022, by = "NR_CPF_CANDIDATO")
df_intersecao <- merge(merge(df_2014, df_2018, by = "NR_CPF_CANDIDATO"), df_2022, by = "NR_CPF_CANDIDATO")


#limpando base com interseção de 3 anos

df_intersec <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO.x)
df_intersec_18 <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO.y)
df_intersec_22 <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO) 


#renomeando as variáveis
df_intersec <- df_intersec %>%
  rename_all(~sub("\\.x$", "", .))

df_intersec_18 <- df_intersec_18 %>%
  rename_all(~sub("\\.y$", "", .))


#juntando as bases 
base_final <- rbind(df_intersec, df_intersec_18, df_intersec_22)

#salvando base final
save(base_final, file = "base_final.Rda")


#baixando as bases de anos anteriores para calcular tempo de carreira de cada candidato

df_2010 <- candidate_fed(year = 2010)
df_2006 <- candidate_fed(year = 2006)
df_2002 <- candidate_fed(year = 2002)
df_1998 <- candidate_fed(year = 1998)

#ajeitando as colunas das bases do ElectionsBR


df_1998 <- select(df_1998, ANO_ELEICAO, NUMERO_CANDIDATO, NOME_URNA_CANDIDATO, NUMERO_PARTIDO, SIGLA_PARTIDO, CODIGO_LEGENDA, "column 28")












#filtrando apenas por deputados federais eleitos nos 3 anos
df_1998 <- df_1998 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("DEPUTADO FEDERAL", "DEPUTADO ESTADUAL", "GOVERNADOR", "SENADOR", "VICE-GOVERNADOR"))

df_2018 <- df_2018 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

df_2022 <- df_2022 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")
