#' Compose
#'
#' \code{Compose()} takes two functions and composes them.
#'
#' @param f a function.
#' @param g a function.
#' @return a function.
#' @examples
#' # Compose a function using length and unique
#' lu <- Compose(length, unique)
#' lu(c(1:10, 5:15, 20:25))
Compose <- function(f, g) {
  force(f); f <- match.fun(f)
  force(g); g <- match.fun(g)
  return(function(...) f(g(...)))
}
