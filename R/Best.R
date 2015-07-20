#' Best
#'
#' \code{Best()} takes a vector and a two-argument function that returns
#' a logical constant (either TRUE or FALSE), and returns that function
#' reduced over that vector.
#'
#' @param f a function.
#' @param x a value.
#' @return  a two-argument function that returns a logical constant.
#' @family aggregate functions
#' @examples
#' # Simulate the behavior of max with numerics
#' Best(function(x, y) return(x > y), 1:10)
#' # Simulate the behavior of min with numerics
#' Best(function(x, y) return(x < y), 1:10)
#' # This comparison function prefers values that begin with l
#' Best(function(x, y) return(x[1] == "l"), letters)
#' @export
Best <- function(f, x) {
  f <- match.fun(f)
  return(Reduce(function(x, y) ifelse(f(x, y), x, y), x))
}
