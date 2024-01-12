install.packages("vctrs")
install.packages("electionsBR")

remove.packages("electionsBR")

if (!require("devtools")) install.packages("devtools")
devtools::install_github("silvadenisson/electionsBR")
2

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
         DS_SIT_TOT_TURNO %in% c("ELEITO","ELEITO POR MÉDIA", "MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

df_2018 <- df_2018 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA","ELEITO", "MÉDIA", "ELEITO POR QP"), 
         DS_CARGO == "DEPUTADO FEDERAL")

df_2022 <- df_2022 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO POR MÉDIA", "MÉDIA", "ELEITO", "ELEITO POR QP"), 
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



####eleições federais
df_1998<- elections_tse(year = 1998, type = "candidate")
df_2002<- elections_tse(year = 2002, type = "candidate")
df_2006<- elections_tse(year = 2006, type = "candidate")
df_2010<- elections_tse(year = 2010, type = "candidate")

#base de 1996 foi baixada manualmente pelo site do TSE
df_1996<- read_excel("C:/Users/User/Desktop/job matheus/consulta_cand_1996_BRASIL.xlsx")

####eleições municipais
df_2000<- elections_tse(year = 2000, type = "candidate")
df_2004<- elections_tse(year = 2004, type = "candidate")
df_2008<- elections_tse(year = 2008, type = "candidate")
df_2012<- elections_tse(year = 2012, type = "candidate")
df_2016<- elections_tse(year = 2016, type = "candidate")
df_2020<- elections_tse(year = 2020, type = "candidate")


#filtrando pelos cargos eleitos
df_1998 <- df_1998 %>%
  filter(DS_SITUACAO_CANDIDATURA == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("DEPUTADO FEDERAL", "DEPUTADO ESTADUAL", "GOVERNADOR", "SENADOR", "VICE-GOVERNADOR"))

df_2000 <- df_2000 %>%
  filter(DS_SITUACAO_CANDIDATURA == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "ELEITO POR MÉDIA", "MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("PREFEITO", "VICE-PREFEITO", "VEREADOR"))

df_2002 <- df_2002 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "ELEITO POR MÉDIA", "MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("DEPUTADO FEDERAL", "DEPUTADO ESTADUAL", "GOVERNADOR", "SENADOR", "VICE-GOVERNADOR"))

df_2004 <- df_2004 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("PREFEITO", "VICE-PREFEITO", "VEREADOR"))

df_2006 <- df_2006 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("DEPUTADO FEDERAL", "DEPUTADO ESTADUAL", "GOVERNADOR", "SENADOR", "VICE-GOVERNADOR"))

df_2008 <- df_2008 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("VEREADOR", "PREFEITO", "VICE-PREFEITO"))

df_2010 <- df_2010 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("DEPUTADO FEDERAL", "DEPUTADO ESTADUAL", "GOVERNADOR", "SENADOR", "VICE-GOVERNADOR"))

df_2012 <- df_2012 %>%
  filter(DS_DETALHE_SITUACAO_CAND == "DEFERIDO", 
         DS_SIT_TOT_TURNO %in% c("ELEITO", "MÉDIA", "ELEITO POR MÉDIA", "ELEITO POR QP"), 
         DS_CARGO %in% c("VEREADOR", "PREFEITO", "VICE-PREFEITO"))

#criando a variável carreira

#bases de dados de eleições anteriores
bases_anteriores <- c("df_1998", "df_2000", "df_2002", "df_2004", "df_2006", "df_2008", "df_2010", "df_2012")



#função para calcular tempo de carreira
calcular_carreira <- function(cpf, bases) {
  carreira_info <- NULL
  
  for (base in bases) {
    if (cpf %in% base$NR_CPF_CANDIDATO) {
      indice <- which(base$NR_CPF_CANDIDATO == cpf)[1]
      cargo <- base$DS_CARGO[indice]
      ano_eleicao <- as.integer(base$ANO_ELEICAO[indice])
      
      if (is.null(carreira_info) || ano_eleicao < carreira_info$ano_eleicao) {
        carreira_info <- data.frame(cargo = cargo, ano_eleicao = ano_eleicao)
      }
    }
  }
  
  if (!is.null(carreira_info)) {
    anos_carreira <- 2014 - carreira_info$ano_eleicao
  } else {
    anos_carreira <- 0
  }
  
  return(anos_carreira)
}

#aplicando a função na base dos 146 deputados
df_intersec$carreira <- sapply(df_intersec$NR_CPF_CANDIDATO, calcular_carreira, bases = lapply(bases_anteriores, get))


#função que mostra o primeiro cargo público de cada deputado
calcular_carreira_cargo <- function(cpf, bases) {
  for (base in bases) {
    if (cpf %in% base$NR_CPF_CANDIDATO) {
      cargo <- base$DS_CARGO[base$NR_CPF_CANDIDATO == cpf][1]
      return(cargo)
    }
  }
  return(NA)
}

#aplicando a função na base df_intersec
df_intersec$carreira_cargo <- sapply(df_intersec$NR_CPF_CANDIDATO, calcular_carreira_cargo, bases = lapply(bases_anteriores, get))


#adicionando variável carreira na base final
base_final$carreira <- sapply(base_final$NR_CPF_CANDIDATO, calcular_carreira, bases = lapply(bases_anteriores, get))
base_final$carreira <- base_final$carreira + ifelse(base_final$ANO_ELEICAO == 2018, 4, ifelse(base_final$ANO_ELEICAO == 2022, 8, 0))


#adicionando variável que indica o primeiro cargo eletivo na base final
#adicionando a variável "carreira_cargo" na base_final
base_final$carreira_cargo <- sapply(base_final$NR_CPF_CANDIDATO, calcular_carreira_cargo, bases = lapply(bases_anteriores, get))

#atribuindo "DEPUTADO FEDERAL" nos casos específicos
base_final$carreira_cargo[base_final$carreira == 4 & base_final$ANO_ELEICAO == 2018] <- "DEPUTADO FEDERAL"
base_final$carreira_cargo[base_final$carreira == 8 & base_final$ANO_ELEICAO == 2022] <- "DEPUTADO FEDERAL"

#salvando base final
save(base_final, file = "base_final.Rda")
