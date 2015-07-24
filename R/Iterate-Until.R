#' Iterate until conpletion.
#'
#' \code{Iterate_Until}
#'
#' @param f a function.
#' @param check a function.
#' @param init a valie.
#' @return a list.
#' @examples
#' # Iterate until the check condition is met
#' Iterate_Until(function(n) { return(n + n) },
#' function(n) { return(n <= 1024) },
#' 1)
#'
#' @export
Iterate_Until <- function(f, check, init) {
  f <- match.fun(f)
  check <- match.fun(check)
  ret <- list()
  result <- f(init)
  while(check(result)) {
    ret <- c(ret, result)
    result <- f(result)
  }
  return(ret)
}
