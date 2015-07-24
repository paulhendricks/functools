library(functools)
context("Reject()")

new_function <- function(x) x < 5
foo <- 1:10
test_that("Produces the correct output.", {
  expect_equal(Reject(new_function, foo), Filter(Negate(new_function), foo))
})

test_that("Produces the correct output type.", {
  expect_equal(1, 1)
})

test_that("Produces the correct errors.", {
  expect_equal(1, 1)
})
