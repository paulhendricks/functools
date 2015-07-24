library(functools)
context("Partial()")

test_that("Produces the correct output.", {
  expect_equal(Partial(), 1)
})

test_that("Produces the correct output type.", {
  expect_is(Partial(), "integer")
})

test_that("Produces the correct errors.", {
  expect_error(Partial()())
})
