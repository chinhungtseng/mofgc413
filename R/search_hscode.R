#' Search HS Code Chinese name
#'
#' @param x a character, 2 - 11 digits hscode
#' @param strict strict hscode
#'
#' @return data.frame
#' @export
#'
#' @examples
#' search_hscode("0101")
search_hscode <- function(x, strict = FALSE) {
  x <- as.character(unlist(x))
  end <- ifelse(strict, "$", "")

  if (all(grepl("^\\d+$", x))) {
    if (strict) x <- unlist(lapply(x, hirahscode))
    patterns <- str2regex(x, end = end)
    tibble::as_tibble(.full_hscode_tbl[grepl(patterns, .full_hscode_tbl$hscode), ])
  } else {
    patterns <- str2regex(x, start = "", end = "")
    tibble::as_tibble(.full_hscode_tbl[grepl(patterns, .full_hscode_tbl$hscode_name.C), ])
  }
}

hirahscode <- function(x) {
  if (nchar(x) %% 2 != 0) {
    x <- substr(x, 1, (nchar(x) - 1))
  }
  output <- list(x)
  while (nchar(x) > 2) {
    x <- substr(x, 1, nchar(x) - 2)
    output <- append(list(x), output)
  }
  unlist(output)
}
