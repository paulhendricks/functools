library(functools)
context("Tapply()")

groups <- as.factor(rbinom(32, n = 5, prob = 0.4))
test_that("Produces the correct output.", {
  expect_equal(Tapply(length, groups, groups), tapply(groups, groups, length))
})

test_that("Produces the correct output type.", {
  expect_is(Tapply(length, groups, groups), "array")
})

test_that("Produces the correct errors.", {
  expect_error(Tapply(groups, groups, length))
})
