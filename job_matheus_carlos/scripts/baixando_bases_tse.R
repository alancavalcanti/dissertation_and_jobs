if (!require("devtools")) install.packages("devtools")
devtools::install_github("silvadenisson/electionsBR")
1


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