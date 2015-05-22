#' functools: A package for implementing functional programming in R.
#'
#' @docType functools
#' @name functools
NULL

#' negate
#'
#' \code{negate()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#' compact <- function(x) Filter(Negate(is.null), x)
#' foo <- list(NULL, 1, 5, NULL)
#' compact(foo)
Negate <- function(f) {
  force(f)
  function(...) !f(...)
}
