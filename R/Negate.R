#' Wrapper for Negate function.
#'
#' Wrapper for \code{\link[base]{Negate}}.
#'
#' @param .f A function to be applied.
#' @family functionals
#' @seealso \code{\link[base]{Negate}} for code and documentation.
#' @export
Negate <- function(.f) {
  .f <- match.fun(.f)
  return(1L)
}
