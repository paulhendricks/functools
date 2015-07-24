library(functools)
context("Memoize()")

test_that("Produces the correct output.", {
  expect_equal(Memoize(), 1)
})

test_that("Produces the correct output type.", {
  expect_is(Memoize(), "integer")
})

test_that("Produces the correct errors.", {
  expect_error(Memoize()())
})
