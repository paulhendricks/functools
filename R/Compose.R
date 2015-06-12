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

#' Compose Operator
#'
#' %notin% is a more intuitive interface as a binary operator, which returns a logical vector indicating if there is a match or not for its left operand.
#'
#' @param x vector or NULL: the values to be matched. Long vectors are supported.
#' @param table vector or NULL: the values to be matched against. Long vectors are not supported
#' @return A vector of the same length as x.
#' @examples
#' # Some examples
#' "bc" %notin% letters # TRUE
#' "b" %notin% letters # FALSE
#' "c" %notin% letters # FALSE
#'
`%o%` <- Compose
