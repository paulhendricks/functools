#' Max
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#' @export
Max <- function(x, f) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}
