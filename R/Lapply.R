#' Wrapper for lapply function.
#'
#' Wrapper for \code{\link[base]{lapply}}.
#'
#' @param f A function.
#' @param x A value.
#' @param ... Optional arguments to f.
#' @family functionals
#' @seealso \code{\link[base]{lapply}} for code and documentation.
#' @export
Lapply <- function(f, x, ...) {
  return(lapply(X = x, FUN = f, ...))
}
