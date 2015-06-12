#' Value Matching
#'
#' %notin% is a more intuitive interface as a binary operator, which returns a logical vector indicating if there is a match or not for its left operand.
#'
#' @param x vector or NULL: the values to be matched. Long vectors are supported.
#' @param table vector or NULL: the values to be matched against. Long vectors are not supported
#' @return A vector of the same length as x.
#' @examples
#' # Some examples:
#' "bc" %notin% letters # TRUE
#' "b" %notin% letters # FALSE
#' "c" %notin% letters # FALSE
#'
`%notin%` <- Negate(`%in%`)
