#' Apply
#'
#' \code{Apply}
#'
#' @param f the function to be applied.
#' @param x an array, including a matrix.
#' @param margin a vector giving the subscripts which the function will be applied over.
#' @param ... optional arguments to f.
#' @return something.
#' @examples
#' # Some examples
#'
#'
#'
#' @export
Apply <- function(f, x, margin, ...) {
  return(apply(X = x, MARGIN = margin, FUN = f, ...))
}
