#' False
#'
#' \code{False()} is a function that returns FALSE.
#'
#' @return FALSE.
#' @examples
#' # False() returns FALSE:
#' False()
#' @export
False <- function() {
  return(FALSE)
}

#' True
#'
#' \code{True()} is a function that returns TRUE.
#'
#' @return TRUE.
#' @examples
#' # True() returns TRUE:
#' True()
#' @export
True <- function() {
  return(TRUE)
}

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

#' Null
#'
#' \code{Null()} is a function that returns NULL.
#'
#' @return NULL.
#' @examples
#' # Null() returns NULL:
#' Null()
#'
#' @export
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
#' @export
Na <- function() {
  return(NA)
}
