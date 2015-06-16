#' Best
#'
#' \code{Best()} takes a vector and a two-argument function that returns a logical constant (either TRUE or FALSE),
#' and returns the that function reduced over that vector.
#'
#' @param x a vector.
#' @return  a two-argument function that returns a logical constant.
#' @examples
#' # Simulate the behavior of max with numerics
#' Best(1:10, function(x, y) return(x > y))
#' # Simulate the behavior of min with numerics
#' Best(1:10, function(x, y) return(x < y))
#' # This comparison function prefers values that begin with l
#' Best(letters, function(x, y) return(x[1] == "l"))
Best <- function(f, x) {
  force(f); f <- match.fun(f)
  return(Reduce(function(x, y) {
    return(ifelse(f(x, y), x, y))
  }, x))
}
