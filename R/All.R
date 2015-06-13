#' All
#'
#' All() is a predicate functional.
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
#' All(is.numeric, list(NA, 3, NULL)) # FALSE
#' All(is.numeric, list(NA, "3", NULL, 5)) # FALSE
#'
#' # Use na.rm = TRUE to remove NULLS
#' All(Identity, list(NA, TRUE)) # NA
#' All(Identity, list(NA, TRUE), na.rm = TRUE) # TRUE
All <- function(f, x, ..., na.rm = FALSE) {
  f <- match.fun(f)
  return(all(vapply(x, f, logical(1), ...), na.rm = na.rm))
}
