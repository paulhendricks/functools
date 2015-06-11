#' And
#'
#' \code{And()}
#'
#' @param f a predicate function.
#' @param g a predicate function.
#' @return a function.
#' @examples
#' # comment here
#'
And <- function(f, g) {
  force(f); force(g)
  function(...) {
    f(...) && g(...)
  }
}
