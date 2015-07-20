#' Predicate function operator that creates new predicate functions linked by the || operator.
#'
#' @param ... n functions to apply in order from right to left
#' @return a function
#' @family predicate function operators
#' @seealso \code{\link{Andify}} to create new predicate functions linked by the && operator.
#' @examples
#' # Examples
#'
#' @export
Orify <- function(...) {
  fs <- lapply(list(...), match.fun)
  first <- fs[[1]]
  rest <- fs[-1]

  function(...) {
    out <- first(...)
    for (f in rest) {
      if (!out) return(FALSE)
      out <- `||`(out, f(...))
    }
    out
  }
}





