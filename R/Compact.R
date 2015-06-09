#' Compact
#'
#' \code{Compact()} takes a vector x and returns it with all NULL and NA values filtered out.
#'
#' @param x a vector.
#' @examples
#' # Removes all null elements from a vector:
#' a <- list(NULL, 1, 5, NULL)
#' Compact(a)
#'
#' b <- c(1, 2, 0, 4, NULL, 1, 3, NULL)
#' Compact(b)
#'
Compact <- function(x) return(Filter(Existy, x))
