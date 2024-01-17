install.packages("vctrs")
install.packages("electionsBR")
install.packages("readr")
library(readr)

library(electionsBR)
library(tidyverse)

unique_values <- unique(receitas_candidatos$`Fonte de receita`)
unique_cargo <- unique(receitas_candidatos$`Cargo`)
unique_candidatura <- unique(receitas_candidatos$`Situação de candidatura`)
unique_tot <- unique(receitas_candidatos$`Situação de totalização`)
print(unique_tot)


df_2014 <- candidate_fed(year = 2014)
df_2018 <- candidate_fed(year = 2018)
df_2022 <- candidate_fed(year = 2022)

rm(base_final)


candidatos <- select(df_intersec, NM_URNA_CANDIDATO.x)

df_1996 <- consulta_cand_1996_BRASIL
df_2022 <- read.csv("consulta_cand_2022_BRASIL.csv")

df_2022 <- consulta_cand_2022_BRASIL

years <- c(2014, 2018, 2022)

tse_data <- list()

for (year_value in years) {
  
  d <- electionsBR::elections_tse(year = year_value, type = "vote_mun_zone")
  
  d <- d %>%
    filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
           DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "ELEITO POR QP"), 
           DS_CARGO == "Deputado Federal")
  
  tse_data[[as.character(year_value)]] <- d
  
  filename <- paste0("tse_data_", year_value, ".csv")
  write.csv(tse_data[[as.character(year_value)]], fil