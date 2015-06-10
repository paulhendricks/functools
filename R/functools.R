#' functools: A package for implementing Higher Order Functions in R.
#'
#' @docType functools
#' @name functools
NULL

#' Splat
#'
#' \code{negate()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Splat <- function(f) {
  force(f); f <- match.fun(f)
  return(function(vector) {
    return(f(vector))
  })
}

#' Plucker
#'
#' \code{negate()} takes a function that returns a logical vector (a predicate function), and returns the negation of that function.
#' This can be a useful shortcut when a function returns the opposite of what you need.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Pluck a value from a list or S3 object:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Plucker <- function(field) {
  return(function(obj) {
    if (is.null(obj[[field]])) stop(paste0(field, " does not exist."))
    obj[[field]]
  })
}

#' Withdraw
#'
#'
#' @param obj a predicate function.
#' @param fields a character vector of fields.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Withdraw <- function(obj, fields) {
  if (length(fields) == 1) {
    return(obj[[fields]])
  } else {
    return(Withdraw(obj[[fields[1]]], fields[-1]))
  }
}

#' Finder
#'
#' \code{Finder()} takes a vector and a two-argument function that returns a logical constant (either TRUE or FALSE),
#' and returns the that function reduced over that vector. It is assumed that:
#' * The two-argument function evaluates its two arguments and returns TRUE if the first argument is "better" than the second argument.
#' * The two-argument function knows how to "unwrap" its arguments.
#'
#' @param x a vector.
#' @return  a two-argument function that returns a logical constant.
#' @examples
#' Some examples:
#'
#'
#'
#'
Finder <- function(x, f) {
  force(f); f <- match.fun(f)
  return(Reduce(function(x, y) {
    return(ifelse(f(x, y), x, y))
  }, x))
}

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
Best <- function(x, f) {
  force(f); f <- match.fun(f)
  return(Reduce(function(x, y) {
    return(ifelse(f(x, y), x, y))
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
#' Some examples:
#'
#'
#'
#'
Min <- function(x, f) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}

#' Max
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Max <- function(x, f) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}

#' Repeat
#'
#' \code{Repeat()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Repeat <- function(f, x) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}

#' Repeatedly
#'
#' \code{Repeat()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Repeatedly <- function(f, x) {
  force(f); f <- match.fun(f)
  return(1L) # Placeholder
}

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

#' Apply
#'
#' \code{Apply}
#'
#' @param f a function.
#' @param check a function.
#' @param init a valie.
#' @return a list.
#' @examples
#' Some examples:
#'
#'
#'
#'
Apply <- function(f, x, margin, ...) {
  return(apply(X = x, MARGIN = margin, FUN = f, ...))
}

#' Lapply
#'
#' \code{Lapply}
#'
#' @param f a function.
#' @param check a function.
#' @param init a value.
#' @return a list.
#' @examples
#' Some examples:
#'
#'
#'
#'
Lapply <- function(f, x, margin, ...) {
  return(lapply(X = x, FUN = f, ...))
}

#' Value Matching
#'
#' %notin% is a more intuitive interface as a binary operator, which returns a logical vector indicating if there is a match or not for its left operand.
#'
#' @param x vector or NULL: the values to be matched. Long vectors are supported.
#' @param table vector or NULL: the values to be matched against. Long vectors are not supported
#' @return A vector of the same length as x.
#' @examples
#' # Some examples:
#' "bc" %notin% letters # TRUE
#' "b" %notin% letters # FALSE
#' "c" %notin% letters # FALSE
#'
`%notin%` <- Negate(`%in%`)

