#' convert hscode to Chinese name or English name
#'
#' @param x a character vector hscode
#' @param locale Chinese name or English
#'
#' @return a character vector
#' @export
#'
#' @examples
#' parse_hscode(c("01", "02", "0101290000"))
parse_hscode <- function(x, locale = "Chinese") {
  stopifnot(all(grepl("^\\d{2,11}$", x)))
  locale <- match.arg(locale, c("Chinese", "English"))

  if (!all(is.character(x))) {
    x <- as.character(x)
  }

  # fixed hscode length
  hs_length <- nchar(x)
  if(!all(hs_length %% 2 == 0)) {
    index <- which(hs_length %% 2 != 0)
    fixed_hs <- unlist(lapply(index, function(i) {
      substr(x[i], 1, (nchar(x[i]) - 1))
    }))
    x[index] <- fixed_hs
  }

  hs_dic <- .full_hscode_tbl$hscode
  if (locale == "Chinese") {
    names(hs_dic) <- .full_hscode_tbl$hscode_name.C
  } else {
    names(hs_dic) <- .full_hscode_tbl$hscode_name.E
  }
  names(unlist(lapply(x, function(x) which(hs_dic == x))))
}
