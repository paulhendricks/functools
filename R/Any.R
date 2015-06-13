#' Any
#'
#' Any() is a predicate functional.
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
#' Any(is.numeric, list(NA, 3, NULL)) # TRUE
#' Any(is.numeric, list(NA, "3", NULL, 5)) #TRUE
#'
#' # Use na.rm = TRUE to remove NULLS
#' Any(Identity, list(NA, FALSE)) # NA
#' Any(Identity, list(NA, FALSE), na.rm = TRUE) # FALSE
Any <- function(f, x, ..., na.rm = FALSE) {
  f <- match.fun(f)
  return(any(vapply(x, f, logical(1), ...), na.rm = na.rm))
}
