library(functools)
context("Tapply()")

groups <- as.factor(rbinom(size = 32, n = 10000, prob = 0.1))
n <- 17; fac <- factor(rep(1:3, length = n), levels = 1:5)

test_that("Produces the correct output.", {
  expect_equal(Tapply(length, groups, groups), tapply(groups, groups, length))
  expect_equal(Tapply(sum, 1:n, fac), tapply(1:n, fac, sum))
  expect_equal(Tapply(sum, 1:n, fac, simplify = FALSE), tapply(1:n, fac, sum, simplify = FALSE))
  expect_equal(Tapply(range, 1:n, fac), tapply(1:n, fac, range))
  expect_equal(Tapply(quantile, 1:n, fac), tapply(1:n, fac, quantile))
})

test_that("Produces the correct output type.", {
  expect_is(Tapply(length, groups, groups), "array")
  expect_is(Tapply(sum, 1:n, fac), "array")
  expect_is(Tapply(sum, 1:n, fac, simplify = FALSE), "array")
  expect_is(Tapply(range, 1:n, fac), "array")
  expect_is(Tapply(quantile, 1:n, fac), "array")
})

test_that("Produces the correct errors.", {
  expect_error(Tapply(groups, groups, length))
})
