install.packages("vctrs")
install.packages("electionsBR")

library(electionsBR)
library(tidyverse)



df_2014 <- candidate_fed(year = 2014)
df_2018 <- candidate_fed(year = 2018)
df_2022 <- candidate_fed(year = 2022)

df_2022 <- consulta_cand_2022_BRASIL

save(df_2014, file = "df_2014.Rda")
save(df_2018, file = "df_2018.Rda")
save(df_2022, file = "df_2022.Rda")

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


df_2014 <- select(df_2014, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)
df_2018 <- select(df_2018, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)
df_2022 <- select(df_2022, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO)


df_intersec<- merge(merge(df_2014, df_2018, by = "NR_CPF_CANDIDATO"), df_2022, by = "NR_CPF_CANDIDATO")

