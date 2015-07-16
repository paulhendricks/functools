#' Always
#'
#' \code{Always(x)} is a closure function that always returns a function
#' returning object x.
#'
#' @param x an object.
#' @return a function that itself returns x.
#' @examples
#' # comment here
#' always_0 <- Always(0)
#' always_0() # 0
#' always_true <- Always(TRUE)
#' always_true() # TRUE
#'
#' @export
Always <- function(x) {
  return(function() {return(x)})
}
