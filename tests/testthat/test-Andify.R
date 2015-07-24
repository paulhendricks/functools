library(functools)
context("Andify()")

test_that("Produces the correct output.", {
  expect_equal(Andify(is.numeric, function(x) x < 20)(20), FALSE)
  expect_equal(Andify(is.numeric, function(x) x < 20)(19), TRUE)
})

test_that("Produces the correct output type.", {
  expect_is(Andify(is.numeric, function(x) x < 20), "function")
})

test_that("Produces the correct errors.", {
  expect_error(Andify())
})
