#' Lapply
#'
#' \code{Lapply}
#'
#' @param f a function.
#' @param check a function.
#' @param init a value.
#' @return a list.
#' @examples
#' Some examples:
#'
#'
#'
#' @export
Lapply <- function(f, x, ...) {
  return(lapply(X = x, FUN = f, ...))
}
