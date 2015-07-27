#' Memoise a function.
#'
#' Wrapper for \code{\link[memoise]{memoise}}.
#'
#' @param f Function of which to create a memoised copy.
#' @return A memoised copy of the original function.
#' @family function operators
#' @seealso \code{\link[memoise]{memoise}} for code and documentation.
#' @export
Memoise <- function(f) {
  if (!requireNamespace("memoise", quietly = TRUE)) {
    stop("memoise needed for this function to work. Please install it.",
         call. = FALSE)
  }
  return(memoise::memoise(f))
}

