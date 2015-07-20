#' Max
#'
#' \code{Max()}
#'
#' @param f a predicate function.
#' @param x a value.
#' @return  something.
#' @family aggregate functions
#' @examples
#' # Some examples
#'
#'
#'
#' @export
Max <- function(f, x) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}
