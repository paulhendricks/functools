#' Wrapper for lapply function.
#'
#' Wrapper for \code{\link[base]{lapply}}.
#'
#' @param f a function.
#' @param x a value.
#' @param ... optional arguments to f.
#' @family functionals
#' @seealso \code{\link[base]{lapply}} for code and documentation.
#' @export
Lapply <- function(f, x, ...) {
  return(lapply(X = x, FUN = f, ...))
}
