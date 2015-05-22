#' functools: A package for implementing functional programming in R.
#'
#' @docType functools
#' @name functools
NULL

#' Negate
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

#' Compact
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
Compact <- function(x) Filter(Negate(is.null), x)

#' Splat
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
Splat <- function(f) {
  force(f)
  function(vector) {
    return(f(vector))
  }
}

#' Plucker
#'
#' \code{negate()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Plucker <- function(field) {
  function(obj) {
    if (is.null(obj[[field]])) stop(paste0(field, " does not exist."))
    obj[[field]]
  }
}

