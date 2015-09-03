#' Wrapper for Map function.
#'
#' Wrapper for \code{\link[base]{Map}}.
#'
#' @param ... Arguments to vectorize over (vectors or lists of strictly positive length, or all of zero length).
#' @param .f A function to be applied.
#' @family functionals
#' @seealso \code{\link[base]{Map}} for code and documentation.
#' @export
Map <- function(..., .f) {
  return(base::Map(f = .f, ...))
}
