#' Repeatedly
#'
#' Explanation
#'
#' @param f a predicate function.
#' @param x a value.
#' @return  something.
#' @examples
#' # Some examples
#'
#'
#'
#' @export
Repeatedly <- function(f, x) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}
