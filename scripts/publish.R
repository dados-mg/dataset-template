library(reticulate)

source("scripts/lib/utils.R")

use_virtualenv("r-reticulate", required = TRUE)
source_python("scripts/lib/utils.py")

output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path

res <- upload_resource(output, 
                       resource_id = "e5732e33-306f-422c-87b7-257c2e283de1", 
                       url = "http://dados.mg.gov.br", 
                       key = Sys.getenv("DADOSMG_PROD"))

stopifnot(check_upload(file = output, url = res$url))
