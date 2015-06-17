#' Failwith
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of Failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param default default value.
#' @param f any function that throws an error.
#' @param silent logical: should the report of error messages be suppressed?.
#' @return a function that returns a default value when there's an error.
#' @examples
#' Some examples:
#'
#'
#'
#' @export
Failwith <- function(default = NULL, f, silent = FALSE) {
  force(f); f <- match.fun(f)
  return(function(...) {
    out <- default
    try(out <- f(...), silent = silent)
    return(out)
  })
}
