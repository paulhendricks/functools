#' functools: A package for implementing functional programming in R.
#'
#' @docType functools
#' @name functools
NULL

#' Identity
#'
#' \code{Identity()}
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#'
Identity <- function(x) {
  return(x)
}

#' True
#'
#' \code{True()}
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#'
True <- function() {
  return(TRUE)
}

#' False
#'
#' \code{False()}
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#'
False <- function() {
  return(FALSE)
}

#' Null
#'
#' \code{Null()}
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#'
Null <- function() {
  return(NULL)
}

#' Na
#'
#' \code{Null()}
#'
#' @param f a predicate function.
#' @return  the negation of that function.
#' @examples
#' # Create a function, compact(), that removes all null elements from a list:
#'
Na <- function() {
  return(NA)
}

#' Existy
#'
#' \code{Existy()}
#'
#' @param x an object.
#' @return a logical value.
#' @examples
#' # Returns if a value exists or not:
#' Existy(4) # TRUE
#' Existy("foo") # TRUE
#' Existy(NULL) # FALSE
#' Existy(NA) # FALSE
#'
#' # Works with lists
#' Exist(list(4, "foo", NULL, NA)) # TRUE
#' Existy(list(4, "foo")) # TRUE
#' Existy(list(NULL, NA)) # TRUE
#' Existy(list(NULL)) # TRUE
#' Existy(list(NA)) # FALSE
#'
#' # Works with applying over lists
#' lapply(list(4, "foo", NULL, NA), Existy) # TRUE, TRUE, FALSE, FALSE
Existy <- function(x) {
  return(!is.null(x) && !is.na(x))
}

#' Truthy
#'
#' \code{Truthy()}
#'
#' @param x an object.
#' @return a logical value.
#' @examples
#' # Returns if a value exists or not:
#' Truthy(TRUE) # TRUE
#' Truthy(FALSE) # FALSE
#' Truthy(NULL) # FALSE
#' Truthy(NA) # FALSE
#' Truthy(2L) # TRUE
#' Truthy(1L) # TRUE
#' Truthy(0L) # FALSE
#' Truthy("a") # TRUE
#'
Truthy <- function(x) {
  return(x == True() && Existy(x))
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
Compact <- function(x) return(Filter(Negate(is.null), x))

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
  force(f); f <- match.fun(f)
  return(function(...) {
    out <- default
    try(out <- f(...), silent = quiet)
    return(out)
  })
}

#' Compose
#'
#' \code{Compose()} takes two functions that throws an error into a function that returns a default value when there’s an error.
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
#' # Create a function, compact(), that removes all null elements from a list:
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
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
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
#' # Simulate the behavior of max with numerics
#' Best(1:10, function(x, y) return(x > y))
#' # Simulate the behavior of min with numerics
#' Best(1:10, function(x, y) return(x < y))
#' # This comparison function prefers values that begin with l
#' Best(letters, function(x, y) return(x[1] == "l"))
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
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
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
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
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
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Repeat <- function(x, f) {
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
#' # Create a function, compact(), that removes all null elements from a list:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
Repeatedly <- function(x, f) {
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




