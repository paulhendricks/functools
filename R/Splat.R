#' Splat
#'
#' @param f a predicate function.
#' @return  example.
#' @examples
#' # Some examples
#'
#'
#'
#' @export
Splat <- function(f) {
  f <- match.fun(f)
  return(function(vector) {
    return(f(vector))
  })
}
