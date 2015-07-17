#' Any.
#'
#' \code{Any()} is a predicate functional that takes a predicate function
#' \code{f} and an object \code{x} and loops over each value \code{i} in
#' object \code{x}, evaluates \code{f(i)}, and returns TRUE if any values
#' \code{i} in object \code{x} evaluate as TRUE.
#'
#' @param f a predicate function.
#' @param x an object.
#' @param ... further arguments passed to or from other methods.
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
#' @return a logical value.
#' @examples
#' # comment here
#' data(mtcars)
#' Any(is.numeric, mtcars) # TRUE
#' Any(is.character, mtcars) # FALSE
#' mtcars$am <- factor(mtcars$am)
#' Any(is.numeric, mtcars) # TRUE
#' Any(is.factor, mtcars) # TRUE
#'
#' # Handles NAs and NULLs
#' Any(is.numeric, list(NA, "3", NULL)) # FALSE
#' Any(is.numeric, list(NA, 3, NULL)) # TRUE
#' Any(is.numeric, list(NA, "3", NULL, 5)) #TRUE
#'
#' # Use na.rm = TRUE to remove NULLS
#' Any(Identity, list(NA, FALSE)) # NA
#' Any(Identity, list(NA, FALSE), na.rm = TRUE) # FALSE
#' @export
Any <- function(f, x, ..., na.rm = FALSE) {
  f <- match.fun(f)
  return(any(vapply(x, f, logical(1), ...), na.rm = na.rm))
}
