#' Search HS Code Chinese name
#'
#' @param hscode a character, 2 - 11 digits hscode
#' @param chinese Chinese key word
#'
#' @return data.frame
#' @export
#'
#' @examples
#' search_hscode("0101")
search_hscode <- function(hscode = NULL, chinese = NULL) {
  stopifnot(
    !is.null(hscode) & is.null(chinese) |
      is.null(hscode) & !is.null(chinese)
  )
  stopifnot(length(hscode) == 1 | is.null(hscode))

  if (is.null(chinese)) {
    hscode <- as.character(hscode)
    if (nchar(hscode) %% 2 != 0)
      hscode <- substr(hscode, 1, (nchar(hscode) - 1))

    output <- list(hscode)
    while (nchar(hscode) > 2) {
      hscode <- substr(hscode, 1, nchar(hscode) - 2)
      output <- append(list(hscode), output)
    }

    patterns <- str2regex(unlist(output), end = "$")
    tibble::as_tibble(.full_hscode_tbl[grepl(patterns, .full_hscode_tbl$hscode), ])
  } else {
    patterns <- str2regex(unlist(chinese), start = "", end = "")
    tibble::as_tibble(.full_hscode_tbl[grepl(patterns, .full_hscode_tbl$hscode_name.C), ])
  }
}
