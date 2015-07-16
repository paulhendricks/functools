#' Lapply
#'
#' \code{Lapply}
#'
#' @param f a function.
#' @param x a value.
#' @param ... optional arguments to f.
#' @return a list.
#' @examples
#' # Some examples
#'
#'
#'
#' @export
Lapply <- function(f, x, ...) {
  return(lapply(X = x, FUN = f, ...))
}
