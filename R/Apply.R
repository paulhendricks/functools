#' Apply
#'
#' Wrapper for \code{\link[base]{apply}}.
#'
#' @param f the function to be applied.
#' @param x an array, including a matrix.
#' @param margin a vector giving the subscripts which the function will be applied over.
#' @param ... optional arguments to f.
#' @seealso \code{\link[base]{apply}} for code and documentation.
#' @export
Apply <- function(f, x, margin, ...) {
  return(apply(X = x, MARGIN = margin, FUN = f, ...))
}
