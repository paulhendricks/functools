#' Create new predicate functions
#'
#' @param ... n functions to apply in order from right to left
#'
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





