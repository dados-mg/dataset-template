library(reticulate)

source("scripts/lib/utils.R")

use_virtualenv("r-reticulate", required = TRUE)
source_python("scripts/lib/utils.py")

output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path
id <- jsonlite::read_json("datapackage.json")$resources[[1]]$id

res <- upload_resource(output, 
                       resource_id = id, 
                       url = Sys.getenv("DADOSMG_DEV_HOST"), 
                       key = Sys.getenv("DADOSMG_DEV"))

stopifnot(check_upload(file = output, url = res$url))
