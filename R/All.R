#' All
#'
#' \code{All()} is a predicate functional.
#'
#' @param f a predicate function.
#' @param x an object.
#' @param ... further arguments passed to or from other methods.
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
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
#' @export
All <- function(f, x, ..., na.rm = FALSE) {
  f <- match.fun(f)
  return(all(vapply(x, f, logical(1), ...), na.rm = na.rm))
}
