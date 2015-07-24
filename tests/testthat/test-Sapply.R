library(functools)
context("Sapply()")

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
test_that("Produces the correct output.", {
  expect_equal(Sapply(quantile, x), sapply(x, quantile))
})

test_that("Produces the correct output type.", {
  expect_is(Sapply(quantile, x), "matrix")
})

test_that("Produces the correct errors.", {
  expect_error(Sapply(x, quantile))
})
