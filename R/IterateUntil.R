#' IterateUntil
#'
#' \code{IterateUntil}
#'
#' @param f a function.
#' @param check a function.
#' @param init a valie.
#' @return a list.
#' @examples
#' # Iterate until the check condition is met
#' IterateUntil(function(n) { return(n + n) },
#' function(n) { return(n <= 1024) },
#' 1)
IterateUntil <- function(f, check, init) {
  force(f); f <- match.fun(f)
  force(check); check <- match.fun(check)
  ret <- list()
  result <- f(init)
  while(check(result)) {
    ret <- c(ret, result)
    result <- f(result)
  }
  return(ret)
}
