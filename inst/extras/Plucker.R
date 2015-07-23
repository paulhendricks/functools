#' Create a function that plucks a field from S3 and S4 objects.
#'
#' \code{Plucker} is a convenience function that when passed a character
#' vector as an argument, will return a function that "plucks" objects
#' from S3 and S4 object slots!
#'
#' @param field a character vector.
#' @return  a function that plucks fields from S3 and S4 object slots.
#' @family closures
#' @examples
#' # Pluck a value from a list or S3 object:
#' new_model <- lm(mtcars, formula = hp ~ wt)
#' getCoefficients <- Plucker("coefficients")
#' getCoefficients(new_model)
#'
#' @export
Plucker <- function(field) {
  return(function(obj) {
    if (is.null(obj[[field]])) stop(paste0(field, " does not exist."))
    obj[[field]]
  })
}
