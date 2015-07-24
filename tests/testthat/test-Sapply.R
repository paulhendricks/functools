library(functools)
context("Sapply()")

x <- list(a = runif(10000),
          beta = rexp(10000),
          logic = sample(x = c(TRUE, FALSE), size = 10000, replace = TRUE))
test_that("Produces the correct output.", {
  expect_equal(Sapply(quantile, x), sapply(x, quantile))
  expect_equal(Sapply(min, x), sapply(x, min))
  expect_equal(Sapply(max, x), sapply(x, max))
})

test_that("Produces the correct output type.", {
  expect_is(Sapply(quantile, x), "matrix")
  expect_is(Sapply(min, x), "numeric")
  expect_is(Sapply(max, x), "numeric")
})

test_that("Produces the correct errors.", {
  expect_error(Sapply(x, quantile))
  expect_error(Sapply(x, min))
  expect_error(Sapply(x, max))
})
