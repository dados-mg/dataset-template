source("scripts/lib/utils.R")

output <- jsonlite::read_json("datapackage.json")$resources[[1]]$path
id <- jsonlite::read_json("datapackage.json")$resources[[1]]$id

res <- ckanr::resource_update(id = id,
                       path = output, 
                       url = Sys.getenv("DADOSMG_DEV_HOST"), 
                       key = Sys.getenv("DADOSMG_DEV"))

stopifnot(check_upload(file = output, url = res$url))
