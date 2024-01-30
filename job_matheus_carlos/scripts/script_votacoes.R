###ajustando bases de orientações e votações#####
library(tidyverse)


#####Nesse código abaixo eu transformo todas as orientações de bancadas em grupo em orientações partidárias individuais
#####Esse processo precisa ser realizado várias vezes por ano para "limpar" todas as bancadas conjuntas



##### ANO DE 2015 
#Transformando bancada "PmdbPpPtbDemSdPscPhsPen"

votacoesOrientacoes_2015 <- select(votacoesOrientacoes_2015, idVotacao, descricao, siglaBancada, orientacao)

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTB", "DEM", "SD", "PSC", "PHS", "PEN", "PMDB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PmdbPpPtbDemSdPscPhsPen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Remover os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PmdbPpPtbDemSdPscPhsPen", ]


#Transformando bancada "PmdbPpPtbPscPhsPen"


# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTB", "PSC", "PHS", "PEN", "PMDB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PmdbPpPtbPscPhsPen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PmdbPpPtbPscPhsPen", ]



#Transformando bancada "PrbPtnPmnPrpPsdcPrtb"


# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN", "PRP", "PSDC", "PRTB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PrbPtnPmnPrpPsdcPrtb", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PrbPtnPmnPrpPsdcPrtb", ]



#Transformando bancada "PrbPtnPmnPrpPsdcPrtbPtcPslPtdoB

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN", "PRP", "PSDC", "PRTB", "PTC", "PSL", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PrbPtnPmnPrpPsdcPrtbPtcPslPtdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PrbPtnPmnPrpPsdcPrtbPtcPslPtdoB", ]


#Transformando bancada "PsdbPsbPps

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "PSB", "PPS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PsdbPsbPps", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PsdbPsbPps", ]


#Transformando bancada "PsdbPsbPpsPv 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "PSB", "PPS", "PV")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PsdbPsbPpsPv", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PsdbPsbPpsPv", ]


#Transformando bancada "PtPsdPrPdtProsPcdob 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PT", "PSD", "PR", "PDT", "PROS", "PCdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PtPsdPrPdtProsPcdob", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PtPsdPrPdtProsPcdob", ]


#Transformando bancada "PmdbPen

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PMDB", "PEN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PmdbPen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PmdbPen", ]


#Transformando bancada "PpPtbPscPhs

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTB", "PSC", "PHS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PpPtbPscPhs", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PpPtbPscPhs", ]


#Transformando bancada "PrbPtnPmnPrpPsdcPtcPslPtdoB

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN", "PRP", "PSDC", "PTC", "PSL", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PrbPtnPmnPrpPsdcPtcPslPtdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PrbPtnPmnPrpPsdcPtcPslPtdoB", ]


#Transformando bancada "PrPsdPros 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PR", "PSD", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PrPsdPros", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PrPsdPros", ]


#Transformando bancada "PrbPtnPmnPtcPtdoB 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN", "PTC", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PrbPtnPmnPtcPtdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PrbPtnPmnPtcPtdoB", ]


#Transformando bancada "PmdbPpPtbDem...  

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PMDB", "PP", "PMN", "PTB", "DEM")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada == "PmdbPpPtbDem...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2015 <- rbind(votacoesOrientacoes_2015, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2015 <- votacoesOrientacoes_2015[votacoesOrientacoes_2015$siglaBancada != "PmdbPpPtbDem...", ]


#ajeitando o partido solidariedade pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried"

votacoesOrientacoes_2015$siglaBancada[votacoesOrientacoes_2015$siglaBancada == "Solidaried"] <- "SD"

###Juntando com a base dos votos dos deputados de 2015###
votacoesVotos_2015 <- select(votacoesVotos_2015, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2015 <- rename(votacoesOrientacoes_2015, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2015 <- votacoesVotos_2015 %>%
  left_join(votacoesOrientacoes_2015, by = c("idVotacao", "deputado_siglaPartido"))

save(votacoes_orientacoes_2015, file = "votacoes_orientacoes_2015.Rda")


bancadas <- table(votacoesOrientacoes_2015$siglaBancada)
print(bancadas)


parties <- table(votacoesVotos_2015$deputado_siglaPartido)
print(parties)





###2016###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2016 <- select(votacoesOrientacoes_2016, idVotacao, descricao, siglaBancada, orientacao)


#olhando quais bancadas orientaram em conjunto
bancadas <- table(votacoesOrientacoes_2016$siglaBancada)
print(bancadas)

#Transformando bancada PmdbPen 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PMDB", "PEN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PmdbPen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PmdbPen", ]



#Transformando bancada PpPtbPsc 

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTB", "PSC")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PpPtbPsc", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PpPtbPsc", ]

#Transformando bancada PrbPtnPmnPtcPtdoB

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN","PTC", "PTdoB" )

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrbPtnPmnPtcPtdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrbPtnPmnPtcPtdoB", ]



#Transformando bancada PrbPtnPmnPtcPtdoBPsl

# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PMN","PTC", "PTdoB", "PSL" )

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrbPtnPmnPtcPtdoBPsl", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrbPtnPmnPtcPtdoBPsl", ]


#Transformando bancada PpPtbPscPhs
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTB", "PSC", "PHS" )

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PpPtbPscPhs", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PpPtbPscPhs", ]

#Transformando bancada PrPros
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PR", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrPros", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrPros", ]

#Transformando bancada PrPsdPros
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PR","PSD", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrPsdPros", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrPsdPros", ]

#Transformando bancada PtnPtdoBPsl
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTN", "PTdoB", "PSL")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PtnPtdoBPsl", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PtnPtdoBPsl", ]

#Transformando bancada PrbPtnPtcPtdoBPsl
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PTC", "PTdoB", "PSL")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrbPtnPtcPtdoBPsl", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrbPtnPtcPtdoBPsl", ]


#Transformando bancada PrbPtnPtdobPsl
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PRB", "PTN", "PTdoB", "PSL")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada == "PrbPtnPtdobPsl", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2016 <- rbind(votacoesOrientacoes_2016, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2016 <- votacoesOrientacoes_2016[votacoesOrientacoes_2016$siglaBancada != "PrbPtnPtdobPsl", ]



#ajeitando o partido solidariedade pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried"

votacoesOrientacoes_2016$siglaBancada[votacoesOrientacoes_2016$siglaBancada == "Solidaried"] <- "SD"



###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2016 <- select(votacoesVotos_2016, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2016 <- rename(votacoesOrientacoes_2016, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2016 <- votacoesVotos_2016 %>%
  left_join(votacoesOrientacoes_2016, by = c("idVotacao", "deputado_siglaPartido"))

save(votacoes_orientacoes_2016, file = "votacoes_orientacoes_2016.Rda")




parties <- table(votacoesVotos_2016$deputado_siglaPartido)
print(parties)


###2017###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2017 <- select(votacoesOrientacoes_2017, idVotacao, descricao, siglaBancada, orientacao)

#Transformando bancada PpPodePTdoB
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PODE", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpPodePTdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpPodePTdoB", ]



#Transformando bancada PpPsdPtn...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PSD", "PTN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpPsdPtn...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpPsdPtn...", ]


#Transformando bancada PpPTdoB
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpPTdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpPTdoB", ]


#Transformando bancada PpPtnPhs...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTN", "PHS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpPtnPhs...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpPtnPhs...", ]



#Transformando bancada PpPtnPTdoB
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PTN", "PTdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpPtnPTdoB", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpPtnPTdoB", ]



#Transformando bancada PtPdtPcdob
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PT", "PDT", "PCdoB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PtPdtPcdob", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PtPdtPcdob", ]


#Transformando bancada PmdbPsdbPp...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PMDB", "PSDB", "PP")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PmdbPsdbPp...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PmdbPsdbPp...", ]

#Transformando bancada PtbProsPsl 
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTB", "PROS", "PSL")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PtbProsPsl", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PtbProsPsl", ]



#Transformando bancada PtbProsPslPrp 
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTB", "PROS", "PSL", "PRP")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PtbProsPslPrp", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PtbProsPslPrp", ]

#Transformando bancada PtbSdPros... 
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTB", "PROS", "SD")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PtbSdPros...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PtbSdPros...", ]


#Transformando bancada PpAvante 
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "AVANTE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada == "PpAvante", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2017 <- rbind(votacoesOrientacoes_2017, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2017 <- votacoesOrientacoes_2017[votacoesOrientacoes_2017$siglaBancada != "PpAvante", ]


bancadas <- table(votacoesOrientacoes_2017$siglaBancada)
print(bancadas)



#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"

votacoesOrientacoes_2017$siglaBancada[votacoesOrientacoes_2017$siglaBancada == "Solidaried"] <- "SD"
votacoesOrientacoes_2017$siglaBancada[votacoesOrientacoes_2017$siglaBancada == "Podemos"] <- "PODE"


###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2017 <- select(votacoesVotos_2017, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2017 <- rename(votacoesOrientacoes_2017, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2017 <- votacoesVotos_2017 %>%
  left_join(votacoesOrientacoes_2017, by = c("idVotacao", "deputado_siglaPartido"))

save(votacoes_orientacoes_2017, file = "votacoes_orientacoes_2017.Rda")


parties <- table(votacoesVotos_2017$deputado_siglaPartido)
print(parties)


###2018###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2018 <- select(votacoesOrientacoes_2018, idVotacao, descricao, siglaBancada, orientacao)

#Transformando bancada PmdbPpDemPsbPdtPodePcdobPscPhsAvantePen
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PMDB", "PP", "DEM", "PSB", "PDT", "PODE", "PCdOB", "PSC", "PHS", "AVANTE", "PEN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PmdbPpDemPsbPdtPodePcdobPscPhsAvantePen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PmdbPpDemPsbPdtPodePcdobPscPhsAvantePen", ]




#Transformando bancada PpPodeAvante
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PODE", "AVANTE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PpPodeAvante", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PpPodeAvante", ]




#Transformando bancada PpPodeAvantePen
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PODE", "AVANTE", "PEN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PpPodeAvantePen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PpPodeAvantePen", ]



#Transformando bancada PpPodePscAvantePen
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "PODE","PSC", "AVANTE", "PEN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PpPodePscAvantePen", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PpPodePscAvantePen", ]


#Transformando bancada PtbProsPslPrp
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTB", "PROS","PSL", "PRP")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PtbProsPslPrp", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PtbProsPslPrp", ]



#Transformando bancada PtbPros
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PTB", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PtbPros", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PtbPros", ]



#Transformando bancada PrPrbSd
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PR", "PRB", "SD")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PrPrbSd", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PrPrbSd", ]



#Transformando bancada PsdbPrPrbPtbSdPpsProsPslPrp
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "PR", "PRB", "PTB", "SD", "PPS", "PROS", "PSL", "PRP")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PsdbPrPrbPtbSdPpsProsPslPrp", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PsdbPrPrbPtbSdPpsProsPslPrp", ]




#Transformando bancada PsdbPsdPrPrb...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "PSD", "PRB", "PR")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PsdbPsdPrPrb...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PsdbPsdPrPrb...", ]


#Transformando bancada PpAvante
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "AVANTE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada == "PpAvante", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2018 <- rbind(votacoesOrientacoes_2018, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2018 <- votacoesOrientacoes_2018[votacoesOrientacoes_2018$siglaBancada != "PpAvante", ]

bancadas <- table(votacoesOrientacoes_2018$siglaBancada)
print(bancadas)

#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"

votacoesOrientacoes_2018$siglaBancada[votacoesOrientacoes_2018$siglaBancada == "Solidaried"] <- "SD"
votacoesOrientacoes_2018$siglaBancada[votacoesOrientacoes_2018$siglaBancada == "Podemos"] <- "PODE"
votacoesOrientacoes_2018$siglaBancada[votacoesOrientacoes_2018$siglaBancada == "Patriota"] <- "PATRI"


###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2018 <- select(votacoesVotos_2018, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2018 <- rename(votacoesOrientacoes_2018, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2018 <- votacoesVotos_2018 %>%
  left_join(votacoesOrientacoes_2018, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2018, file = "votacoes_orientacoes_2018.Rda")


parties <- table(votacoesVotos_2018$deputado_siglaPartido)
print(parties)


###2019###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2019 <- select(votacoesOrientacoes_2019, idVotacao, descricao, siglaBancada, orientacao)

#Transformando bancada PpPrPsd
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PR", "PP", "PSD")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PpPrPsd", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PpPrPsd", ]


#Transformando bancada PdtAvante
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PDT", "AVANTE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PdtAvante", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PdtAvante", ]



#Transformando bancada PdtPodePros...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PDT", "PODE", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PdtPodePros...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PdtPodePros...", ]


#Transformando bancada PdtPros...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PDT", "PROS")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PdtPros...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PdtPros...", ]

#Transformando bancada PdtSdPode...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PDT", "SD", "PODE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PdtSdPode...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PdtSdPode...", ]



#Transformando bancada PslPpPsd...
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSL", "PP", "PSD")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PslPpPsd...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PslPpPsd...", ]


#Transformando bancada PpMdbPtb
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "MDB", "PTB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada == "PpMdbPtb", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2019 <- rbind(votacoesOrientacoes_2019, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2019 <- votacoesOrientacoes_2019[votacoesOrientacoes_2019$siglaBancada != "PpMdbPtb", ]

                                                     
bancadas <- table(votacoesOrientacoes_2019$siglaBancada)
print(bancadas)

parties <- table(votacoesVotos_2019$deputado_siglaPartido)
print(parties)


#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "Solidaried"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "SD"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "Podemos"] <- "PODE"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "Patriota"] <- "PATRIOTA"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "Avante"] <- "AVANTE"
votacoesOrientacoes_2019$siglaBancada[votacoesOrientacoes_2019$siglaBancada == "Republican"] <- "REPUBLICANOS"

###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2019 <- select(votacoesVotos_2019, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2019 <- rename(votacoesOrientacoes_2019, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2019 <- votacoesVotos_2019 %>%
  left_join(votacoesOrientacoes_2019, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2019, file = "votacoes_orientacoes_2019.Rda")


parties <- table(votacoesVotos_2019$deputado_siglaPartido)
print(parties)

                 

###2020###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2020 <- select(votacoesOrientacoes_2020, idVotacao, descricao, siglaBancada, orientacao)

bancadas <- table(votacoesOrientacoes_2020$siglaBancada)
print(bancadas)

#Transformando bancada PpMdbPtb
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PP", "MDB", "PTN")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2020[votacoesOrientacoes_2020$siglaBancada == "PpMdbPtb", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2020 <- rbind(votacoesOrientacoes_2020, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2020 <- votacoesOrientacoes_2020[votacoesOrientacoes_2020$siglaBancada != "PpMdbPtb", ]

bancadas <- table(votacoesOrientacoes_2020$siglaBancada)
print(bancadas)
               
parties <- table(votacoesVotos_2020$deputado_siglaPartido)
print(parties)
                     

#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Solidaried"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Rede"] <- "REDE"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Cidadania"] <- "CIDADANIA"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Avante"] <- "AVANTE"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Patriota"] <- "PATRIOTA"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Republican"] <- "REPUBLICANOS"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Novo"] <- "NOVO"
votacoesOrientacoes_2020$siglaBancada[votacoesOrientacoes_2020$siglaBancada == "Podemos"] <- "PODE"

###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2020 <- select(votacoesVotos_2020, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2020 <- rename(votacoesOrientacoes_2020, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2020 <- votacoesVotos_2020 %>%
  left_join(votacoesOrientacoes_2020, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2020, file = "votacoes_orientacoes_2020.Rda")





###2021###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2021 <- select(votacoesOrientacoes_2021, idVotacao, descricao, siglaBancada, orientacao)

bancadas <- table(votacoesOrientacoes_2021$siglaBancada)
print(bancadas)

parties <- table(votacoesVotos_2021$deputado_siglaPartido)
print(parties)


#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Solidaried"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Rede"] <- "REDE"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Cidadania"] <- "CIDADANIA"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Avante"] <- "AVANTE"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Patriota"] <- "PATRIOTA"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Republican"] <- "REPUBLICANOS"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Novo"] <- "NOVO"
votacoesOrientacoes_2021$siglaBancada[votacoesOrientacoes_2021$siglaBancada == "Podemos"] <- "PODE"


###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2021 <- select(votacoesVotos_2021, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2021 <- rename(votacoesOrientacoes_2021, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2021 <- votacoesVotos_2021 %>%
  left_join(votacoesOrientacoes_2021, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2021, file = "votacoes_orientacoes_2021.Rda")



###2022###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2022 <- select(votacoesOrientacoes_2022, idVotacao, descricao, siglaBancada, orientacao)

bancadas <- table(votacoesOrientacoes_2022$siglaBancada)
print(bancadas)

parties <- table(votacoesVotos_2022$deputado_siglaPartido)
print(parties)



#Transformando bancada NovoCidPv      
# 01. Replicar os casos para cada partido desagregado
partidos <- c("NOVO", "CIDADANIA", "PV")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2022[votacoesOrientacoes_2022$siglaBancada == "NovoCidPv", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2022 <- rbind(votacoesOrientacoes_2022, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2022 <- votacoesOrientacoes_2022[votacoesOrientacoes_2022$siglaBancada != "NovoCidPv", ]

#Transformando bancada PscPtb      
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSC", "PTB")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2022[votacoesOrientacoes_2022$siglaBancada == "PscPtb", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2022 <- rbind(votacoesOrientacoes_2022, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2022 <- votacoesOrientacoes_2022[votacoesOrientacoes_2022$siglaBancada != "PscPtb", ]



#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Solidaried"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Rede"] <- "REDE"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Cidadania"] <- "CIDADANIA"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Avante"] <- "AVANTE"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Patriota"] <- "PATRIOTA"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Republican"] <- "REPUBLICANOS"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Novo"] <- "NOVO"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "Podemos"] <- "PODE"
votacoesOrientacoes_2022$siglaBancada[votacoesOrientacoes_2022$siglaBancada == "União"] <- "UNIÃO"

###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2022 <- select(votacoesVotos_2022, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2022 <- rename(votacoesOrientacoes_2022, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2022 <- votacoesVotos_2022 %>%
  left_join(votacoesOrientacoes_2022, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2022, file = "votacoes_orientacoes_2022.Rda")









###2023###

#limpando um pouco a base de orientacoes
votacoesOrientacoes_2023 <- select(votacoesOrientacoes_2023, idVotacao, descricao, siglaBancada, orientacao)

bancadas <- table(votacoesOrientacoes_2023$siglaBancada)
print(bancadas)

parties <- table(votacoesVotos_2023$deputado_siglaPartido)
print(parties)


#Transformando bancada Bl MdbPsdRepPode      
# 01. Replicar os casos para cada partido desagregado
partidos <- c("MDB", "PSD", "REPUBLICANOS", "PODE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Bl MdbPsdRepPode", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Bl MdbPsdRepPode", ]


#Transformando bancada Bl MdbPsdRepPodePsc     
# 01. Replicar os casos para cada partido desagregado
partidos <- c("MDB", "PSD", "REPUBLICANOS", "PODE", "PSC")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Bl MdbPsdRepPodePsc", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Bl MdbPsdRepPodePsc", ]

#Transformando bancada Bl UniPpFdrPsdbCid..     
# 01. Replicar os casos para cada partido desagregado
partidos <- c("UNIÃO", "PP", "PSDB", "PODE", "CIDADANIA")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Bl UniPpFdrPsdbCid...", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Bl UniPpFdrPsdbCid...", ]

#Transformando bancada Fdr PSDB-CIDADAN    
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "CIDADANIA")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Fdr PSDB-CIDADAN", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Fdr PSDB-CIDADAN", ]

#Transformando bancada Fdr PSDB-CIDADANIA    
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSDB", "CIDADANIA")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Fdr PSDB-CIDADANIA", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Fdr PSDB-CIDADANIA", ]

#Transformando bancada Fdr PSOL-REDE    
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PSOL", "REDE")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Fdr PSOL-REDE", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Fdr PSOL-REDE", ]


#Transformando bancada Fdr PT-PCdoB-PV   
# 01. Replicar os casos para cada partido desagregado
partidos <- c("PT", "PCdoB", "PV")

# 02 - Filtrar os casos da bancada em grupo
bancada_grupo <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada == "Fdr PT-PCdoB-PV", ]

# 03 Para cada partido, replicar os casos e alterar a sigla do partido
for (partido in partidos) {
  novo_partido <- bancada_grupo
  novo_partido$siglaBancada <- partido
  votacoesOrientacoes_2023 <- rbind(votacoesOrientacoes_2023, novo_partido)
}

# 04 Agora, remova os casos da bancada em grupo
votacoesOrientacoes_2023 <- votacoesOrientacoes_2023[votacoesOrientacoes_2023$siglaBancada != "Fdr PT-PCdoB-PV", ]


bancadas <- table(votacoesOrientacoes_2023$siglaBancada)
print(bancadas)


parties <- table(votacoesVotos_2023$deputado_siglaPartido)
print(parties)




#ajeitando o partido solidariedade e PODEMOS pois em algumas orientações ele aparece como "SD" e em outras como "Solidaried", já o podemos por vezes aparece como "PODE" e outras como "Podemos"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "Solidaried"] <- "SOLIDARIEDADE"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "Avante"] <- "AVANTE"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "Patriota"] <- "PATRIOTA"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "Novo"] <- "NOVO"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "Podemos"] <- "PODE"
votacoesOrientacoes_2023$siglaBancada[votacoesOrientacoes_2023$siglaBancada == "União"] <- "UNIÃO"

###Juntando com a base dos votos dos deputados de 2016###

votacoesVotos_2023 <- select(votacoesVotos_2023, idVotacao, dataHoraVoto, voto, deputado_id, deputado_nome, deputado_siglaPartido)
votacoesOrientacoes_2023 <- rename(votacoesOrientacoes_2023, "deputado_siglaPartido" = "siglaBancada")

votacoes_orientacoes_2023 <- votacoesVotos_2023 %>%
  left_join(votacoesOrientacoes_2023, by = c("idVotacao", "deputado_siglaPartido"))
save(votacoes_orientacoes_2023, file = "votacoes_orientacoes_2023.Rda")
