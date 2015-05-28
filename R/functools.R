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
#'
#' # Create a function that evalues the even-ness of a number
#' is_even <- function(n) return(n %% 2 == 0)
#' is_even(4)
#' is_even(5)
#' # Use Negate to create a function that evaluates the odd-ness of a number
#' is_odd <- Negate(is_even)
#' is_odd(4)
#' is_odd(5)
Negate <- function(f) {
  force(f)
  function(...) !f(...)
}

#' Compact
#'
#' \code{Compact()} takes a vector x and returns it with all NULL values filtered out.
#'
#' @param x a vector.
#' @examples
#' # Removes all null elements from a vector:
#' a <- list(NULL, 1, 5, NULL)
#' Compact(a)
#'
#' b <- c(1, 2, 0, 4, NULL, 1, 3, NULL)
#' Compact(b)
#'
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

#' Withdraw
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
Withdraw <- function(obj, variables) {
  if (length(variables) == 1) return(obj[[variables]])
  Withdraw(obj[[variables[1]]], variables[-1])
}

#' Best
#'
#' \code{best()} takes a vector and a two-argument function that returns a logical constant (either TRUE or FALSE),
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
Best <- function(x, fun) {
  return(Reduce(function(x, y) {
    return(ifelse(fun(x, y), x, y))
  }, x))
}

#' Min
#'
#' \code{Min()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Min <- function(x) {
  return(Reduce(function(x, y) {
    return(ifelse(x > y, x, y))
  }, x))
}

#' Max
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Max <- function(obj, variables) {
  if (length(variables) == 1) return(obj[[variables]])
  Withdraw(obj[[variables[1]]], variables[-1])
}

#' Failwith
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Failwith <- function(default = NULL, f, quiet = FALSE) {
  force(f)
  function(...) {
    out <- default
    try(out <- f(...), silent = quiet)
    out
  }
}

#' Compose
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Compose length and unique
#' lu <- Compose(length, unique)
#' lu(c(1:10, 5:15, 20:25))
Compose <- function(f, g) {
  function(...) f(g(...))
}


