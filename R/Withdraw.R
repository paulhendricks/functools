#' Withdraw
#'
#'
#' @param obj a predicate function.
#' @param fields a character vector of fields.
#' @return  the negation of that function.
#' @examples
#' Some examples:
#'
#'
#'
#'
Withdraw <- function(obj, fields) {
  if (length(fields) == 1) {
    return(obj[[fields]])
  } else {
    return(Withdraw(obj[[fields[1]]], fields[-1]))
  }
}
