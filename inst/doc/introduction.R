## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(functools)

## ------------------------------------------------------------------------
lu <- Compose(length, unique)

lu(sample(x = 1:10, size = 10000, replace = TRUE))

