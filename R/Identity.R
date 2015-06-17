#' Identity
#'
#' \code{Identity()} returns itself.
#'
#' @param x an object.
#' @return the object.
#' @examples
#' # Return itself:
#' Identity(5)
#' Identity(mean)
#' Identity(lm(data = mtcars, mpg ~ cyl))
#'
#' @export
Identity <- function(x) {
  return(x)
}
