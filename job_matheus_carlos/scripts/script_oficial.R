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
df_2014 <- select(df_2014, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO, SG_PARTIDO)
df_2018 <- select(df_2018, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO, SG_PARTIDO)
df_2022 <- select(df_2022, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO, VR_DESPESA_MAX_CAMPANHA, ANO_ELEICAO, SG_PARTIDO)


#transformando a variável CPF do ano de 2018 pois ela baixada do elections BR vem com o formato "characther"
df_2018$NR_CPF_CANDIDATO <- as.numeric(df_2018$NR_CPF_CANDIDATO)

# criando base com a interseção dos 3 anos
df_intersec <- inner_join(inner_join(df_2014, df_2018, by = "NR_CPF_CANDIDATO"), df_2022, by = "NR_CPF_CANDIDATO")
df_intersecao <- merge(merge(df_2014, df_2018, by = "NR_CPF_CANDIDATO"), df_2022, by = "NR_CPF_CANDIDATO")


#limpando base com interseção de 3 anos

df_intersec <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, SG_PARTIDO.x, ANO_ELEICAO.x)
df_intersec_18 <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, SG_PARTIDO.y, ANO_ELEICAO.y)
df_intersec_22 <- select(df_intersecao, NM_CANDIDATO, NM_URNA_CANDIDATO, NR_CPF_CANDIDATO, DS_GENERO, NM_UE, NR_IDADE_DATA_POSSE, NR_TITULO_ELEITORAL_CANDIDATO , VR_DESPESA_MAX_CAMPANHA, SG_PARTIDO, ANO_ELEICAO) 


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


##########adicionando id de deputados na base ########

# Substitua "seu_data_frame" pelo nome da sua base de dados
dep_codes <- data.frame(NM_URNA_CANDIDATO = c("AFONSO MOTTA", "AFONSO FLORENCE", "AGUINALDO RIBEIRO", "ALCEU MOREIRA", "ALEX MANENTE", "ALEXANDRE LEITE", "ALICE PORTUGAL", "ALIEL MACHADO", "ALTINEU CORTES", "ALUISIO MENDES", "ANDRÉ FUFUCA", "ANDRÉ FIGUEIREDO", "CARLOS GOMES", "ANTONIO BRITO", "TONINHO WANDSCHEER", "ARLINDO CHINAGLIA", "ARNALDO JARDIM", "ARTHUR MAIA", "ATILA LINS", "AUREO RIBEIRO", "BENEDITA DA SILVA", "CARLOS ZARATTINI", "CARLOS SAMPAIO", "CARMEN ZANOTTO", "CÉLIO SILVEIRA", "CELSO RUSSOMANNO", "CLAUDIO CAJADO", "CLEBER VERDE", "DAGOBERTO", "DR. DAMIÃO", "DANIEL", "DANRLEI DE DEUS GOLEIRO", "POMPEO DE MATTOS", "DIEGO GARCIA", "DIEGO ANDRADE", "DIMAS FABIANO", "MARCON", "DOMINGOS NETO", "DOMINGOS SÁVIO", "DELEGADO EDER MAURO", "EDUARDO DA FONTE", "EDUARDO BOLSONARO", "ELCIONE", "ELMAR NASCIMENTO", "BOHN GASS", "ENIO VERRI", "ERIKA KOKAY", "EROS BIONDINI", "EVAIR DE MELO", "FABIO REIS", "FAUSTO PINATO", "FELIPE CARRERAS", "FELIX MENDONÇA", "FERNANDO FILHO", "GIACOBO", "FLAVIA MORAIS", "PASTOR EURICO", "TIRIRICA", "GILBERTO NASCIMENTO", "GIOVANI CHERINI", "GLAUBER", "HEITOR SCHUCH", "HELDER SALOMÃO", "HUGO LEAL", "HUGO MOTTA", "JANDIRA FEGHALI", "JEFFERSON CAMPOS", "BACELAR", "JOÃO CARLOS BACELAR", "PADRE JOÃO", "JOAO DANIEL", "JOAQUIM PASSARINHO", "JHONATAN DE JESUS", "JORGE SOLLA", "JOSE AIRTON", "AFONSO HAMM", "JOSÉ ROCHA", "CAPITÃO AUGUSTO", "PRIANTE", "ZECA DIRCEU", "JUSCELINO FILHO", "LEONARDO MONTEIRO", "GUIMARÃES DO PT", "ZÉ SILVA", "WELLINGTON ROBERTO", "JULIO CÉSAR", "LEANDRE", "LINCOLN PORTELA", "LUCIANO DUCCI", "LUCIO MOSQUINI", "COVATTI FILHO", "LUIS TIBÉ", "BALEIA ROSSI", "LUIZ NISHIMORI", "PAULO TEIXEIRA", "LUIZA ERUNDINA", "LUIZIANNE LINS", "MAGDA MOFATTO", "MARCELO ÁLVARO ANTÔNIO", "MARCIO MARINHO", "MARCIO BIOLCHI", "MARCIO ALVINO", "PASTOR MARCO FELICIANO", "MARIA DO ROSÁRIO", "DR MÁRIO HERINGER", "MÁRIO NEGROMONTE JR", "MARX BELTRÃO", "MIGUEL LOMBARDI", "MISAEL VARELLA", "MOSES RODRIGUES", "NEWTON CARDOSO JR", "NILTO TATTO", "ODAIR CUNHA", "OSMAR TERRA", "PATRUS ANANIAS", "PAULO ABI-ACKEL", "PAULÃO", "PAULO FOLETTO", "PAULO FREIRE DA COSTA", "PAULO PIMENTA", "PAULO AZI", "PROFESSOR PEDRO UCZAI", "PEDRO PAULO", "REGINALDO LOPES", "REJANE DIAS", "RENATA ABREU", "RICARDO BARROS", "RODRIGO DE CASTRO", "ROSANGELA GOMES", "RUBENS OTONI", "RUBENS PEREIRA JR", "SANDRO ALEX", "SÉRGIO SOUZA", "SÉRGIO BRITO", "SILAS CÂMARA", "SORAYA SANTOS", "SÓSTENES CAVALCANTE", "STEFANO AGUIAR", "VALMIR ASSUNÇÃO", "VANDER LOUBET", "VICENTINHO JUNIOR", "VINICIUS GURGEL", "VINICIUS CARVALHO", "VITOR LIPPI", "WALDENOR PEREIRA", "WELITON PRADO"))

# Criação da variável deputado_id
dep_codes$deputado_.id <- NA

# Mapeamento dos códigos para os deputados
codigo_deputados <- c(
  "AFONSO MOTTA" = 178835,
  "AFONSO FLORENCE" = 160508,
  "AGUINALDO RIBEIRO" = 160527,
  "ALCEU MOREIRA" = 160559,
  "ALEX MANENTE" = 178972,
  "ALEXANDRE LEITE" = 160545,
  "ALICE PORTUGAL" = 74057,
  "ALIEL MACHADO" = 178927,
  "ALTINEU CORTES" = 178937,
  "ALUISIO MENDES" = 178881,
  "ANDRÉ FUFUCA" = 178882,
  "ANDRÉ FIGUEIREDO" = 133439,
  "CARLOS GOMES" = 178962,
  "ANTONIO BRITO" = 160553,
  "TONINHO WANDSCHEER" = 178934,
  "ARLINDO CHINAGLIA" = 73433,
  "ARNALDO JARDIM" = 141391,
  "ARTHUR MAIA" = 160600,
  "ATILA LINS" = 74090,
  "AUREO RIBEIRO" = 160512,
  "BENEDITA DA SILVA" = 73701,
  "CARLOS ZARATTINI" = 141398,
  "CARLOS SAMPAIO" = 74262,
  "CARMEN ZANOTTO" = 164360,
  "CÉLIO SILVEIRA" = 178876,
  "CELSO RUSSOMANNO" = 73441,
  "CLAUDIO CAJADO" = 74537,
  "CLEBER VERDE" = 141408,
  "DAGOBERTO" = 141411,
  "DR. DAMIÃO" = 74467,
  "DANIEL" = 74060,
  "DANRLEI DE DEUS GOLEIRO" = 160552,
  "POMPEO DE MATTOS" = 73486,
  "DIEGO GARCIA" = 178929,
  "DIEGO ANDRADE" = 160588,
  "DIMAS FABIANO" = 160599,
  "MARCON" = 160535,
  "DOMINGOS NETO" = 143632,
  "DOMINGOS SÁVIO" = 160758,
  "DELEGADO EDER MAURO" = 178908,
  "EDUARDO DA FONTE" = 141421,
  "EDUARDO BOLSONARO" = 92346,
  "ELCIONE" = 74075,
  "ELMAR NASCIMENTO" = 178854,
  "BOHN GASS" = 160538,
  "ENIO VERRI" = 132504,
  "ERIKA KOKAY" = 160575,
  "EROS BIONDINI" = 160640,
  "EVAIR DE MELO" = 178871,
  "FABIO REIS" = 171623,
  "FAUSTO PINATO" = 66828,
  "FELIPE CARRERAS" = 72442,
  "FELIX MENDONÇA" = 160666,
  "FERNANDO FILHO" = 141431,
  "GIACOBO" = 74383,
  "FLAVIA MORAIS" = 160598,
  "PASTOR EURICO" = 160642,
  "TIRIRICA" = 160976,
  "GILBERTO NASCIMENTO" = 74270,
  "GIOVANI CHERINI" = 160673,
  "GLAUBER" = 152605,
  "HEITOR SCHUCH" = 178964,
  "HELDER SALOMÃO" = 178873,
  "HUGO LEAL" = 141450,
  "HUGO MOTTA" = 160674,
  "JANDIRA FEGHALI" = 74848,
  "JEFFERSON CAMPOS" = 74273,
  "BACELAR" = 69871,
  "JOÃO CARLOS BACELAR" = 141458,
  "PADRE JOÃO" = 160556,
  "JOAO DANIEL" = 178970,
  "JOAQUIM PASSARINHO" = 178910,
  "JHONATAN DE JESUS" = 160531,
  "JORGE SOLLA" = 178857,
  "JOSE AIRTON" = 141464,
  "AFONSO HAMM" = 136811,
  "JOSÉ ROCHA" = 74554,
  "CAPITÃO AUGUSTO" = 178829,
  "PRIANTE" = 74079,
  "ZECA DIRCEU" = 160592,
  "JUSCELINO FILHO" = 178886,
  "LEONARDO MONTEIRO" = 74156,
  "GUIMARÃES DO PT" = 141470,
  "ZÉ SILVA" = 160632,
  "WELLINGTON ROBERTO" = 74043,
  "JULIO CÉSAR" = 74317,
  "LEANDRE" = 178832,
  "LINCOLN PORTELA" = 74585,
  "LUCIANO DUCCI" = 178931,
  "LUCIO MOSQUINI" = 178954,
  "COVATTI FILHO" = 178963,
  "LUIS TIBÉ" = 160510,
  "BALEIA ROSSI" = 178975,
  "LUIZ NISHIMORI" = 162332,
  "PAULO TEIXEIRA" = 141488,
  "LUIZA ERUNDINA" = 74784,
  "LUIZIANNE LINS" = 178866,
  "MAGDA MOFATTO" = 166402,
  "MARCELO ÁLVARO ANTÔNIO" = 179000,
  "MARCIO MARINHO" = 150418,
  "MARCIO BIOLCHI" = 179001,
  "MARCIO ALVINO" = 178983,
  "PASTOR MARCO FELICIANO" = 160601,
  "MARIA DO ROSÁRIO" = 74398,
  "DR MÁRIO HERINGER" = 74158,
  "MÁRIO NEGROMONTE JR" = 178858,
  "MARX BELTRÃO" = 178843,
  "MIGUEL LOMBARDI" = 178985,
  "MISAEL VARELLA" = 178895,
  "MOSES RODRIGUES" = 178997,
  "NEWTON CARDOSO JR" = 178896,
  "NILTO TATTO" = 178986,
  "ODAIR CUNHA" = 74159,
  "OSMAR TERRA" = 73692,
  "PATRUS ANANIAS" = 74160,
  "PAULO ABI-ACKEL" = 141516,
  "PAULÃO" = 171617,
  "PAULO FOLETTO" = 160517,
  "PAULO FREIRE DA COSTA" = 160558,
  "PAULO PIMENTA" = 74400,
  "PAULO AZI" = 178860,
  "PROFESSOR PEDRO UCZAI" = 160604,
  "PEDRO PAULO" = 122158,
  "REGINALDO LOPES" = 74161,
  "REJANE DIAS" = 178925,
  "RENATA ABREU" = 178989,
  "RICARDO BARROS" = 73788,
  "RODRIGO DE CASTRO" = 141531,
  "ROSANGELA GOMES" = 178945,
  "RUBENS OTONI" = 74371,
  "RUBENS PEREIRA JR" = 178887,
  "SANDRO ALEX" = 160621,
  "SÉRGIO SOUZA" = 178933,
  "SÉRGIO BRITO" = 73808,
  "SILAS CÂMARA" = 74356,
  "SORAYA SANTOS" = 178946,
  "SÓSTENES CAVALCANTE" = 178947,
  "STEFANO AGUIAR" = 92776,
  "VALMIR ASSUNÇÃO" = 160610,
  "VANDER LOUBET" = 74376,
  "VICENTINHO JUNIOR" = 137070,
  "VINICIUS GURGEL" = 160591,
  "VINICIUS CARVALHO" = 141555,
  "VITOR LIPPI" = 178992,
  "WALDENOR PEREIRA" = 160569,
  "WELITON PRADO" = 160518
)

dep_codes <- dep_codes %>%
  mutate(deputado_.id = codigo_deputados[NM_URNA_CANDIDATO])

base_final <- left_join(dep_codes, base_final, by = "NM_URNA_CANDIDATO")


########## DADOS ABERTOS DA CÂMARA ##############

library(tidyverse)


# 1. Filtrar para as legislaturas desejadas (55, 56, 57)
frentesDeputados <- frentesDeputados %>%
  filter(deputado_.idLegislatura %in% c(55, 56, 57))

# Criar a base para legislatura 55
legislatura_55 <- subset(frentesDeputados, deputado_.idLegislatura == 55)

# Criar a base para legislatura 56
legislatura_56 <- subset(frentesDeputados, deputado_.idLegislatura == 56)

# Criar a base para legislatura 57
legislatura_57 <- subset(frentesDeputados, deputado_.idLegislatura == 57)


#limpando as legislaturas
legislatura_55 <- select(legislatura_55, id, titulo, deputado_.id, deputado_.nome, deputado_.idLegislatura, deputado_.titulo, deputado_.siglaUf, id)
legislatura_56 <- select(legislatura_56, id, titulo, deputado_.id, deputado_.nome, deputado_.idLegislatura, deputado_.titulo, deputado_.siglaUf, id)
legislatura_57 <- select(legislatura_57, id, titulo, deputado_.id, deputado_.nome, deputado_.idLegislatura, deputado_.titulo, deputado_.siglaUf, id)


#filtrando casos específicos
legislatura_55 <- legislatura_55 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

legislatura_56 <- legislatura_56 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

legislatura_57 <- legislatura_57 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)


#criando variáveis para cada deputado

######legislatura 55 (2015-2018)
# Crie um novo dataframe agrupando os dados por deputado e contando as participações
novo_dataframe_15 <- legislatura_55 %>%
  group_by(deputado_.id, deputado_.nome) %>%
  summarise(
    total_membro = sum(deputado_.titulo == "Membro"),
    total_coordenador = sum(deputado_.titulo == "Coordenador")
  )

novo_dataframe_15$ANO_ELEICAO <- 2014

######legislatura 56 (2019-2022)
# Crie um novo dataframe agrupando os dados por deputado e contando as participações
novo_dataframe_19 <- legislatura_56 %>%
  group_by(deputado_.id, deputado_.nome) %>%
  summarise(
    total_membro = sum(deputado_.titulo == "Membro"),
    total_coordenador = sum(deputado_.titulo == "Coordenador")
  )
novo_dataframe_19$ANO_ELEICAO <- 2018

######legislatura 57 (2023-2026)
# Crie um novo dataframe agrupando os dados por deputado e contando as participações
novo_dataframe_23 <- legislatura_57 %>%
  group_by(deputado_.id, deputado_.nome) %>%
  summarise(
    total_membro = sum(deputado_.titulo == "Membro"),
    total_coordenador = sum(deputado_.titulo == "Coordenador")
  )

novo_dataframe_23$ANO_ELEICAO <- 2022

#filtrando casos específicos
novo_dataframe_15 <- novo_dataframe_15 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

novo_dataframe_19 <- novo_dataframe_19 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

novo_dataframe_23 <- novo_dataframe_23 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)


#CORRIGINDO CASOS REPETIDOS
# Seu dataframe original
casos_repetidos_15 <- data.frame(
  deputado_.id = c(72442, 72442, 160575, 160575),
  deputado_nome = c("Felipe Carreras", "FELIPE CARRERAS", "Erika Kokay", "ERIKA KOKAY"),
  total_membro = c(0, 3, 1, 157),
  total_coordenador = c(1, 0, 0, 7),
  ANO_ELEICAO = c(2014, 2014, 2014, 2014)
)

# Correção do dataframe
casos_repetidos_15 <- novo_dataframe_15 %>%
  group_by(deputado_.id, ANO_ELEICAO) %>%
  summarise(
    deputado_nome = first(deputado_.nome),
    total_membro = sum(total_membro),
    total_coordenador = sum(total_coordenador)
  )



##juntando variáveis de frente parlamentar na base dos dados do tse
base_final_2 <- rbind(novo_dataframe_19, novo_dataframe_23, casos_repetidos_15)
base_final <- base_final %>%
  left_join(base_final_2, by = c("deputado_.id", "ANO_ELEICAO"))

base_final <- subset(base_final, select = -c(deputado_.nome, deputado_nome))

save(base_final, file = "base_final.Rda")





####DADOS DE MESAS DIRETORAS#######
legislaturasMesas <- legislaturasMesas %>%
  filter(idLegislatura %in% c(55, 56, 57))

# Criar a base para legislatura 55
legislatura_mesa_55 <- subset(legislaturasMesas, idLegislatura == 55)

# Criar a base para legislatura 56
legislatura_mesa_56 <- subset(legislaturasMesas, idLegislatura == 56)

# Criar a base para legislatura 57
legislatura_mesa_57 <- subset(legislaturasMesas, idLegislatura == 57)


legislatura_mesa_55$ANO_ELEICAO <- 2014
legislatura_mesa_56$ANO_ELEICAO <- 2018
legislatura_mesa_57$ANO_ELEICAO <- 2022


legislatura_mesa_55 <- select(legislatura_mesa_55, idDeputado, nomeDeputado, cargo, ANO_ELEICAO)
legislatura_mesa_56 <- select(legislatura_mesa_56, idDeputado, nomeDeputado, cargo, ANO_ELEICAO)
legislatura_mesa_57 <- select(legislatura_mesa_57, idDeputado, nomeDeputado, cargo, ANO_ELEICAO)


legislatura_mesa_55 <- rename(legislatura_mesa_55, deputado_.id = idDeputado)
legislatura_mesa_56 <- rename(legislatura_mesa_56, deputado_.id = idDeputado)
legislatura_mesa_57 <- rename(legislatura_mesa_57, deputado_.id = idDeputado)




#filtrando casos específicos
legislatura_mesa_55 <- legislatura_mesa_55 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

legislatura_mesa_56 <- legislatura_mesa_56 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

legislatura_mesa_57 <- legislatura_mesa_57 %>%
  filter(deputado_.id %in% base_final$deputado_.id,)

#juntando na base final

base_final_3 <- rbind(legislatura_mesa_55, legislatura_mesa_56, legislatura_mesa_57)

base_final <- base_final %>%
  left_join(base_final_3, by = c("deputado_.id", "ANO_ELEICAO"))

save(base_final, file = "base_final.Rda")

