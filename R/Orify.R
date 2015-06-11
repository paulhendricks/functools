#' Orify
#'
#' \code{Orify()}
#'
#' @param f a predicate function.
#' @param g a predicate function.
#' @return a function.
#' @examples
#' # comment here
#'
Orify <- function(f, g) {
  force(f); force(g)
  function(...) {
    f(...) && g(...)
  }
}
