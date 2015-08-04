#' Find the best value in a vector.
#'
#' \code{Best()} takes a vector \code{.x} and a binary predicate function
#' \code{.f} and returns the result of \code{.f} reduced over \code{.x}.
#'
#' @param .f A binary predicate function.
#' @param .x A vector.
#' @return The best value in that vector, as determined by the binary predicate function.
#' @family aggregate functionals
#' @examples
#' # Simulate the behavior of max with numerics
#' Best(function(x, y) return(x > y), 1:10)
#' # Simulate the behavior of min with numerics
#' Best(function(x, y) return(x < y), 1:10)
#' # This comparison function prefers values that begin with l
#' Best(function(x, y) return(x[1] == "l"), letters)
#' @export
Best <- function(.f, .x) {
  .f <- match.fun(.f)
  return(Reduce(function(.y, .z) ifelse(.f(.y, .z), .y, .z), .x))
}
