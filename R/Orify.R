#' Create new predicate functions
#'
#' @param ... n functions to apply in order from right to left
#'
#' @examples
#' # Examples
#' even_number_between_10_and_100 <- Orify(is.numeric, function(x) x > 10, function(x) x < 100, function(x) x %% 2 == 0)
#' even_number_between_10_and_100(8) # FALSE
#' even_number_between_10_and_100(9) # FALSE
#' even_number_between_10_and_100(10) # FALSE
#' even_number_between_10_and_100(11) # FALSE
#' even_number_between_10_and_100(12) # TRUE
#' even_number_between_10_and_100(49) # FALSE
#' even_number_between_10_and_100(50) # TRUE
#' even_number_between_10_and_100(100) # FALSE
#' even_number_between_10_and_100(101) # FALSE
#' even_number_between_10_and_100(102) # FALSE
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
      out <- Or(out, f(...))
    }
    out
  }
}





