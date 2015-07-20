#' Test if all items in an object evaluate to TRUE.
#'
#' \code{All()} is a predicate functional that takes a predicate function
#' \code{f} and an iterable object \code{x} and:
#' \enumerate{
#'   \item iterates over each item \code{i} in object \code{x},
#'   \item evaluates \code{f(i)},
#'   \item and ultimately returns TRUE if all items \code{i} in object \code{x} evaluate as TRUE.
#'   }
#'
#' @param f a predicate function.
#' @param x an iterable object.
#' @param ... further arguments passed to the predicate function.
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds.
#' @return a logical value.
#' @examples
#' # Examples
#' data(mtcars)
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
#' # Use na.rm = TRUE to remove NAs and NULLS
#' All(Identity, list(NA, TRUE)) # NA
#' All(Identity, list(NA, TRUE), na.rm = TRUE) # TRUE
#' @export
All <- function(f, x, ..., na.rm = FALSE) {
  f <- match.fun(f)
  return(all(vapply(x, f, logical(1), ...), na.rm = na.rm))
}
