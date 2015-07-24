#' Test if any items in an object evaluate to TRUE.
#'
#' \code{Any()} is a predicate functional that takes a predicate function
#' \code{f} and an iterable object \code{x} and:
#' \enumerate{
#'   \item iterates over each item \code{i} in object \code{x},
#'   \item evaluates \code{f(i)},
#'   \item and ultimately returns TRUE if any items \code{i} in object \code{x} evaluate as TRUE.
#'   }
#'
#' @param f A predicate function.
#' @param x An iterable object.
#' @param ... Further arguments passed to the predicate function.
#' @param na.rm A logical value indicating whether NA values should be stripped before the computation proceeds.
#' @return A logical value indicating if any items evaluated as TRUE.
#' @family predicate functionals
#' @seealso \code{\link{All}} to test if all items in an object evaluate to TRUE.
#' @examples
#' # Examples
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
