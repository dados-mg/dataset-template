read <- function(path) {
  readr::read_csv2(path, 
                   col_types = c("dcl"), 
                   locale = locale(decimal_mark = ","))
}

check_upload <- function(file, url) {
  file_hash <- digest::digest(file, file = TRUE)
  
  tmp <- tempfile()
  download.file(url, tmp)
  url_hash <- digest::digest(tmp, file = TRUE)
  unlink(tmp)  
  
  file_hash == url_hash
}
