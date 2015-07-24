library(functools)
context("Reduce_Right()")

test_that("Produces the correct output.", {
  expect_equal(Reduce_Right(), 1)
})

test_that("Produces the correct output type.", {
  expect_is(Reduce_Right(), "integer")
})

test_that("Produces the correct errors.", {
  expect_error(Reduce_Right()())
})
