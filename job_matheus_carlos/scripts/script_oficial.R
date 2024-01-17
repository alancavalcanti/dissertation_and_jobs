install.packages("vctrs")

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
consulta_cand_2022_BRASIL <- read_excel("consulta_cand_2022_BRASIL.xlsx")
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


####eleições municipais
df_2000<- elections_tse(year = 2000, type = "candidate")
df_2004<- elections_tse(year = 2004, type = "candidate")
df_2008<- elections_tse(year = 2008, type = "candidate")
df_2012<- elections_tse(year = 2012, type = "candidate")



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



# Adicionando a variável de tempo de carreira ao dataframe "base_final"
base_final$TEMPO_DE_CARREIRA <- sapply(1:nrow(base_final), function(i) {
  cpf <- base_final$NR_CPF_CANDIDATO[i]
  
  # Calculando a contagem de bases até 2012
  contagem_bases <- sum(sapply(bases_anteriores, function(base_name) {
    base <- get(base_name)
    if (cpf %in% base$NR_CPF_CANDIDATO && base$ANO_ELEICAO[cpf == base$NR_CPF_CANDIDATO] <= 2012) {
      return(1)
    } else {
      return(0)
    }
  }))
  
  # Adicionando anos de carreira e considerando 4 anos para 2018 e 8 anos para 2022
  anos_carreira <- contagem_bases * 4
  anos_carreira <- anos_carreira + ifelse(base_final$ANO_ELEICAO[i] == 2018, 4, ifelse(base_final$ANO_ELEICAO[i] == 2022, 8, 0))
  
  return(anos_carreira)
})


#salvando base final
save(base_final, file = "base_final.Rda")



#adicionando variáveis de financiamento de campanha na base de dados

#PRIMEIRO PASSO: IMPORTAR A BASE "receitas_candidatos" das eleições de 2018 e 2022


#####2018####
#####filtrando pelos deputados eleitos em 2014, 18 e 22

receitas_candidatos <- receitas_candidatos %>%
  rename(NM_CANDIDATO = `Nome candidato`)

#filtre apenas os casos presentes na "base_final"
receitas_filtradas <- receitas_candidatos %>%
  filter(NM_CANDIDATO %in% base_final$NM_CANDIDATO)

#transformando a os valores para soma
receitas_filtradas$`Valor de receita` <- as.numeric(gsub(",", "", receitas_filtradas$`Valor de receita`))

#agregando por tipo de receita e deputado
receitas_agregadas <- receitas_filtradas %>%
  group_by(NM_CANDIDATO, `Fonte de receita`) %>%
  summarise(Valor_Total = sum(`Valor de receita`))

#reshape 
receitas_wide <- receitas_agregadas %>%
  pivot_wider(names_from = `Fonte de receita`, values_from = Valor_Total, values_fill = 0)

#criando variável de ano
receitas_wide$ANO_ELEICAO <- 2018

#juntando com base_final 
base_final <- left_join(base_final, receitas_wide, by = c("NM_CANDIDATO" = "NM_CANDIDATO", "ANO_ELEICAO" = "ANO_ELEICAO"))


#####2022####

#####filtrando pelos deputados eleitos em 2014, 18 e 22

receitas_candidatos_1_ <- receitas_candidatos_1_ %>%
  rename(NM_CANDIDATO = `Nome candidato`)

#filtre apenas os casos presentes na "base_final"
receitas_filtradas_1_ <- receitas_candidatos_1_ %>%
  filter(NM_CANDIDATO %in% base_final$NM_CANDIDATO)

#transformando a os valores para soma
receitas_filtradas_1_$`Valor de receita` <- as.numeric(gsub(",", "", receitas_filtradas_1_$`Valor de receita`))

#agregando por tipo de receita e deputado
receitas_agregadas_1_ <- receitas_filtradas_1_ %>%
  group_by(NM_CANDIDATO, `Fonte de receita`) %>%
  summarise(Valor_Total = sum(`Valor de receita`))

#reshape 
receitas_wide_1_ <- receitas_agregadas_1_ %>%
  pivot_wider(names_from = `Fonte de receita`, values_from = Valor_Total, values_fill = 0)

#criando variável de ano
receitas_wide_1_$ANO_ELEICAO <- 2022

#juntando com base_final 
# Supondo que você já tenha carregado a "base_final" e "receitas_wide_1"

# Supondo que você já tenha carregado a "base_final" e "receitas_wide_1"

# Junte a "base_final" com "receitas_wide_1" considerando o ano
resultado_final <- left_join(base_final, receitas_wide_1_, by = c("NM_CANDIDATO", "ANO_ELEICAO"))

# Substitua os valores faltantes na "base_final" pelos valores correspondentes em "receitas_wide_1"
resultado_final <- resultado_final %>%
  mutate(
    FUNDO_PARTIDARIO = coalesce(`FUNDO PARTIDARIO.x`, `FUNDO PARTIDARIO.y`),
    OUTROS_RECURSOS = coalesce(`OUTROS RECURSOS.x`, `OUTROS RECURSOS.y`),
    FUNDO_ESPECIAL = coalesce(`FUNDO ESPECIAL.x`, `FUNDO ESPECIAL.y`)
  ) %>%
  select(-ends_with(".y"))
#removendo variaveis a mais
resultado_final <- resultado_final %>%
  select(-c(`FUNDO ESPECIAL.x`, `FUNDO PARTIDARIO.x`, `OUTROS RECURSOS.x`))


base_final <- resultado_final

save(base_final, file = "base_final.Rda")
