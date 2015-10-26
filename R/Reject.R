#' Reject values for which a predicate function returns TRUE.
#'
#' \code{Reject()} is the opposite of Filter.
#' Reject applies the negation of the unary predicate function .f to each
#' element of .x, coercing to logical if necessary, and returns the subset
#' of .x for which this gives true. Note that possible NA values are currently
#' always taken as false; control over NA handling may be added in the future.
#'
#' @param .x a vector.
#' @param .f a predicate function.
#' @return .x filtered where .f applies
#' @family predicate functionals
#' @examples
#' # Some examples
#' Filter(function(x) x < 5, 1:10)
#' Reject(1:10, function(x) x < 5)
#' @export
Reject <- function (.x, .f) {
  ind <- as.logical(unlist(lapply(.x, base::Negate(.f))))
  return(.x[!is.na(ind) & ind])
}
