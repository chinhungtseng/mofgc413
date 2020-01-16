str2regex <- function(x, sep = ",", sub = 1e2, start = "^", end = "") {
  tmp <- trimws(unlist(strsplit(x, sep)))
  tmp <- unique(substr(tmp, 1, sub))
  tmp <- tmp[tmp != ""]
  paste0(start, tmp, end, collapse = "|")
}
