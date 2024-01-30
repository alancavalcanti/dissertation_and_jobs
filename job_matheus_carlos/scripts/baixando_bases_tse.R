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

rm(base_unificada)


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
            
            
            
            
            
            
            # Supondo que seu dataframe seja chamado 'legislatura_55'
            # Certifique-se de substituir 'nome_do_dataframe' pelo nome real do seu dataframe
            
            # Contar a frequência de cada frente parlamentar
            frequencia_frentes <- table(legislatura_55$titulo)
            
            # Exibir a tabela de frequência
            print(frequencia_frentes)
            
            # Criar um gráfico de barras
            barplot(frequencia_frentes, main="Distribuição de Deputados por Frente Parlamentar",
                    xlab="Frente Parlamentar", ylab="Número de Deputados",
                    col="steelblue", las=2, cex.names=0.7)
            # Calcular a média do número de deputados por frente parlamentar
            media_deputados <- mean(frequencia_frentes)
            
            # Exibir a média
            print(paste("Média do número de deputados por frente parlamentar: ", round(media_deputados, 2)))            
            
            
            
            # Contar o número de frentes parlamentares distintas
            numero_frentes <- length(unique(legislatura_55$titulo))
            
            # Exibir o resultado
            print(paste("Número de frentes parlamentares distintas: ", numero_frentes))
            
bancadas <- table(votacoesVotos_2015$deputado_siglaPartido)
print(bancadas)            



PsdbPsbPps - Sim - 298878-277

# Supondo que seu dataframe seja chamado 'legislatura_55'
# Certifique-se de substituir 'nome_do_dataframe' pelo nome real do seu dataframe

# Contar a frequência de cada frente parlamentar
frequencia_frentes <- table(legislatura_57$titulo)

# Ordenar as frentes parlamentares pelo número de deputados em ordem decrescente
frentes_ordenadas <- sort(frequencia_frentes, decreasing = TRUE)

# Selecionar as 10 maiores frentes parlamentares
top_10_frentes <- frentes_ordenadas[1:10]

# Exibir as 10 maiores frentes
print("As 10 maiores frentes parlamentares:")
print(top_10_frentes)

summary(legislatura_55$titulo)


# Contar a frequência de cada frente parlamentar
frequencia_frentes <- table(legislatura_55$titulo)

# Criar um dataframe com informações sobre as frentes parlamentares
dados_frentes <- data.frame(
  Frente = names(frequencia_frentes),
  NumDeputados = as.numeric(frequencia_frentes),
  stringsAsFactors = FALSE
)

# Ordenar o dataframe pelo número de deputados em ordem decrescente
dados_frentes_ordenados <- dados_frentes[order(-dados_frentes$NumDeputados), ]

# Selecionar as 10 maiores frentes parlamentares
top_10_frentes <- dados_frentes_ordenados[1:10, ]

# Exibir as 10 maiores frentes parlamentares com o número de deputados
print("As 10 maiores frentes parlamentares com o número de deputados:")
print(top_10_frentes)


print("Estatísticas Descritivas das Frentes Parlamentares:")
print(summary(legislatura_55$titulo))


# Contar a frequência de cada frente parlamentar
frequencia_frentes <- table(legislatura_55$titulo)

# Exibir a tabela de frequência
print(frequencia_frentes)





# Contar a frequência de cada frente parlamentar excluindo aquelas que possuem "Mista" no nome
frequencia_frentes <- table(legislatura_55$titulo[!grepl("Mista", legislatura_55$titulo)])

# Criar um dataframe com informações sobre as frentes parlamentares
dados_frentes <- data.frame(
  Frente = names(frequencia_frentes),
  NumDeputados = as.numeric(frequencia_frentes),
  stringsAsFactors = FALSE
)

# Ordenar o dataframe pelo número de deputados em ordem decrescente
dados_frentes_ordenados <- dados_frentes[order(-dados_frentes$NumDeputados), ]

# Selecionar as 10 maiores frentes parlamentares
top_10_frentes <- dados_frentes_ordenados[1:10, ]


# Exibir as 10 maiores frentes parlamentares com o número de deputados
print("As 10 maiores frentes parlamentares (excluindo aquelas que possuem 'Mista' no nome):")
print(top_10_frentes)




# Conte o número de membros em cada frente parlamentar, excluindo "Mista"
resultados <- legislatura_55 %>%
  filter(!str_detect(titulo, "Mista")) %>%
  group_by(titulo) %>%
  summarise(num_membros = n_distinct(deputado_.titulo))

# Ordene os resultados pelo número de membros em ordem decrescente
resultados <- resultados %>%
  arrange(desc(num_membros))

# Selecione as 10 maiores frentes parlamentares
top_10_maiores <- head(resultados, 10)

# Imprima o resultado
print(top_10_maiores)









# Crie a nova base excluindo as frentes parlamentares que possuem "Mista" no nome
nova_base <- legislatura_55 %>%
  filter(!grepl("Mista", titulo, ignore.case = TRUE))

# Conte a frequência de cada frente parlamentar e ordene de forma decrescente
top_10_frentes <- nova_base %>%
  count(titulo, sort = TRUE) %>%
  slice_head(n = 10)

# Visualize as 10 maiores frentes parlamentares
print(top_10_frentes)


# Crie a nova base excluindo as frentes parlamentares que possuem "Mista" no nome
nova_base_2 <- legislatura_56 %>%
  filter(!grepl("Mista", titulo, ignore.case = TRUE))

# Conte a frequência de cada frente parlamentar e ordene de forma decrescente
top_10_frentes_2 <- nova_base_2 %>%
  count(titulo, sort = TRUE) %>%
  slice_head(n = 10)

# Visualize as 10 maiores frentes parlamentares
print(top_10_frentes_2)


# Crie a nova base excluindo as frentes parlamentares que possuem "Mista" no nome
nova_base_3 <- legislatura_57 %>%
  filter(!grepl("Mista", titulo, ignore.case = TRUE))

# Conte a frequência de cada frente parlamentar e ordene de forma decrescente
top_10_frentes_3 <- nova_base_3 %>%
  count(titulo, sort = TRUE) %>%
  slice_head(n = 10)

# Visualize as 10 maiores frentes parlamentares
print(top_10_frentes_3)






# Instale as bibliotecas necessárias se ainda não tiver
# install.packages("tidyverse")

# Carregue as bibliotecas
library(tidyverse)

# Supondo que você já tenha os dataframes carregados no ambiente global
# Certifique-se de que as variáveis 'orientacao' estejam presentes em cada dataframe

votacoesOrientacoes_2015$ano <- 2015
votacoesOrientacoes_2016$ano <- 2016
votacoesOrientacoes_2017$ano <- 2017
votacoesOrientacoes_2018$ano <- 2018
votacoesOrientacoes_2019$ano <- 2019
votacoesOrientacoes_2020$ano <- 2020
votacoesOrientacoes_2021$ano <- 2021
votacoesOrientacoes_2022$ano <- 2022
votacoesOrientacoes_2023$ano <- 2023


# Combine todos os dataframes em um único dataframe
dados_unificadoss <- bind_rows(
  votacoesOrientacoes_2015,
  votacoesOrientacoes_2016,
  votacoesOrientacoes_2017,
  votacoesOrientacoes_2018,
  votacoesOrientacoes_2019,
  votacoesOrientacoes_2020,
  votacoesOrientacoes_2021,
  votacoesOrientacoes_2022,
  votacoesOrientacoes_2023
)

# Crie o gráfico unificado com o histograma
dados_unificadoss %>%
  ggplot(aes(x = orientacao, fill = orientacao)) +
  geom_bar() +
  facet_wrap(~ano, scales = "free") +
  labs(title = "Histograma de Orientações Partidárias por Ano",
       x = "Orientação",
       y = "Contagem") +
  theme_minimal()

