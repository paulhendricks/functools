#' Min
#'
#' \code{Min()}
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
Min <- function(f, x) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}
