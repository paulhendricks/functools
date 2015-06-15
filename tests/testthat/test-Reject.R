library(functools)
context("Reject()")

new_function <- function(x) x < 5
foo <- 1:10
test_that("Reject() does opposite of Filter where function is Negate()'d ", {
  expect_equal(Reject(new_function, foo), Filter(Negate(new_function), foo))
})
