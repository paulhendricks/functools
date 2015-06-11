#' Not
#'
#' \code{Not()}
#'
#' @param f a predicate function.
#' @return a function.
#' @examples
#' # comment here
#'
Not <- function(f) {
  force(f)
  function(...) {
    !f(...)
  }
}
