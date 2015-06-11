#' Min
#'
#' \code{Min()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Min <- function(x, f) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}
