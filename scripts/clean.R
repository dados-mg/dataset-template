library(magrittr)

source("scripts/lib/utils.R")

input <- "data-raw/letters.csv"
output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path

result <- input %>%
            read()

readr::write_excel_csv(result, path = output)
