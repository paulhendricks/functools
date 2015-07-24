library(functools)
context("Tapply()")

groups <- as.factor(rbinom(size = 32, n = 10000, prob = 0.1))
test_that("Produces the correct output.", {
  expect_equal(Tapply(length, groups, groups), tapply(groups, groups, length))
})

test_that("Produces the correct output type.", {
  expect_is(Tapply(length, groups, groups), "array")
})

test_that("Produces the correct errors.", {
  expect_error(Tapply(groups, groups, length))
})
