#' functools: A package for implementing functional programming in R.
#'
#' @docType functools
#' @name functools
NULL

#' False
#'
#' \code{False()} is a function that returns FALSE.
#'
#' @return FALSE.
#' @examples
#' # False() returns FALSE:
#' False()
False <- function() {
  return(FALSE)
}

#' Null
#'
#' \code{Null()} is a function that returns NULL.
#'
#' @return NULL.
#' @examples
#' # Null() returns NULL:
#' Null()
Null <- function() {
  return(NULL)
}

#' Na
#'
#' \code{Na()} is a function that returns NA.
#'
#' @return NA.
#' @examples
#' # Na() returns NA:
#' Na()
Na <- function() {
  return(NA)
}

#' Existy
#'
#' \code{Existy()} returns TRUE or FALSE if an object exists or not.
#' An object exists if it is not NULL or NA.
#'
#' @param x an object.
#' @return a logical value.
#' @examples
#' # Some examples:
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
#' \code{Truthy()} returns TRUE or FALSE if an object is TRUE or not.
#' An object is is "TRUE" if it is exists and is TRUE.
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
  return(Existy(x) && x == True())
}

#' Any
#'
#' \code{Any()}
#'
#' @param x an object.
#' @param f a predicate function.
#' @return a logical value.
#' @examples
#' # comment here
#' Any(is.numeric, mtcars) # TRUE
#' Any(is.character, mtcars) # FALSE
#' mtcars$am <- factor(mtcars$am)
#' Any(is.numeric, mtcars) # TRUE
#' Any(is.factor, mtcars) # TRUE
#'
#' # Handles NAs and NULLs
#' Any(is.numeric, list(NA, "3", NULL)) # FALSE
#' Any(is.numeric, list(NA, "3", NULL, 5)) #TRUE
#'
#' # Use na.rm = TRUE to remove NULLS
#' Any(Identity, list(NA, FALSE)) # NA
#' Any(Identity, list(NA, FALSE), na.rm = TRUE) # FALSE
Any <- function(f, x, na.rm = FALSE) {
  force(f); f <- match.fun(f)
  return(any(vapply(x, f, logical(1)), na.rm = na.rm))
}

#' All
#'
#' \code{All()}
#'
#' @param x an object.
#' @param f a predicate function.
#' @return a logical value.
#' @examples
#' # comment here
#' All(is.numeric, mtcars) # TRUE
#' All(is.character, mtcars) # FALSE
#' mtcars$am <- factor(mtcars$am)
#' All(is.numeric, mtcars) # FALSE
#' All(is.factor, mtcars) # FALSE
#'
#' # Handles NAs and NULLs
#' All(is.numeric, list(NA, "3", NULL)) # FALSE
#' All(is.numeric, list(NA, "3", NULL, 5)) # FALSE
#'
#' # Use na.rm = TRUE to remove NULLS
#' All(Identity, list(NA, TRUE)) # NA
#' All(Identity, list(NA, TRUE), na.rm = TRUE) # TRUE
All <- function(f, x, na.rm = FALSE) {
  force(f); f <- match.fun(f)
  return(all(vapply(x, f, logical(1)), na.rm = na.rm))
}

#' Partial apply a function, filling in some arguments.
#'
#' Partial function application allows you to modify a function by pre-filling some of the arguments. It is particularly useful in conjunction with functionals and other function operators.
#'
#' @param _f a function. For the output source to read well, this should be an be a named function. This argument has the weird (non-syntactic) name _f so it doesn't accidentally capture any argument names begining with f.
#' @param ... named arguments to f that should be partially applied.
#' @param .env the environment of the created function. Defaults to parent.frame and you should rarely need to modify this.
#' @param .lazy If TRUE arguments evaluated lazily, if FALSE, evaluated when partial is called.
#' @examples
#' Some examples:
#'
#'
#'
#'
Partial <- function (`_f`, ..., .env = parent.frame(), .lazy = TRUE)
{
  stopifnot(is.function(`_f`))
  if (.lazy) {
    fcall <- substitute(`_f`(...))
  }
  else {
    fcall <- make_call(substitute(`_f`), .args = list(...))
  }
  fcall[[length(fcall) + 1]] <- quote(...)
  args <- list(... = quote(expr = ))
  make_function(args, fcall, .env)
}

#' make_function
#'
#' \code{Compact()} takes a vector x and returns it with all NULL and NA values filtered out.
#'
#' @param x a vector.
#' @examples
#' Some examples:
#'
#'
#'
#'
make_function <- function (args, body, env = parent.frame())
{
  args <- as.pairlist(args)
  stopifnot(all_named(args), is.language(body))
  env <- to_env(env)
  eval(call("function", args, body), env)
}

#' make_call
#'
#' \code{Compact()} takes a vector x and returns it with all NULL and NA values filtered out.
#'
#' @param x a vector.
#' @examples
#' Some examples:
#'
#'
#'
#'
make_call <- function (f, ..., .args = list()) {
  if (is.character(f))
    f <- as.name(f)
  as.call(c(f, ..., .args))
}

#' Compact
#'
#' \code{Compact()} takes a vector x and returns it with all NULL and NA values filtered out.
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
Compact <- function(x) return(Filter(Existy, x))

#' Reject
#'
#' \code{Reject()} takes a vector x and returns it with all NULL values filtered out.
#'
#' @param x a vector.
#' @examples
#' Some examples:
#'
#'
#'
#'
Reject <- function (f, x)
{
  ind <- as.logical(unlist(lapply(x, Negate(f))))
  x[!is.na(ind) & ind]
}

#' Failwith
#'
#' \code{Failwith()} turns a function that throws an error into a function that returns a default value when there’s an error.
#' The essence of failwith() is simple; it’s just a wrapper around try(), the function that captures errors and allows execution to continue.
#'
#' @param default default value.
#' @param f any function that throws an error.
#' @param silent logical: should the report of error messages be suppressed?.
#' @return a function that returns a default value when there's an error.
#' @examples
#' Some examples:
#'
#'
#'
#'
FailWith <- function(default = NULL, f, silent = FALSE) {
  force(f); f <- match.fun(f)
  return(function(...) {
    out <- default
    try(out <- f(...), silent = silent)
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

