compact <- function(x) Filter(Negate(is.null), x)
foo <- list(NULL, 1, 5, NULL)
compact(foo)
